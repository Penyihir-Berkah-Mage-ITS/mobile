import 'package:asa/app/controller/chat_controller.dart';
import 'package:asa/app/presentation/widget/app_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: "asd"),
      body: SafeArea(
        child: Text('ChatController'),
      ),
    );
  }
}
