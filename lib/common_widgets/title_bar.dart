import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:prayer_guide/styles/styles.dart';

class TitleBar extends StatelessWidget {
  final VoidCallback? onTap;
  const TitleBar({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String month = DateFormat("MMMM").format(DateTime.now());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Prayer Guide",
          style: AppFonts.primaryHeader,
        ),
        InkWell(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Text(
                  month,
                  style: AppFonts.secondaryText,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    "assets/icons/info.svg",
                    fit: BoxFit.contain,
                    height: 20,
                    color: AppColors.secondaryAppColor.withOpacity(.5),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
