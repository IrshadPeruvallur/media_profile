import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:profile_page/model/user_model.dart';

class MediaService {
  final Dio _dio = Dio();

  getMedia() async {
    const url = 'https://rubidya.com/api/users/get-media';
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjBiZmUxODE3ZmYzZjBkMmZjMmQwNGUiLCJpYXQiOjE3MTQ3MTkyMDMsImV4cCI6MTc4MzgzOTIwM30.HfsYDcVEzMsdi6pU24IzHzmGAxfDQ2NAJYIptOAu_9I';

    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: MediaModel().toJson(token),
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> media = response.data['media'];
        return media.map((data) => MediaModel.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch Data');
      }
    } catch (e) {
      log('Error: $e');

      rethrow;
    }
  }
}
