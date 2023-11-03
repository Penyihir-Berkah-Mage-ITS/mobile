import 'package:asa/styles/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showAlert(String msg, {bool? isSuccess = false}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: isSuccess! ? Colors.green : Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showInfo(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: ColorConstants.slate[800]!.withOpacity(.8),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
