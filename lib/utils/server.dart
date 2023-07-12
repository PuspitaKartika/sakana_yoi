import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class BaseService {
  Future<http.Response> request(
      String endpoint, {
        RequestType requestType = RequestType.GET,
        dynamic data,
        Map<String, dynamic>? params,
        Map<String, String>? headers,
      }) async {
    try {
      final url = Uri.parse(endpoint);

      switch (requestType) {
        case RequestType.GET:
          {
            return await http.get(url, headers: headers);
          }
        case RequestType.POST:
          {
            return await http.post(url, body: jsonEncode(data), headers: headers);
          }
        case RequestType.UPDATE:
          {
            return await http.put(url, body: jsonEncode(data), headers: headers);
          }
        case RequestType.DELETE:
          {
            return await http.delete(url, headers: headers);
          }
      }
    } catch (e) {
      throw 'Terjadi kesalahan, silakan coba lagi';
    }
  }
}

enum RequestType { GET, POST, UPDATE, DELETE }

// Logger class can be removed as http package does not have built-in interceptor logging like dio

class MyHttpOverrides extends http.BaseClient {
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['connect-timeout'] = '20000';
    request.headers['receive-timeout'] = '20000';

    return _inner.send(request);
  }
}

