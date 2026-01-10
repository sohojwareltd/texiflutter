import 'dart:convert';

import 'package:taxiflutter/network/api_client.dart';

class AuthService {
  final _client = ApiClient(baseUrl: '');

  Future<Map> login(String email, String password) async {
    var response = await _client.post('', {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return {'success': true, 'message': 'welcome back'};
    }
    return {'success': false, 'error': 'login field'};
  }

  Future<Map<String, dynamic>> fachUser() async {
    var response = await _client.get('');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;

      return {'success': true, 'data': data};
    }
    return {'success': false, 'error': 'Unable to fach user'};
  }
}
