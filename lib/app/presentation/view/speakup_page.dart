import 'package:asa/app/presentation/widget/app_bottombar.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SpeakupPage extends StatelessWidget {
  const SpeakupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primary[500],
      body: Stack(
        children: [
          Container(
            width: 1.sw,
            height: 1.sh,
            decoration: BoxDecoration(
              gradient: ColorConstants.gradient[1],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 70.h),
              Text(
                "Speak Up",
                style: h2BTextStyle(
                  color: ColorConstants.slate[25],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Text(
                'Butuh bantuan atau ingin melaporkan\nkejadian? Segera laporkan disini',
                style: body5TextStyle(color: ColorConstants.slate[25]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 180.h),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 24.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.w),
                      topRight: Radius.circular(30.w),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 18.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstants.error,
                            borderRadius: BorderRadius.circular(20.w),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 42.w,
                              ),
                              SizedBox(width: 16.w),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Telepon Darurat',
                                      style: body3BTextStyle(
                                        color: ColorConstants.slate[25],
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'Terhubung langsung dengan hotline perlindungan kekerasan seksual',
                                      style: body5TextStyle(
                                        color: ColorConstants.slate[25],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.report);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 18.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorConstants.error,
                            ),
                            borderRadius: BorderRadius.circular(20.w),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.announcement_outlined,
                                color: ColorConstants.error,
                                size: 42.w,
                              ),
                              SizedBox(width: 16.w),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Laporkan Kejadian',
                                      style: body3BTextStyle(
                                        color: ColorConstants.error,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'Pelaporan langsung diproses oleh unit perlindungan kekerasan seksual',
                                      style: body5TextStyle(
                                        color: ColorConstants.error,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: AppBottomBar(
        route: AppRoute.speakup,
      ),
    );
  }
}
