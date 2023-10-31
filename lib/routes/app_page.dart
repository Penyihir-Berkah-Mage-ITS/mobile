import 'package:asa/app/bindings/home_bindings.dart';
import 'package:asa/app/bindings/login_binding.dart';
import 'package:asa/app/bindings/onboarding_bindings.dart';
import 'package:asa/app/bindings/register_binding.dart';
import 'package:asa/app/presentation/view/home_page.dart';
import 'package:asa/app/presentation/view/login_page.dart';
import 'package:asa/app/presentation/view/onboarding_page.dart';
import 'package:asa/app/presentation/view/profile/profile_page.dart';
import 'package:asa/app/presentation/view/register/register_avatar_page.dart';
import 'package:asa/app/presentation/view/register/register_form_page.dart';
import 'package:asa/app/presentation/view/register/register_gender_page.dart';
import 'package:asa/app/presentation/view/register/register_name_page.dart';
import 'package:asa/app/presentation/view/splash_page.dart';
import 'package:asa/routes/app_route.dart';
import 'package:get/get.dart';

List<GetPage<String>> appPage() {
  return <GetPage<String>>[
    GetPage(
      name: AppRoute.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoute.onboarding,
      page: () => OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoute.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoute.registerName,
      page: () => RegisterNamePage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoute.registerGender,
      page: () => RegisterGenderPage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoute.registerAvatar,
      page: () => RegisterAvatarPage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoute.registerForm,
      page: () => RegisterFormPage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoute.profile,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: AppRoute.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
