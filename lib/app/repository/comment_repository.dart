import 'package:asa/app/models/comment/comment_model.dart';
import 'package:asa/services/api/fetch_data.dart';
import 'package:asa/services/api/request_method.dart';

class CommentRepository {
  static Future<List<CommentModel>> getAllComment(String id) async {
    try {
      var request = await fetchMultipleData<CommentModel>(
        url: "/api/v1/post/$id/comment",
        method: RequestMethod.GET,
      );
      return request.data!;
    } catch (err) {
      rethrow;
    }
  }

  static Future<CommentModel> add(
    String id,
    Map<String, String> data,
  ) async {
    try {
      var request = await fetchData<CommentModel>(
        url: "/api/v1/post/$id/comment",
        method: RequestMethod.POST,
        data: data,
      );
      return request.data!;
    } catch (err) {
      rethrow;
    }
  }

  static Future<CommentModel> like(
    String id,
  ) async {
    try {
      var request = await fetchData<CommentModel>(
        url: "/api/v1/post/qwe/$id/like",
        method: RequestMethod.POST,
      );

      return request.data!;
    } catch (err) {
      rethrow;
    }
  }

  static Future<CommentModel> unlike(
    String id,
  ) async {
    try {
      var request = await fetchData<CommentModel>(
        url: "/api/v1/post/qwe/$id/unlike",
        method: RequestMethod.DELETE,
      );

      return request.data!;
    } catch (err) {
      rethrow;
    }
  }
}
