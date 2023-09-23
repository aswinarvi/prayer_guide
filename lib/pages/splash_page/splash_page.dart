import 'package:flutter/material.dart';
import 'package:prayer_guide/styles/styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.primaryAppColor,
      child: Center(
        child: Image.asset(
          "assets/logo.png",
          height: 100,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
