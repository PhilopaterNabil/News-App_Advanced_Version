import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sin_api/core/Error/errorModel.dart';

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel});
}

Future<void> handleHttpExceptions(http.Response response) async {
  switch (response.statusCode) {
    case 400: // Bad request
      throw ServerException(errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    case 401: // Unauthorized
      throw ServerException(errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    case 403: // Forbidden
      throw ServerException(errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    case 404: // Not found
      throw ServerException(errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    case 409: // Conflict
      throw ServerException(errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    case 422: // Unprocessable Entity
      throw ServerException(errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    case 504: // Server exception
      throw ServerException(errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    default:
      if (response.statusCode >= 500 && response.statusCode <= 599) {
        throw ServerException(errModel: ErrorModel.fromJson(jsonDecode(response.body)));
      }
  }
}
