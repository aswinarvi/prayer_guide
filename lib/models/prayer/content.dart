import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'content.g.dart';

@HiveType(typeId: 10)
class PrayerContent {
  @HiveField(0)
  String? title;
  @HiveField(1)
  List<String>? bibleVerse;
  @HiveField(2)
  String? bibleVerseReference;
  @HiveField(3)
  String? imageUrl;
  @HiveField(4)
  List<String>? content;
  PrayerContent({
    this.title,
    this.bibleVerse,
    this.bibleVerseReference,
    this.imageUrl,
    this.content,
  });

  PrayerContent copyWith({
    String? title,
    List<String>? bibleVerse,
    String? bibleVerseReference,
    String? imageUrl,
    List<String>? content,
  }) {
    return PrayerContent(
      title: title ?? this.title,
      bibleVerse: bibleVerse ?? this.bibleVerse,
      bibleVerseReference: bibleVerseReference ?? this.bibleVerseReference,
      imageUrl: imageUrl ?? this.imageUrl,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'bibleVerse': bibleVerse,
      'bibleVerseReference': bibleVerseReference,
      'imageUrl': imageUrl,
      'content': content,
    };
  }

  factory PrayerContent.fromMap(Map<String, dynamic> map) {
    return PrayerContent(
      title: map['title'],
      bibleVerse: List<String>.from(map['bibleVerse']),
      bibleVerseReference: map['bibleVerseReference'],
      imageUrl: map['imageUrl'],
      content: List<String>.from(map['content']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PrayerContent.fromJson(String source) =>
      PrayerContent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PrayerContent(title: $title, bibleVerse: $bibleVerse, bibleVerseReference: $bibleVerseReference, imageUrl: $imageUrl, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PrayerContent &&
        other.title == title &&
        listEquals(other.bibleVerse, bibleVerse) &&
        other.bibleVerseReference == bibleVerseReference &&
        other.imageUrl == imageUrl &&
        listEquals(other.content, content);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        bibleVerse.hashCode ^
        bibleVerseReference.hashCode ^
        imageUrl.hashCode ^
        content.hashCode;
  }
}
