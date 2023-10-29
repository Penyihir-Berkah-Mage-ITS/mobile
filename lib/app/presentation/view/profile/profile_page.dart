import 'package:asa/app/presentation/partials/profile/about.dart';
import 'package:asa/app/presentation/partials/profile/account_settings.dart';
import 'package:asa/app/presentation/partials/profile/card_verification.dart';
import 'package:asa/app/presentation/partials/profile/help_center.dart';
import 'package:asa/app/presentation/partials/profile/profile_header.dart';
import 'package:asa/app/presentation/widget/app_bottombar.dart';
import 'package:asa/app/presentation/widget/app_button.dart';
import 'package:asa/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                      onPressed: () {},
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
