import 'package:asa/app/models/post/post_model.dart';
import 'package:asa/app/presentation/widget/image_detail_vew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class CardAttachment extends StatefulWidget {
  final PostModel data;
  const CardAttachment({
    super.key,
    required this.data,
  });

  @override
  State<CardAttachment> createState() => _CardAttachmentState();
}

class _CardAttachmentState extends State<CardAttachment> {
  VideoPlayerController? videoController;
  @override
  void initState() {
    super.initState();
    initVideo();
  }

  void initVideo() {
    if (widget.data.attachment.split(".").last != "mp4") {
      return;
    }

    videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.data.attachment))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.data.attachment.isEmpty ? Container() : SizedBox(height: 15.h),
        Builder(builder: (context) {
          var link = widget.data.attachment;

          if (link.contains("tccmlkbaplvfccxxptsv")) {
            return Container();
          }

          var extens = link.split(".").last;
          if (extens == "jpeg" ||
              extens == "png" ||
              extens == "jpg" ||
              extens == "svg") {
            return Container(
              color: Colors.white,
              child: ImageDetailView(
                link: link,
                isNetwork: true,
                width: 1.sw,
                fit: BoxFit.cover,
              ),
            );
          }

          if (extens == "mp4") {
            return videoController != null
                ? InkWell(
                    onTap: () {
                      videoController!.play();
                    },
                    child: SizedBox(
                      width: 1.sw,
                      child: AspectRatio(
                        aspectRatio: videoController!.value.aspectRatio,
                        child: VideoPlayer(videoController!),
                      ),
                    ),
                  )
                : Container();
          }

          return Container();
        }),
      ],
    );
  }
}
