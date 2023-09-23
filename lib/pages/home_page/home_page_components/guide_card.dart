import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_guide/models/prayer/content.dart';
import 'package:prayer_guide/pages/home_page/home_page_components/home_page_components.dart';

import 'package:prayer_guide/styles/styles.dart';
import 'package:share_plus/share_plus.dart';

class GuideCard extends StatelessWidget {
  final PrayerContent? prayerContent;
  const GuideCard({Key? key, required this.prayerContent}) : super(key: key);
  sharePrayer(BuildContext context, PrayerContent content) {
    Share.share(
      "*${content.title?.toUpperCase()}*\n\n\t_${content.bibleVerse?.join()}_\n_${content.bibleVerseReference}_\n\n\t${content.content?.join("\n\n")}",
      subject: "Wherever you are now, take a minute to pray for today's prayer point.",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  prayerContent?.title ?? "",
                  style: AppFonts.primaryText.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Spacer(),
                IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => sharePrayer(context, prayerContent!),
                    icon: Icon(
                      CupertinoIcons.share_up,
                      color: Colors.white.withOpacity(.5),
                    ))
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 4),
              child: Divider(
                color: AppColors.secondaryAppColor,
              ),
            ),
            BibleVerse(
              bibleVerse: prayerContent?.bibleVerse,
              bibleVerseReference: prayerContent?.bibleVerseReference,
            ),
            ContentPrayer(content: prayerContent?.content)
          ],
        ),
      ),
    );
  }
}
