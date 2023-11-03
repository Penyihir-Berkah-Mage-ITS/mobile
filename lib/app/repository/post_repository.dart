import 'package:asa/app/models/post/post_model.dart';
import 'package:asa/services/api/fetch_data.dart';
import 'package:asa/services/api/request_method.dart';
import 'package:dio/dio.dart';

class PostRepository {
  static Future<List<PostModel>> getTrending() async {
    try {
      var request = await fetchMultipleData<PostModel>(
        url: "/api/v1/home/popular",
        method: RequestMethod.GET,
        isAlert: true,
      );

      return request.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<PostModel>> getLatest() async {
    try {
      var request = await fetchMultipleData<PostModel>(
        url: "/api/v1/home/latest",
        method: RequestMethod.GET,
        isAlert: true,
      );

      return request.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<PostModel>> getNearest() async {
    try {
      var request = await fetchMultipleData<PostModel>(
        url: "/api/v1/home/nearest?lat=12.345&lng=67.890",
        method: RequestMethod.GET,
        isAlert: true,
      );

      return request.data!;
    } catch (_) {
      rethrow;
    }
  }

  Future<PostModel> getDetail(String id) async {
    try {
      var request = await fetchData<PostModel>(
        url: "/api/v1/post/$id",
        method: RequestMethod.GET,
      );

      return request.data!;
    } catch (_) {
      rethrow;
    }
  }

  Future<PostModel> create(String id, FormData data) async {
    try {
      var request = await fetchData<PostModel>(
        url: "/api/v1/post/create",
        method: RequestMethod.POST,
        data: data,
      );

      return request.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<PostModel> like(String id) async {
    try {
      var request = await fetchData<PostModel>(
        url: "/api/v1/post/$id/like",
        method: RequestMethod.POST,
        isAlert: true,
      );

      return request.data!;
    } catch (_) {
      rethrow;
    }
  }

  static Future<PostModel> unlike(String id) async {
    try {
      var request = await fetchData<PostModel>(
        url: "/api/v1/post/$id/unlike",
        method: RequestMethod.DELETE,
        isAlert: true,
      );

      return request.data!;
    } catch (_) {
      rethrow;
    }
  }
}
