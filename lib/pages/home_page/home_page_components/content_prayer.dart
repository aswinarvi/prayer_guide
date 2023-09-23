import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class ContentPrayer extends StatelessWidget {
  final List<String>? content;
  const ContentPrayer({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Text("   ${content?[index] ?? ""}",
              textAlign: TextAlign.justify,
              style: AppFonts.primaryText
                  .copyWith(height: 1.5, color: Colors.white.withOpacity(.65)));
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
        itemCount: content?.length ?? 0);
  }
}
