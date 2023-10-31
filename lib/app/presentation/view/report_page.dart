import 'package:asa/app/controller/report_controller.dart';
import 'package:asa/app/presentation/widget/app_dropdown.dart';
import 'package:asa/app/presentation/widget/app_header.dart';
import 'package:asa/app/presentation/widget/app_input.dart';
import 'package:asa/app/presentation/widget/scrollable_constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportPage extends GetView<ReportController> {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: "Buat Laporan Kejadian",
      ),
      body: ScrollableConstraints(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              AppInput(
                label: "Nama Pelapor",
                controller: TextEditingController(),
                placeholder: "Gunakan Nama Asli Anda",
              ),
              SizedBox(height: 12.h),
              AppInput(
                label: "Alamat Pelapor",
                controller: TextEditingController(),
                placeholder: "Lokasi Anda saat ini",
              ),
              SizedBox(height: 12.h),
              Obx(
                () => AppDropdown<String>(
                  label: 'Provinsi',
                  onChanged: <String>(String? e) {
                    var currentProvince = controller.selectedProvince.value;
                    controller.selectedProvince.value = e!.toString();
                    if (e.toString() != currentProvince) {
                      controller.selectedRegency.value = null;
                      controller.getRegency();
                    }
                  },
                  value: controller.selectedProvince.value,
                  items: controller.provinces
                      .map(
                        (element) => AppDropdownItem(
                          text: element.name,
                          value: element.id,
                        ),
                      )
                      .toList(),
                  placeholder: 'Pilih Provinsi',
                ),
              ),
              SizedBox(height: 12.h),
              Obx(
                () => AppDropdown<String>(
                  label: 'Kota/Kabupaten',
                  onChanged: <String>(String? e) {
                    controller.selectedRegency.value = e.toString();
                  },
                  items: controller.regencies
                      .map(
                        (element) => AppDropdownItem(
                          text: element.name,
                          value: element.id,
                        ),
                      )
                      .toList(),
                  placeholder: 'Pilih Kota/Kabupaten',
                  value: controller.selectedRegency.value,
                ),
              ),
              Spacer(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
