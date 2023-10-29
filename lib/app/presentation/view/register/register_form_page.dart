import 'package:asa/app/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterFormPage extends GetView<RegisterController> {
  const RegisterFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RegisterFormPage')),
      body: SafeArea(
        child: Text('RegisterFormController'),
      ),
    );
  }
}
