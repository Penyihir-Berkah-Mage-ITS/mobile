import 'package:asa/app/controller/home_controller.dart';
import 'package:asa/app/presentation/partials/home/card_post.dart';
import 'package:asa/app/presentation/partials/home/home_header.dart';
import 'package:asa/app/presentation/widget/app_bottombar.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.slate[200],
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPersistentHeader(
            pinned: true,
            delegate: HomeHeader(),
          ),
        ],
        body: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 1.sh),
          child: PageView(
            controller: controller.homePageController,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            onPageChanged: (e) {
              if (controller.current.value == 0) {
                controller.p1Controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
              }
              if (controller.current.value == 1) {
                controller.p2Controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
              }
              if (controller.current.value == 2) {
                controller.p3Controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
              }
              controller.current.value = e;
            },
            children: [
              // Trending
              RefreshIndicator(
                onRefresh: () async {
                  print('asd');
                },
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  controller: controller.p1Controller,
                  child: Obx(
                    () => Column(
                      children: [
                        SizedBox(height: 8.h),
                        ...controller.trending
                            .map(
                              (e) => CardPost(
                                data: e,
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ),
              // Nearest
              RefreshIndicator(
                onRefresh: () async {
                  print('asd');
                },
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  controller: controller.p2Controller,
                  child: Obx(
                    () => Column(
                      children: [
                        SizedBox(height: 8.h),
                        ...controller.nearest
                            .map(
                              (e) => CardPost(
                                data: e,
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ),
              // Latest
              RefreshIndicator(
                onRefresh: () async {
                  print('asd');
                },
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  controller: controller.p3Controller,
                  child: Obx(
                    () => Column(
                      children: [
                        SizedBox(height: 8.h),
                        ...controller.latest
                            .map(
                              (e) => CardPost(
                                data: e,
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(route: AppRoute.home),
    );
  }
}
