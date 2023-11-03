import 'dart:io';

import 'package:asa/routes/app_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageDetailView extends StatelessWidget {
  final String link;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool isNetwork;

  const ImageDetailView({
    super.key,
    required this.link,
    required this.isNetwork,
    this.fit,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoute.imageDetail,
          parameters: {
            "url": link,
            "isNetwork": isNetwork.toString(),
          },
        );
      },
      child: Hero(
        tag: 'image_view_$link',
        child: isNetwork
            ? CachedNetworkImage(
                imageUrl: link,
                width: width,
                height: height,
                fit: fit,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Image.file(
                File(link),
                width: width,
                height: height,
                fit: fit,
              ),
      ),
    );
  }
}
