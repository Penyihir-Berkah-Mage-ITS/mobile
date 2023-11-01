import 'package:asa/app/models/post/post_model.dart';
import 'package:asa/services/api/fetch_data.dart';
import 'package:asa/services/api/request_method.dart';
import 'package:dio/dio.dart';

class PostRepository {
  Future<List<PostModel>> getHome() async {
    try {
      var request = await fetchMultipleData<PostModel>(
        url: "/api/v1/home/",
        method: RequestMethod.GET,
      );

      return request.data!;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<PostModel>> getLatest() async {
    try {
      var request = await fetchMultipleData<PostModel>(
        url: "/api/v1/home/latest",
        method: RequestMethod.GET,
      );

      return request.data!;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<PostModel>> getPopular() async {
    try {
      var request = await fetchMultipleData<PostModel>(
        url: "/api/v1/home/popular",
        method: RequestMethod.GET,
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

  Future<PostModel> like(String id, FormData data) async {
    try {
      var request = await fetchData<PostModel>(
        url: "/api/v1/post/$id/like",
        method: RequestMethod.POST,
        data: data,
      );

      return request.data!;
    } catch (_) {
      rethrow;
    }
  }
}
