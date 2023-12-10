import 'package:http/http.dart' as Http;
import 'package:get/get_connect/http/src/response/response.dart';
import 'dart:convert';

class ApiClient {
  final String appBaseUrl;
  final int timeoutInSeconds = 30;

  ApiClient({required this.appBaseUrl});

  Future<Response> postData(String uri, dynamic body) async {
    dynamic _body;
    try {
      Http.Response response = await Http.post(
        Uri.parse(appBaseUrl+uri),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(Duration(seconds: timeoutInSeconds));
      print(response.body);
      _body = jsonDecode(response.body);
      return Response(
        body: _body,
        statusCode: response.statusCode,
        statusText: response.reasonPhrase,
      );
    } catch (e) {
      throw Exception('Error al cargar los datos');
    }
  }
}