
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:prayer_app_getx/models/agpeya_hour_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseService {

  // Column variables for agpeyaHoursTable
  final String tableAgpeyaHours = 'agpeyaHoursTable';
  final String columnHourId = 'id';
  final String columnHourName = 'hourName';
  final String columnIsNotificationSet = 'isNotificationSet';
  final String columnNotificationTime = 'notificationTime';
  final String columnNotificationInterval = 'notificationInterval';


  // Column variables for agpeyaHourPrayersTable
  final String tableAgpeyaHourPrayers = 'agpeyaHourPrayersTable';
  final String columnPrayerId = 'id';
  final String columnHour = 'hour';
  final String columnPrayerSection = 'prayerSection';
  final String columnPrayerName = 'prayerName';
  final String columnIsEnabled = 'isEnabled';

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
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
      ByteData data = await rootBundle.load(join("assets/database", "PrayerApp.db"));
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

  /* void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableAgpeyaHours($columnHourId INTEGER PRIMARY KEY, $columnHourName TEXT, $columnHourTitle TEXT, $columnHourSubtitle TEXT, $columnHourIcon TEXT)');
  } */

  // CRUD for agpeyaHourTable

  Future<int> saveAgpeyaHour(AgpeyaHourDatabase agpeyaHour) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableAgpeyaHours, agpeyaHour.toMap());
    return result;
  }

  Future<List> getAllAgpeyaHours() async {
    var dbClient = await db;
    var result = await dbClient.query(tableAgpeyaHours,
        columns: [columnHourId, columnHourName, columnIsNotificationSet, columnNotificationTime, columnNotificationInterval]);
    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableAgpeyaHours'));
  }

  Future<AgpeyaHourDatabase> getAgpeyaHour(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableAgpeyaHours,
        columns: [columnHourId, columnHourName, columnIsNotificationSet, columnNotificationTime, columnNotificationInterval],
        where: '$columnHourId = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return AgpeyaHourDatabase.fromMap(result.first);
    }

    return null;
  }

  Future<AgpeyaHourDatabase> getAgpeyaHourWithName(String hourName) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableAgpeyaHours,
        columns: [columnHourId, columnHourName, columnIsNotificationSet, columnNotificationTime, columnNotificationInterval],
        where: '$columnHourName = ?',
        whereArgs: [hourName]);

    if (result.length > 0) {
      return AgpeyaHourDatabase.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteAgpeyaHour(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableAgpeyaHours, where: '$columnHourId = ?', whereArgs: [id]);
  }

  Future<int> updateAgpeyaHour(Map agpeyaHour) async {
    var dbClient = await db;
    return await dbClient.update(tableAgpeyaHours, agpeyaHour,
        where: "$columnHourId = ?", whereArgs: [agpeyaHour['id']]);
  }

  // CRUD for agpeyaHourPrayersTable

  Future<List> getAllAgpeyaHourPrayersForSpecificHour(String hourName) async {
    var dbClient = await db;
    var result = await dbClient.query(tableAgpeyaHourPrayers,
        columns: [columnPrayerId, columnHour, columnPrayerSection, columnPrayerName, columnIsEnabled],
        where: "$columnHour = ?",
        whereArgs: [hourName]);

    if (result.length > 0) {
      return result.toList();
    }

    return null;
  }

  Future<int> updateAgpeyaHourPrayer(Map agpeyaHourPrayer) async {
    var dbClient = await db;
    return await dbClient.update(tableAgpeyaHourPrayers, agpeyaHourPrayer,
        where: "$columnHourId = ?", whereArgs: [agpeyaHourPrayer['id']]);
  }



  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
