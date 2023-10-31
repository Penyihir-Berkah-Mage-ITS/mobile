import 'package:asa/app/controller/comment_controller.dart';
import 'package:get/get.dart';

class CommentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentController>(() => CommentController());
  }
}
