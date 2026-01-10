import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final http.Client _client = http.Client();

  ApiClient({required this.baseUrl});

  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    return await _client.get(url,headers: headers);
  }

  Future<http.Response> post (String endpoint,Map<String,dynamic>body)async{

    var url =Uri.parse('$baseUrl/$endpoint');
    var headers = {
      'Accept': 'application/json',
      'Content-type': 'application/json',
    };

    return await _client.post(url,body: body,headers: headers);
  }

}
