import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:prayer_guide/models/prayer/content.dart';

enum StorageKeys {
  getToken("getToken");

  final String keys;
  const StorageKeys(this.keys);
}

Box<PrayerContent>? _contentBox;
Box<String>? _notificationBox;

class LocalStorage {
  static Future<Box<PrayerContent>> get contentBox async {
    if (_contentBox != null) return _contentBox!;
    _contentBox = await Hive.openBox('daily_prayer');
    return _contentBox!;
  }

  static Future<Box<String>> get notificationBox async {
    if (_notificationBox != null) return _notificationBox!;
    _notificationBox = await Hive.openBox("notification");
    return _notificationBox!;
  }
}

Future<void> initialiseLocalStorage() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String hiveRepoPath = path.join(appDocDir.path, 'prayer_guide');
  await Hive.initFlutter(hiveRepoPath);
  registerHiveAdapters();
}

void registerHiveAdapters() {
  Hive.registerAdapter(PrayerContentAdapter());
}
