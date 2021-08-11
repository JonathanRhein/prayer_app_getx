import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:prayer_app_getx/models/databse/agpeya_hour.dart';
import 'package:prayer_app_getx/models/presentation/agpeya_prayer.dart';
import 'package:prayer_app_getx/models/databse/agpeya_structure.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  // Table names
  final String tableAgpeyaHours = 'agpeyaHoursTable';
  final String tableAgpeyaStructure = 'agpeyaStructureTable';
  final String tableAgpeyaPrayers = 'agpeyaPrayersTable';

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'prayer_app.db');

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data =
          await rootBundle.load(join("assets/database", "PrayerApp.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    // open the database
    var db = await openDatabase(path);
    return db;
  }

  // CRUD for agpeyaHourTable

  Future<List<AgpeyaHour>> fetchAgpeyaHours() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableAgpeyaHours);

    // Convert the List<Map<String, dynamic> into a List<AgpeyaHour>
    return List.generate(maps.length, (i) {
      return AgpeyaHour(
        id: maps[i]["id"],
        name: maps[i]["name"],
        isNotification: maps[i]["isNotificationSet"],
        notificationTime: maps[i]["notificationTime"],
        notificationInterval: maps[i]["notificationInterval"],
      );
    });
  }

  Future<List<AgpeyaPrayer>> fetchAgpeyaPrayers(String hour) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.rawQuery('''
          SELECT $tableAgpeyaStructure.id, $tableAgpeyaStructure.name, 
                  hour, section, isEnabled, isBiblical, isMarian
          FROM $tableAgpeyaStructure
          JOIN $tableAgpeyaPrayers 
          ON $tableAgpeyaStructure.name = $tableAgpeyaPrayers.name
          WHERE $tableAgpeyaStructure.hour LIKE "$hour";''');

    // Convert the List<Map<String, dynamic> into a List<AgpeyaPrayer>
    return List.generate(maps.length, (i) {
      return AgpeyaPrayer(
        id: maps[i]["id"],
        name: maps[i]["name"],
        hour: maps[i]["hour"],
        section: maps[i]["section"],
        isEnabled: maps[i]["isEnabled"],
        isBiblical: maps[i]["isBiblical"],
        isMarian: maps[i]["isMarian"],
      );
    });
  }

  Future<void> updateAgpeyaPrayer(AgpeyaPrayer agpeyaPrayer) async {
    final db = await database;

    // Convert the AgpeyaPrayer into an database compatible AgpeyaStructure
    AgpeyaStructure agpeyaStructure = AgpeyaStructure(
        id: agpeyaPrayer.id,
        name: agpeyaPrayer.name,
        hour: agpeyaPrayer.hour,
        section: agpeyaPrayer.section,
        isEnabled: agpeyaPrayer.isEnabled);

    await db.update(
      tableAgpeyaStructure,
      agpeyaStructure.toMap(),
      where: 'id = ?',
      whereArgs: [agpeyaStructure.id],
    );
  }

  Future<bool> checkShowOnlyBiblicalTexts() async {
    final db = await database;

    return Sqflite.firstIntValue(await db.rawQuery('''
        SELECT count(*)
        FROM $tableAgpeyaStructure  
        JOIN $tableAgpeyaPrayers
        ON $tableAgpeyaStructure.name = $tableAgpeyaPrayers.name
        WHERE $tableAgpeyaPrayers.isBiblical = 0
        AND $tableAgpeyaStructure.isEnabled = 1;''')) == 0;
  }

  Future<bool> checkShowMarianTexts() async {
    final db = await database;

    return Sqflite.firstIntValue(await db.rawQuery('''
        SELECT count(*)
        FROM $tableAgpeyaStructure  
        JOIN $tableAgpeyaPrayers
        ON $tableAgpeyaStructure.name = $tableAgpeyaPrayers.name
        WHERE $tableAgpeyaPrayers.isMarian = 1
        AND $tableAgpeyaStructure.isEnabled = 1;''')) > 0;
  }

  Future<void> resetTextsToDefault() async {
    final db = await database;

    await db.rawQuery('''UPDATE $tableAgpeyaStructure 
            SET isEnabled = 1;''');
  }

  Future<void> updateDatabaseWithOption(
      option, showOnlyBiblicalPrayers, showMarianTexts) async {
    final db = await database;

    if (option == Strings.ShowOnlyBiblicalTexts) {
      if (showOnlyBiblicalPrayers) {
        await db.rawQuery('''
            UPDATE $tableAgpeyaStructure 
            SET isEnabled = 0
            WHERE EXISTS (SELECT *
            FROM $tableAgpeyaPrayers
            WHERE ($tableAgpeyaStructure.name = $tableAgpeyaPrayers.name)
            AND ($tableAgpeyaPrayers.isBiblical = 0));''');

        await db.rawQuery('''    
            UPDATE $tableAgpeyaStructure 
            SET isEnabled = 1
            WHERE EXISTS (SELECT *
            FROM $tableAgpeyaPrayers
            WHERE ($tableAgpeyaStructure.name = $tableAgpeyaPrayers.name)
            AND ($tableAgpeyaPrayers.isBiblical = 1));''');
    } else {
        await db.rawQuery('''
            UPDATE $tableAgpeyaStructure 
            SET isEnabled = 1
            WHERE EXISTS (SELECT *
            FROM $tableAgpeyaPrayers
            WHERE ($tableAgpeyaStructure.name = $tableAgpeyaPrayers.name)
            AND ($tableAgpeyaPrayers.isMarian = 0));''');
      }
    } else if (option == Strings.ShowMarianTexts) {
      if (showMarianTexts) {
        await db.rawQuery('''
            UPDATE $tableAgpeyaStructure 
            SET isEnabled = 1
            WHERE EXISTS (SELECT *
            FROM $tableAgpeyaPrayers
            WHERE ($tableAgpeyaStructure.name = $tableAgpeyaPrayers.name)
            AND ($tableAgpeyaPrayers.isMarian = 1));''');
      } else {
        await db.rawQuery('''
            UPDATE $tableAgpeyaStructure 
            SET isEnabled = 0
            WHERE EXISTS (SELECT *
            FROM $tableAgpeyaPrayers
            WHERE ($tableAgpeyaStructure.name = $tableAgpeyaPrayers.name)
            AND ($tableAgpeyaPrayers.isMarian = 1));''');
      }
    }
  }
}
