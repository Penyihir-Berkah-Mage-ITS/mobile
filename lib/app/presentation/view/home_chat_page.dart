import 'package:asa/app/controller/chat_controller.dart';
import 'package:asa/app/presentation/partials/chat/card_chat.dart';
import 'package:asa/app/presentation/partials/chat/home_chat_header.dart';
import 'package:asa/app/presentation/widget/app_bottombar.dart';
import 'package:asa/app/presentation/widget/scrollable_constraints.dart';
import 'package:asa/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeChatPage extends GetView<ChatController> {
  const HomeChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPersistentHeader(
            pinned: true,
            delegate: HomeChatHeader(),
          ),
        ],
        body: ScrollableConstraints(
          child: Column(
            children: [
              CardChat(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(route: AppRoute.chat),
    );
  }
}
