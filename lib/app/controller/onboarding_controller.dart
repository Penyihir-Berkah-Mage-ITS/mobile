import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get i => Get.find<OnboardingController>();

  RxInt current = 0.obs;

  List<OnboardContent> contents = <OnboardContent>[
    OnboardContent(
      caption:
          "Tidak memandang gender, kejahatan seksual\ndapat terjadi kepada siapapun",
      image: "assets/images/onboarding_1.svg",
      title: "Jangan sampai\nkejahatan seksual\nterjadi di sekitar Anda!",
      width: 280.w,
      height: 280.h,
    ),
    OnboardContent(
      caption:
          "Tidak perlu khawatir akan identitasmu,\nruang bicaramu bebas disini",
      image: "assets/images/onboarding_2.svg",
      title: "Bicara sebebasnya,\nIdentitasmu tetap menjadi\nrahasiamu.",
      width: 261.w,
      height: 255.h,
    ),
    OnboardContent(
      caption:
          "Bukan hanya teknologi saja, kota cerdas\nharuslah memiliki lingkungan yang nyaman juga.",
      image: "assets/images/onboarding_3.svg",
      title: "Kota yang cerdas,\nberawal dari lingkungan\nyang aman",
      width: 408.w,
      height: 272.h,
    ),
  ];
}

class OnboardContent {
  final String title;
  final String caption;
  final String image;
  final double width;
  final double height;

  const OnboardContent({
    required this.caption,
    required this.image,
    required this.title,
    required this.width,
    required this.height,
  });
}
