import 'package:sin_api/helper/Api.dart';
import 'package:sin_api/models/SignIN_model.dart';

class SigningServer {
  Future<SignInModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json', // Specific headers for this request
      };

      Map<String, dynamic> data = await Api().post(
        uri: 'https://food-api-omega.vercel.app/api/v1/user/signin',
        body: {
          "email": email,
          "password": password,
        },
        headers: headers, // Pass the headers to the Api class
      );
      return SignInModel.fromJson(data);
    } catch (e) {
      throw Exception('SigningServer class Failed to sign in: $e');
    }
  }
}
