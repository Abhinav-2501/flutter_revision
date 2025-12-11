import 'package:dio/dio.dart';

import '../core/config/dio_client.dart';

class AuthRepository {
  final Dio _dio = DioClient().dio;

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post(
      "/login",
      data: {
        "email": email,
        "password": password,
      },
    );
    return response.data;
  }
}
