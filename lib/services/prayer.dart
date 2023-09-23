import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prayer_guide/models/prayer/content.dart';
import 'package:prayer_guide/services/download.dart';
import 'package:prayer_guide/services/local_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Prayer {
  static Reference firebaseStorageRef = FirebaseStorage.instance.ref();
  static Map<String, dynamic> _prayerGuide = {};
  static String? getPrayerThemeTitle() {
    return _prayerGuide["title"];
  }

  static Future<PrayerContent?> getPrayerMonthIntro() async {
    DateFormat format = DateFormat("yyyy/MM");
    String date = format.format(DateTime.now());
    Box<PrayerContent> prayerBox = (await LocalStorage.contentBox);
    return prayerBox.get(date);
  }

  // static initialise() async {
  //   String month = DateFormat("MM").format(DateTime.now());
  //   try {
  //     String jsonStr = await rootBundle.loadString('assets/$month.json');
  //     _prayerGuide = jsonDecode(jsonStr);
  //     _addToLocalStorage();
  //   } catch (e) {
  //     String jsonStr = await rootBundle.loadString('assets/placeholder.json');
  //     _prayerGuide = jsonDecode(jsonStr);
  //     _placeholderContent();
  //   }
  // }

  static void _addToLocalStorage() async {
    String key = DateFormat("yyyy/MM").format(DateTime.now());
    Box<PrayerContent> prayerBox = (await LocalStorage.contentBox);
    prayerBox.put(key, PrayerContent.fromMap(_prayerGuide));
    List<Map<String, dynamic>> dailyContent = List.from(_prayerGuide["daily"]);
    for (Map<String, dynamic> element in dailyContent) {
      prayerBox.put(element["date"], PrayerContent.fromMap(element));
    }
  }

  static void _placeholderContent() async {
    String key = DateFormat("yyyy/MM").format(DateTime.now());
    Box<PrayerContent> prayerBox = (await LocalStorage.contentBox);
    prayerBox.put(key, PrayerContent.fromMap(_prayerGuide));
    String day = DateFormat("yyyyMMdd").format(DateTime.now());
    prayerBox.put(day, PrayerContent.fromMap(_prayerGuide));
  }

  static Future<void> downloadPrayerGuide() async {
    String day = DateFormat("MMyyyy").format(DateTime.now());
    String directory = await FileDownload.prepareSaveDir();
    File downloadToFile = File('$directory/$day.json');

    if (!downloadToFile.existsSync()) {
      debugPrint("downloading content");
      try {
        await firebaseStorageRef
            .child('prayer_guide/$day.json')
            .writeToFile(downloadToFile);
        String prayerGuide = await downloadToFile.readAsString();
        _prayerGuide = jsonDecode(prayerGuide);
        _addToLocalStorage();
      } on FirebaseException catch (e) {
        String jsonStr = await rootBundle.loadString('assets/placeholder.json');
        _prayerGuide = jsonDecode(jsonStr);
        _placeholderContent();
        debugPrint(e.toString());
      }
    }
  }
}
