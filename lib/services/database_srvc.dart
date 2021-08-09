import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:prayer_app_getx/models/databse/agpeya_hour.dart';
import 'package:prayer_app_getx/models/databse/agpeya_structure.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  // Column variables for agpeyaHoursTable
  final String tableAgpeyaHours = 'agpeyaHoursTable';
  final String columnAgpeyaHoursId = 'id';
  final String columnAgpeyaHoursName = 'name';
  final String columnAgpeyaHoursIsNotificationSet = 'isNotificationSet';
  final String columnAgpeyaHoursNotificationTime = 'notificationTime';
  final String columnAgpeyaHoursNotificationInterval = 'notificationInterval';

  // Column variables for agpeyaStructureTable
  final String tableAgpeyaStructure = 'agpeyaStructureTable';
  final String columnAgpeyaStructureId = 'id';
  final String columnAgpeyaStructureHour = 'hour';
  final String columnAgpeyaStructureSection = 'section';
  final String columnAgpeyaStructureName = 'name';
  final String columnAgpeyaStructureIsEnabled = 'isEnabled';

  // Column variables for agpeyaPrayersTable
  final String tableAgpeyaPrayers = 'agpeyaPrayersTable';
  final String columnAgpeyaPrayersId = 'id';
  final String columnAgpeyaPrayersName = 'name';
  final String columnAgpeyaPrayersIsBiblical = 'isBiblical';
  final String columnAgpeyaPrayersIsMarian = 'isMarian';

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

    // Convert the List<Map<String, dynamic> into a List<AgpeyaHour>.
    return List.generate(maps.length, (i) {
      return AgpeyaHour(
        id: maps[i][columnAgpeyaHoursId],
        name: maps[i][columnAgpeyaHoursName],
        isNotification: maps[i][columnAgpeyaHoursIsNotificationSet],
        notificationTime: maps[i][columnAgpeyaHoursNotificationTime],
        notificationInterval: maps[i][columnAgpeyaHoursNotificationInterval],
      );
    });
  }

  Future<List<AgpeyaStructure>> fetchAgpeyaPrayers(String hour) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableAgpeyaStructure,
        columns: [
          columnAgpeyaStructureId,
          columnAgpeyaStructureHour,
          columnAgpeyaStructureSection,
          columnAgpeyaStructureName,
          columnAgpeyaStructureIsEnabled
        ],
        where: 'hour = ?',
        whereArgs: [hour]);

    // Convert the List<Map<String, dynamic> into a List<AgpeyaHour>.
    return List.generate(maps.length, (i) {
      return AgpeyaStructure(
        id: maps[i][columnAgpeyaStructureId],
        hour: maps[i][columnAgpeyaStructureHour],
        section: maps[i][columnAgpeyaStructureSection],
        name: maps[i][columnAgpeyaStructureName],
        isEnabled: maps[i][columnAgpeyaStructureIsEnabled],
      );
    });
  }

  Future<void> updateAgpeyaPrayer(AgpeyaStructure agpeyaPrayer) async {
    final db = await database;

    await db.update(
      tableAgpeyaStructure,
      agpeyaPrayer.toMap(),
      where: 'id = ?',
      whereArgs: [agpeyaPrayer.id],
    );
  }

  Future<void> updateDatabaseWithOption(
      option, showOnlyBiblicalPrayers, showMarianTexts, showAllPrayers) async {
    final db = await database;

    List<Map<String, dynamic>> maps = [];

    if (option == Strings.ShowOnlyBiblicalTexts) {
      if (showOnlyBiblicalPrayers) {
        await db.rawQuery('''
          UPDATE $tableAgpeyaStructure 
          SET $columnAgpeyaStructureIsEnabled = 0
          WHERE EXISTS (SELECT *
            FROM $tableAgpeyaPrayers
            WHERE ($tableAgpeyaStructure.name = $tableAgpeyaPrayers.name)
              AND ($tableAgpeyaPrayers.isBiblical is NULL))''');
      }
    } else if (option == Strings.ShowMarianTexts) {
      if (showMarianTexts) {
        await db.rawQuery('''
          UPDATE $tableAgpeyaStructure 
          SET $columnAgpeyaStructureIsEnabled = 1
          WHERE EXISTS (SELECT *
            FROM $tableAgpeyaPrayers
            WHERE ($tableAgpeyaStructure.name = $tableAgpeyaPrayers.name)
              AND ($tableAgpeyaPrayers.isMarian = 1))''');
      } else {
        await db.rawQuery('''
          UPDATE $tableAgpeyaStructure 
          SET $columnAgpeyaStructureIsEnabled = 0
          WHERE EXISTS (SELECT *
            FROM $tableAgpeyaPrayers
            WHERE ($tableAgpeyaStructure.name = $tableAgpeyaPrayers.name)
              AND ($tableAgpeyaPrayers.isMarian = 1))''');
      }
    } else if (option == Strings.ShowAllPrayers) {
      if (showAllPrayers) {
        await db.rawQuery('''
          UPDATE $tableAgpeyaStructure 
          SET $columnAgpeyaStructureIsEnabled = 1''');
      }
    }
  }
}

  // ----------------------------------------------

  /* Future<int> saveAgpeyaHour(AgpeyaHour agpeyaHour) async {
    var dbClient = await database;
    var result = await dbClient.insert(tableAgpeyaHours, agpeyaHour.toMap());
    return result;
  }

  Future<List> getAllAgpeyaHours() async {
    var dbClient = await database;
    var result = await dbClient.query(tableAgpeyaHours, columns: [
      columnHourId,
      columnHourName,
      columnIsNotificationSet,
      columnNotificationTime,
      columnNotificationInterval
    ]);
    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await database;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableAgpeyaHours'));
  }

  Future<AgpeyaHour> getAgpeyaHour(int id) async {
    var dbClient = await database;
    List<Map> result = await dbClient.query(tableAgpeyaHours,
        columns: [
          columnHourId,
          columnHourName,
          columnIsNotificationSet,
          columnNotificationTime,
          columnNotificationInterval
        ],
        where: '$columnHourId = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return AgpeyaHour.fromMap(result.first);
    }

    return null;
  }

  Future<AgpeyaHour> getAgpeyaHourWithName(String hourName) async {
    var dbClient = await database;
    List<Map> result = await dbClient.query(tableAgpeyaHours,
        columns: [
          columnHourId,
          columnHourName,
          columnIsNotificationSet,
          columnNotificationTime,
          columnNotificationInterval
        ],
        where: '$columnHourName = ?',
        whereArgs: [hourName]);

    if (result.length > 0) {
      return AgpeyaHour.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteAgpeyaHour(int id) async {
    var dbClient = await database;
    return await dbClient
        .delete(tableAgpeyaHours, where: '$columnHourId = ?', whereArgs: [id]);
  }

  Future<int> updateAgpeyaHour(Map agpeyaHour) async {
    var dbClient = await database;
    return await dbClient.update(tableAgpeyaHours, agpeyaHour,
        where: "$columnHourId = ?", whereArgs: [agpeyaHour['id']]);
  }

  // CRUD for agpeyaHourPrayersTable

  Future<List> getAllAgpeyaHourPrayersForSpecificHour(String hourName) async {
    var dbClient = await database;
    var result = await dbClient.query(tableAgpeyaHourPrayers,
        columns: [
          columnPrayerId,
          columnHour,
          columnPrayerSection,
          columnPrayerName,
          columnIsEnabled
        ],
        where: "$columnHour = ?",
        whereArgs: [hourName]);

    if (result.length > 0) {
      return result.toList();
    }

    return null;
  }

  Future<int> updateAgpeyaHourPrayer(Map agpeyaHourPrayer) async {
    var dbClient = await database;
    return await dbClient.update(tableAgpeyaHourPrayers, agpeyaHourPrayer,
        where: "$columnHourId = ?", whereArgs: [agpeyaHourPrayer['id']]);
  }

  Future close() async {
    var dbClient = await database;
    return dbClient.close();
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1); */

