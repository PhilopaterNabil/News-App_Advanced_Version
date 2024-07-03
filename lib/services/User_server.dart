// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sin_api/cubit/user_cubit.dart';
import 'package:sin_api/models/userModel.dart';

class UserServer {
  Future<UserModel> userServer(BuildContext context) async {
    try {
      String yourToken = BlocProvider.of<UserCubit>(context).response.token;
      Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
      print(decodedToken.keys.first);
      var request = http.MultipartRequest(
          'get',
          Uri.parse(
              'https://food-api-omega.vercel.app/api/v1/user/get-user/${decodedToken.values.first}'));
      request.fields.addAll({
        'token': 'FOODAPI yourToken',
      });

      //~ إرسال الطلب واستلام الاستجابة
      http.StreamedResponse response = await request.send();

      //~ التحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        // ~إذا كانت الحالة 200، قراءة بيانات الاستجابة كسلسلة نصية
        var responseData = await response.stream.bytesToString();

        //~  تحويل البيانات النصية إلى JSON وإنشاء كائن SignUpModel منه
        return UserModel.fromJson(jsonDecode(responseData));
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
