import 'dart:convert';
// import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sin_api/models/SignUpModel.dart';

class SignUpServer {
  Future<SignUpModel> SignUp({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required String phone,
    // required File profilePic,
  }) async {
    try {
      var request = http.MultipartRequest('POST',
          Uri.parse('https://food-api-omega.vercel.app/api/v1/user/signup'));
      request.fields.addAll({
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'location':
            '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}'
      });
      // request.files.add(await http.MultipartFile.fromPath('profilePic', profilePic.path));

      //~ إرسال الطلب واستلام الاستجابة
      http.StreamedResponse response = await request.send();

      //~ التحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        // ~إذا كانت الحالة 200، قراءة بيانات الاستجابة كسلسلة نصية
        var responseData = await response.stream.bytesToString();

        //~  تحويل البيانات النصية إلى JSON وإنشاء كائن SignUpModel منه
        return SignUpModel.fromJson(jsonDecode(responseData));
      } else {
        var responseData = await response.stream.bytesToString();
        throw Exception(
            'Failed to sign up: ${response.reasonPhrase}, Response: $responseData');
      }
    } catch (e) {
      throw Exception('SignUpServer class failed to sign up: $e');
    }
  }
}
