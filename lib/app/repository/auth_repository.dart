import 'package:asa/app/models/login/login_model.dart';
import 'package:asa/services/api/fetch_data.dart';
import 'package:asa/services/api/request_method.dart';

class AuthController {
  static Future<LoginModel> login(data) async {
    try {
      var result = await fetchData<LoginModel>(
        url: "/api/v1/login",
        method: RequestMethod.POST,
        data: data,
        isAlert: true,
      );

      return result.data!;
    } catch (err) {
      rethrow;
    }
  }
}
