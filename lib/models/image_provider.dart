import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageProfileProvider with ChangeNotifier {
  Uint8List? _image;

  Uint8List? get image => _image;

  set image(Uint8List? newImage) {
    _image = newImage;
    notifyListeners();
    _saveImageToPreferences(newImage);
  }

  ImageProfileProvider() {
    _loadImageFromPreferences();
  }

  // Save the image to shared_preferences as a base64 string
  Future<void> _saveImageToPreferences(Uint8List? image) async {
    if (image == null) return;
    final prefs = await SharedPreferences.getInstance();
    final imageString = base64Encode(image);
    prefs.setString('profile_image', imageString);
  }

  // Load the image from shared_preferences
  Future<void> _loadImageFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final imageString = prefs.getString('profile_image');
    if (imageString != null) {
      _image = base64Decode(imageString);
      notifyListeners();
    }
  }
}
