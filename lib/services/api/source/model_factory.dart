import 'package:asa/app/models/login/login_model.dart';
import 'package:asa/app/models/user/user_model.dart';

abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    final strType = type.toString().replaceAll("?", "");

    if (strType == (UserModel).toString()) {
      return UserModel.fromJson(json);
    } else if (strType == (LoginModel).toString()) {
      return LoginModel.fromJson(json);
    }

    throw UnimplementedError();
  }
}
