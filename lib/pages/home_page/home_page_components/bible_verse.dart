import 'package:flutter/material.dart';
import 'package:prayer_guide/styles/styles.dart';

class BibleVerse extends StatelessWidget {
  final List<String>? bibleVerse;
  final String? bibleVerseReference;
  const BibleVerse(
      {Key? key, required this.bibleVerse, required this.bibleVerseReference})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> verse = ["You will do", "great things and", "surely tirumph"];
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 8),
      child: SizedBox(
        // color: Colors.white,
        width: MediaQuery.of(context).size.width * .85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Text(
                  bibleVerse?[index] ?? "",
                  textAlign: TextAlign.center,
                  style: AppFonts.secondaryText.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                );
              },
              itemCount: bibleVerse?.length ?? 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  bibleVerseReference ?? "",
                  textAlign: TextAlign.right,
                  style: AppFonts.secondaryText.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
