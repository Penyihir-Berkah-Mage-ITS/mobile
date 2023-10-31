import 'package:asa/app/bindings/global_bindings.dart';
import 'package:asa/routes/app_page.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/services/token/app_token.dart';
import 'package:asa/utils/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  // Splash Screen

  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> a() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: ((context, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: FutureBuilder(
            future: UserToken.checkToken(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GetMaterialApp(
                  initialBinding: GlobalBinding(),
                  title: 'MyEco',
                  theme: globalTheme(),
                  getPages: appPage(),
                  initialRoute:
                      snapshot.data ?? false ? AppRoute.home : AppRoute.splash,
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: child ?? Container(),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        );
      }),
    );
  }
}
