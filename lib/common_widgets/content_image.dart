import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:prayer_guide/services/global.dart';
import 'package:prayer_guide/styles/styles.dart';

class ContentImage extends StatelessWidget {
  final String? imageUrl;
  const ContentImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OptimizedCacheImage(
      imageUrl: imageUrl ?? Global.tempImgUrl,
      placeholder: (context, url) => const CupertinoActivityIndicator(
        color: AppColors.secondaryAppColor,
      ),
      imageBuilder: (context, imageProvider) {
        return Container(
          height: size.height * .25,
          width: size.width,
          decoration: BoxDecoration(
            //  borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.transparent,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              opacity: 0.8,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => Container(
          height: size.height * .25,
          width: size.width,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('assets/temp_img.jpeg'),
                opacity: .8,
                fit: BoxFit.cover,
              ))),
    );
  }
}
