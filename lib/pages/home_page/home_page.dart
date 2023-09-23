import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:prayer_guide/common_widgets/common_widgets.dart';
import 'package:prayer_guide/models/prayer/content.dart';
import 'package:prayer_guide/pages/notification_page/notification_page.dart';
import 'package:prayer_guide/styles/styles.dart';
import 'home_page_components/prayer_page.dart';

class HomePage extends StatefulWidget {
  final Box<PrayerContent> content;
  const HomePage({Key? key, required this.content}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<Widget?> widgetNotifier = ValueNotifier(null);
  @override
  void initState() {
    widgetNotifier = ValueNotifier(
      PrayerContentWidget(
        content: widget.content,
        contentKey: DateFormat("yyyy/MM").format(DateTime.now()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            shadowColor: AppColors.primaryAppColor,
            backgroundColor: AppColors.primaryAppColor,
            centerTitle: false,
            title: Text(
              "Prayer Guide",
              style: AppFonts.primaryHeader,
            ),
          ),
          drawer: SideDrawer(
            notificationTap: () {
              widgetNotifier.value = NotificationPage();
              Navigator.pop(context);
            },
            infoTap: () {
              widgetNotifier.value = PrayerContentWidget(
                content: widget.content,
                contentKey: DateFormat("yyyy/MM").format(DateTime.now()),
              );
              Navigator.pop(context);
            },
            prayerTap: () {
              widgetNotifier.value = PrayerContentWidget(
                content: widget.content,
                contentKey: DateFormat("yyyyMMdd").format(DateTime.now()),
              );
              Navigator.pop(context);
            },
          ),
          backgroundColor: AppColors.primaryAppColor,
          body: ValueListenableBuilder<Widget?>(
            valueListenable: widgetNotifier,
            builder: (context, value, child) => value!,
          )),
    );
  }
}
