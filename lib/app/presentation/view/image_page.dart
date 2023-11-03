import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:get/get.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
        imageProvider: CachedNetworkImageProvider(Get.parameters['url']!),
        disableGestures: false,
      ),
    );
  }
}
