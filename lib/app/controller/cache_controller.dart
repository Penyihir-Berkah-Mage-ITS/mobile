import 'package:asa/app/models/user/user_model.dart';
import 'package:asa/app/repository/user_repository.dart';
import 'package:get/get.dart';

class CacheController extends GetxController {
  static CacheController get i => Get.find<CacheController>();

  Rxn<UserModel> user = Rxn<UserModel>();

  Future getUserData() async {
    try {
      var data = await UserRepository.getData();
      user.value = data;
    } catch (_) {}
  }
}
