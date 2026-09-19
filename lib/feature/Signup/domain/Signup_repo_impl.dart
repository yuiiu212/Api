import 'dart:convert';

import 'package:docdoc_app/core/API/API_Services.dart';
import 'package:docdoc_app/core/API/API_constans.dart';
import 'package:docdoc_app/core/Utilis/cache_helper.dart';
import 'package:docdoc_app/feature/Signup/repo/Signup_repo.dart';

class SignupRepoImpl extends SignupRepo {
  final ApiServices apiServices = ApiServices();
  final CacheHelper cacheHelper = CacheHelper();

  @override
  Future<void> Signup({
    required Map<String, dynamic> body,
  }) async {
    final endpoint =
        '${ApiConstans.baseURL}'
        '${ApiConstans.apiVersion}'
        '${ApiConstans.module_1}'
        '${ApiConstans.registerEndPoint}';

    try {
      final response = await apiServices.Post(
        endpoint: endpoint,
        body: body,
      );

      print('Signup Status Code: ${response.statusCode}');
      print('Signup Response: ${response.body}');

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        final data = jsonDecode(response.body);

        final token = data['data']['token'];

        await cacheHelper.setUserToken(
          userToken: token,
        );

        print('Token Saved');
        print('Signup Success');

        return;
      }

      final data = jsonDecode(response.body);

      throw Exception(
        data['message'] ?? 'Signup Failed',
      );
    } catch (e) {
      print('Signup Error: $e');
      rethrow;
    }
  }
}