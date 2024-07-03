import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sin_api/core/Error/handleHttpExceptions.dart';

class Api {
  Future<dynamic> post({
    required String uri,
    required dynamic body,
    Map<String, String>? headers, // Added headers as an optional parameter
  }) async {
    try {
      var response = await http.post(
        Uri.parse(uri),
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        handleHttpExceptions(response); // Using handleHttpExceptions here
      }
    } catch (e) {
      throw Exception('API CLASS Failed to post data: $e');
    }
  }

  Future<dynamic> get({
    required String uri,
    required dynamic body,
    Map<String, String>? headers, // Added headers as an optional parameter
  }) async {
    try {
      var response = await http.post(
        Uri.parse(uri),
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        return jsonDecode(response.body);
      } else {
        handleHttpExceptions(response); // Using handleHttpExceptions here
      }
    } catch (e) {
      throw Exception('API CLASS Failed to post data: $e');
    }
  }
}
