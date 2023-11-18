import 'dart:io';

import 'package:asa/app/models/location/province_model.dart';
import 'package:asa/app/models/location/regency_model.dart';
import 'package:asa/app/presentation/widget/app_loading.dart';
import 'package:asa/app/repository/location_repository.dart';
import 'package:asa/styles/color_constants.dart';
import 'package:asa/utils/filepicker_handler.dart';
import 'package:asa/utils/show_alert.dart';
import 'package:asa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  RxList<ProvinceModel> provinces = <ProvinceModel>[].obs;
  RxList<RegencyModel> regencies = <RegencyModel>[].obs;
  RxnString selectedProvince = RxnString();
  RxnString selectedRegency = RxnString();
  Rxn<File> proof = Rxn<File>();
  RxBool invalidProof = false.obs;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void getProvinces() {
    LocationRepository.getProvinces().then((value) {
      provinces.value = value;
    }).catchError((e) {
      showAlert(e.toString());
    });
  }

  void getRegency() {
    if (selectedProvince.value == null) {
      return;
    }
    LocationRepository.getRegencies(selectedProvince.value!).then((value) {
      regencies.value = value;
    }).catchError((e) {
      showAlert(e.toString());
    });
  }

  Future<void> uploadFotoHandler() async {
    try {
      var result = await pickFile(extensions: ["jpg", 'png', 'jpeg']);
      proof.value = result;
    } catch (err) {
      showAlert(err.toString());
    }
  }

  @override
  void onInit() {
    super.onInit;
    getProvinces();
  }

  RxBool isLoading = true.obs;

  void submit(BuildContext context) async {
    showLoadingDialog(context, isLoading);

    await Future.delayed(Duration(milliseconds: 900), () async {
      isLoading.value = false;
      await Future.delayed(Duration(milliseconds: 50), () {
        isLoading.value = true;
      });
    });

    // ignore: use_build_context_synchronously
    dialogSuccess(context);
  }

  void dialogSuccess(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.w),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 1.sw,
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.w),
                ),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/notification_lapor.svg",
                      height: 200.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Berhasil membuat laporan",
                      style: body4BTextStyle(
                        color: ColorConstants.primary[500],
                      ),
                    ),
                    Text(
                      "Tenang aja, data kalian aman dan dirahasiakan. Jadi gausah khawatir untuk melapor",
                      style: body5TextStyle(color: ColorConstants.slate[800]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
