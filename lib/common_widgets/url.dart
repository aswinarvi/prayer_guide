import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future launchLinkURL(String url) async {
  Uri uri = Uri.parse(url);
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
      );
    } else {
      debugPrint("Can't launch $url");
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}
