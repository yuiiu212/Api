import 'dart:convert';

import 'package:docdoc_app/core/API/API_Services.dart';
import 'package:docdoc_app/core/API/API_constans.dart';
import 'package:docdoc_app/core/Utilis/cache_helper.dart';
import 'package:docdoc_app/feature/Login/repo/Login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final ApiServices apiServices = ApiServices();
  final CacheHelper cacheHelper = CacheHelper();

  @override
  Future<void> Login({
    required Map<String, dynamic> body,
  }) async {
    final endPoint =
        '${ApiConstans.baseURL}'
        '${ApiConstans.apiVersion}'
        '${ApiConstans.module_1}'
        '${ApiConstans.loginEndPoint}';

    try {
      final response = await apiServices.Post(
        endpoint: endPoint,
        body: body,
      );

      print('Login Status Code: ${response.statusCode}');
      print('Login Response: ${response.body}');

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        final data = jsonDecode(response.body);

        final token = data['data']['token'];

          cacheHelper.setUserToken(
          userToken: token,
        );

        print('Token Saved');
      } else {
        final data = jsonDecode(response.body);

        throw Exception(
          data['message'] ?? 'Login Failed',
        );
      }
    } catch (e) {
      print('Login Error: $e');
    }
  }
}