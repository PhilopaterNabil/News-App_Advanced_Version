// ignore_for_file: camel_case_types

// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:sin_api/helper/Api.dart';
import 'package:sin_api/models/check_email_Model.dart';

class Check_email_Server {
  Future<CheckEmailModel> checkEmail({
    required String email,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json', // Specific headers for this request
      };

      var api = Api();
      var response = await api.post(
        uri: 'https://food-api-omega.vercel.app/api/v1/user/check-email',
        body: {
          "email": email,
        },
        headers: headers, // Pass the headers to the Api class
      );

      // التحقق من حالة الاستجابة
      if (response != null && response is Map<String, dynamic>) {
        // تحويل البيانات النصية إلى JSON وإنشاء كائن CheckEmailModel منه
        return CheckEmailModel.fromJson(response);
      } else if (response == null) {
        throw Exception('Failed to load data: Response is null');
      } else {
        throw Exception('Failed to load data: Invalid response format');
      }
    } catch (e) {
      throw Exception('CheckEmailServer class Failed to check email: $e');
    }
  }
}
