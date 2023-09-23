import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prayer_guide/styles/styles.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(
            "assets/icons/close.svg",
            color: AppColors.secondaryAppColor,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
