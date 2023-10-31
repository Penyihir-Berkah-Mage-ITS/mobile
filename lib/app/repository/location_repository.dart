import 'package:asa/app/models/location/province_model.dart';
import 'package:asa/app/models/location/regency_model.dart';
import 'package:asa/services/api/api.dart';

class LocationRepository {
  static Future<List<ProvinceModel>> getProvinces() async {
    try {
      final api = await Api(
        baseUrl: "https://www.emsifa.com",
      );

      var request = await api.get(
        "/api-wilayah-indonesia/api/provinces.json",
      );

      return List<Map<String, dynamic>>.from(request.data).map((element) {
        return ProvinceModel(id: element['id'], name: element['name']);
      }).toList();
    } catch (err) {
      rethrow;
    }
  }

  static Future<List<RegencyModel>> getRegencies(String id) async {
    try {
      final api = await Api(
        baseUrl: "https://www.emsifa.com",
      );

      var request = await api.get(
        "/api-wilayah-indonesia/api/regencies/$id.json",
      );

      return List<Map<String, dynamic>>.from(request.data).map((element) {
        return RegencyModel(
          id: element['id'],
          province_id: element['province_id'],
          name: element['name'],
        );
      }).toList();
    } catch (err) {
      rethrow;
    }
  }
}
