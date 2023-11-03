import 'package:asa/app/models/user/user_model.dart';
import 'package:asa/services/api/fetch_data.dart';
import 'package:asa/services/api/request_method.dart';

class UserRepository {
  static Future<UserModel> getData() async {
    try {
      var request = await fetchData<UserModel>(
        url: "/api/v1/user/profile",
        isAlert: true,
        method: RequestMethod.GET,
      );
      return request.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<UserModel> edit(Map<String, String> data) async {
    try {
      var request = await fetchData<UserModel>(
        url: "/api/v1/user/edit-profile",
        isAlert: true,
        data: data,
        method: RequestMethod.POST,
      );

      return request.data!;
    } catch (_) {
      rethrow;
    }
  }
}
