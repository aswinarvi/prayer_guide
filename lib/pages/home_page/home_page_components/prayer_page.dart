import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prayer_guide/common_widgets/common_widgets.dart';
import 'package:prayer_guide/models/prayer/content.dart';
import 'package:prayer_guide/pages/home_page/home_page_components/home_page_components.dart';

import '../../../common_widgets/content_image.dart';

class PrayerContentWidget extends StatelessWidget {
  final Box<PrayerContent> content;
  final String contentKey;
  const PrayerContentWidget({super.key, required this.content, required this.contentKey});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<PrayerContent>>(
        valueListenable: content.listenable(),
        builder: (context, value, child) {
          if (value.isEmpty) {
            return const Center(
                child: CupertinoActivityIndicator(
              radius: 15,
            ));
          }

          PrayerContent prayerContent = value.get(contentKey)!;
          return ListView(
            children: [
              ContentImage(
                imageUrl: prayerContent.imageUrl,
              ),
              GuideCard(
                prayerContent: prayerContent,
              ),
            ],
          );
        });
  }
}
