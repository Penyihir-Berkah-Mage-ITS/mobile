import 'package:asa/app/bindings/onboarding_bindings.dart';
import 'package:asa/app/presentation/view/onboarding_page.dart';
import 'package:asa/app/presentation/view/splash_page.dart';
import 'package:asa/routes/app_route.dart';
import 'package:get/get.dart';

List<GetPage> appPage() {
  return <GetPage>[
    GetPage(
      name: AppRoute.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoute.onboarding,
      page: () => OnboardingPage(),
      binding: OnboardingBinding(),
    ),
  ];
}
