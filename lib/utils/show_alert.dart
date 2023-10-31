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
