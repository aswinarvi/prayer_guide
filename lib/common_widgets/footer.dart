import 'package:flutter/material.dart';
import 'package:prayer_guide/styles/styles.dart';

class Footer extends StatelessWidget {
  final String footer;

  const Footer({Key? key, required this.footer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            color: BoxColors.primaryBoxColor,
            thickness: 2,
          ),
          Text(footer, style: AppFonts.secondaryText.copyWith(fontSize: 11)),
        ],
      ),
    );
  }
}
