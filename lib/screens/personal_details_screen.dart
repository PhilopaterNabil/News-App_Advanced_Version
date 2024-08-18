import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:news_app_team/components/build_detail_row.dart';
import 'package:news_app_team/components/my_alert_dialog.dart';
import 'package:news_app_team/components/pick_image.dart';
import 'package:news_app_team/models/image_provider.dart';
import 'package:provider/provider.dart';

class PersonalDetailsScreen extends StatelessWidget {
  final Uint8List? initialImage;

  const PersonalDetailsScreen({super.key, this.initialImage});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProfileProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Personal Details',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 20),
            // const Text(
            //   "Personal details",
            //   style: TextStyle(
            //     color: Colors.grey,
            //     fontSize: 30,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const SizedBox(height: 20),
            PickImage(initialImage: imageProvider.image),
            const SizedBox(height: 20),
            // Other detail rows...
            const BuildDetailRow(
              title: 'Your Name',
              value: 'karol hany',
              action: 'Edit',
            ),
            const BuildDetailRow(
              title: 'Email',
              value: 'karolhany09@gmail.com',
              action: 'Edit',
            ),
            const BuildDetailRow(
              title: 'Password',
              value: '************',
              action: 'Edit',
            ),
            const BuildDetailRow(
              title: 'Birthday',
              value: '16/5/2004',
              action: 'Edit',
            ),
            const BuildDetailRow(
              title: 'Country of residence',
              value: 'Egypt',
              action: 'Edit',
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 184, 33, 33),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const MyAlertDialog(),
                    );
                  },
                  child: const Text(
                    'Delete your account?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
