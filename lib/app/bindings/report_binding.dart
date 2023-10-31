import 'package:asa/app/controller/report_controller.dart';
import 'package:get/get.dart';

class ReportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportController>(() => ReportController());
  }
}
