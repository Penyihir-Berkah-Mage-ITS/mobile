import 'package:flutter/widgets.dart';

Map<String, String> formConverter(Map<String, TextEditingController> form) {
  return form.map((key, value) => MapEntry(key, value.text));
}
