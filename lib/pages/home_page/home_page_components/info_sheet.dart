import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prayer_guide/common_widgets/common_widgets.dart';
import 'package:prayer_guide/common_widgets/url.dart';
import 'package:prayer_guide/styles/styles.dart';

import '../../../common_widgets/content_image.dart';
import '../../../models/prayer/content.dart';
import '../../../services/prayer.dart';
import 'guide_card.dart';

showTopSheet(
  BuildContext context,
) {
  ValueNotifier<bool> val = ValueNotifier(false);
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 600),
    barrierLabel: "top sheet",
    barrierColor: Colors.transparent,
    pageBuilder: (context, _, __) {
      return SafeArea(
        child: Material(
          color: AppColors.primaryAppColor,
          child: Stack(
            children: [
              FutureBuilder<PrayerContent?>(
                  future: Prayer.getPrayerMonthIntro(),
                  builder: (context, snapshot) {
                    return NotificationListener<UserScrollNotification>(
                      onNotification: (notification) {
                        if (notification.direction == ScrollDirection.forward) {
                          val.value = true;
                        }
                        if (notification.direction == ScrollDirection.reverse) {
                          val.value = false;
                        }
                        return true;
                      },
                      child: ListView(
                        //  physics: const BouncingScrollPhysics(),
                        children: [
                          ContentImage(
                            imageUrl: snapshot.data?.imageUrl,
                          ),
                          GuideCard(
                            prayerContent: snapshot.data,
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              launchLinkURL(
                                  "https://www.nlag.in/privacy-policy/");
                            },
                            child: const Footer(
                              footer: "Privacy Policy",
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              ValueListenableBuilder<bool>(
                  valueListenable: val,
                  builder: (context, value, child) {
                    if (val.value) {
                      return const Align(
                        alignment: Alignment.bottomCenter,
                        child: CloseButtonWidget(),
                      );
                    }
                    return const SizedBox();
                  })
            ],
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ).drive(Tween<Offset>(
          begin: const Offset(0, -1.0),
          end: Offset.zero,
        )),
        child: child,
      );
    },
  );
}
