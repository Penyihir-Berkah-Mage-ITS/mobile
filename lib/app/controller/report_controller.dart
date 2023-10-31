import 'package:asa/app/models/location/province_model.dart';
import 'package:asa/app/models/location/regency_model.dart';
import 'package:asa/app/repository/location_repository.dart';
import 'package:asa/utils/show_alert.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  RxList<ProvinceModel> provinces = <ProvinceModel>[].obs;
  RxList<RegencyModel> regencies = <RegencyModel>[].obs;
  RxnString selectedProvince = RxnString();
  RxnString selectedRegency = RxnString();

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

  @override
  void onInit() {
    super.onInit;
    getProvinces();
  }
}
