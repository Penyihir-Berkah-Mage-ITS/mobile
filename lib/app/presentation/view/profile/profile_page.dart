import 'package:asa/app/controller/cache_controller.dart';
import 'package:asa/app/presentation/partials/profile/about.dart';
import 'package:asa/app/presentation/partials/profile/account_settings.dart';
import 'package:asa/app/presentation/partials/profile/card_verification.dart';
import 'package:asa/app/presentation/partials/profile/help_center.dart';
import 'package:asa/app/presentation/partials/profile/profile_header.dart';
import 'package:asa/app/presentation/widget/app_bottombar.dart';
import 'package:asa/app/presentation/widget/app_button.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/services/token/app_token.dart';
import 'package:asa/utils/show_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    CacheController.i.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CardVerification(),
                    SizedBox(height: 16.h),
                    AccountSettings(),
                    SizedBox(height: 16.h),
                    HelpCenter(),
                    SizedBox(height: 16.h),
                    About(),
                    SizedBox(height: 16.h),
                    AppButton(
                      variant: AppButtonVariant.secondary,
                      onPressed: () async {
                        await UserToken.clearToken();
                        Get.offAllNamed(AppRoute.splash);
                        showAlert("Logout sukses", isSuccess: true);
                      },
                      text: "Keluar",
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(
        route: AppRoute.profile,
      ),
    );
  }
}
