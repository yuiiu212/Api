import 'package:http/http.dart' as http;

class ApiServices {
  Future<http.Response> Post({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? header = const {
      'Accept': 'application/json',
    },
  }) async {
    final uri = Uri.parse(endpoint);

    final response = await http.post(
      uri,
      body: body,
      headers: header,
    );

    return response;
  }

  Future<http.Response> Get({
    required String endpoint,
    required String token,
  }) async {
    final uri = Uri.parse(endpoint);

    print('GET Started');
    print('GET URL: $endpoint');

    final response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('GET Finished');

    return response;
  }
}