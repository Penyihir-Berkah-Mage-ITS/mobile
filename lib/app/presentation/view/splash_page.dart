import 'package:asa/routes/app_route.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () {
        Get.offNamed(AppRoute.onboarding);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primary[500],
      body: Container(
        decoration: BoxDecoration(
          gradient: ColorConstants.gradient[1],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 320.h,
              child: SvgPicture.asset("assets/logo/logo_text_white.svg"),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/splash_image.png",
                width: 444.w,
                height: 444.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
