import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app_team/models/image_provider.dart';
import 'package:provider/provider.dart';

class PickImage extends StatefulWidget {
  final Uint8List? initialImage;
  const PickImage({super.key, this.initialImage});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _image = widget.initialImage;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          _image != null
              ? CircleAvatar(
                  radius: 60,
                  backgroundImage: MemoryImage(_image!),
                  backgroundColor: Colors.grey,
                )
              : const CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.black87,
                  ),
                ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                showImagePickerOption(context);
              },
              icon: const Icon(
                Icons.add_a_photo,
                size: 36,
                color: Colors.purpleAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 70,
                          color: Color.fromARGB(255, 131, 128, 128),
                        ),
                        Text("Gallery")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 70,
                          color: Color.fromARGB(255, 131, 128, 128),
                        ),
                        Text("Camera")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    final imageBytes = File(returnImage.path).readAsBytesSync();
    setState(() {
      _image = imageBytes;
    });
    Provider.of<ImageProfileProvider>(context, listen: false).image =
        imageBytes;
    Navigator.of(context).pop(); // Close the modal sheet
  }

  Future<void> _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    final imageBytes = File(returnImage.path).readAsBytesSync();
    setState(() {
      _image = imageBytes;
    });
    Provider.of<ImageProfileProvider>(context, listen: false).image =
        imageBytes;
    Navigator.of(context).pop(); // Close the modal sheet
  }
}
