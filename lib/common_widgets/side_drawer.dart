import 'package:flutter/material.dart';

import '../styles/styles.dart';
import 'common_widgets.dart';

class SideDrawer extends Drawer {
  final VoidCallback infoTap;
  final VoidCallback notificationTap;
  final VoidCallback prayerTap;
  const SideDrawer({super.key, required this.infoTap, required this.notificationTap, required this.prayerTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      backgroundColor: AppColors.primaryAppColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TitleBar(
              onTap: infoTap,
            ),
          ),
          Divider(
            color: AppColors.secondaryAppColor,
          ),
          ListTile(
            selectedTileColor: Colors.white.withOpacity(.2),
            title: Text(
              "Today's Prayer",
              style: AppFonts.primaryText.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            onTap: prayerTap,
          ),
          Divider(
            color: AppColors.secondaryAppColor,
          ),
          ListTile(
            title: Text(
              "Notification",
              style: AppFonts.primaryText.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            onTap: notificationTap,
          ),
          Divider(
            color: AppColors.secondaryAppColor,
          ),
          const Spacer(),
          const Footer(
            footer: "Made with ♥️ GST Center",
          ),
        ],
      ),
    );
  }
}
