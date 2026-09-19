import 'dart:convert';

import 'package:docdoc_app/core/API/API_Services.dart';
import 'package:docdoc_app/core/API/API_constans.dart';
import 'package:docdoc_app/core/Utilis/cache_helper.dart';
import 'package:docdoc_app/feature/Home/repo/Home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices = ApiServices();
  final CacheHelper cacheHelper = CacheHelper();

  @override
  Future<Map<String, dynamic>> Homeview() async {
    final endPoint =
        '${ApiConstans.baseURL}'
        '${ApiConstans.apiVersion}'
        '${ApiConstans.module_2}'
        '${ApiConstans.homeEndPoint}';

    try {
      final token = cacheHelper.getuserToken();

      print('Home URL: $endPoint');
      print('Token exists: ${token.isNotEmpty}');

      if (token.isEmpty) {
        throw Exception('User token not found');
      }

      final response = await apiServices.Get(
        endpoint: endPoint,
        token: token,
      );

      print('Home Status Code: ${response.statusCode}');
      print('Home Response: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return data;
      }

      final data = jsonDecode(response.body);

      throw Exception(
        data['message'] ?? 'Home request failed',
      );
    } catch (e) {
      print('Home Error: $e');
      rethrow;
    }
  }
}