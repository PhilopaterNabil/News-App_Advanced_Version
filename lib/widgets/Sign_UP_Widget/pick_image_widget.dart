import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sin_api/cubit/user_cubit.dart';
import 'package:sin_api/cubit/user_state.dart';

// class PickImageWidget extends StatelessWidget {
//   const PickImageWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UserCubit, UserState>(
//       listener: (context, state) {
//         if (state is UploadProfilePic) {}
//       },
//       builder: (context, state) {
//         return const DefaultImage();
//         // if (context.read<UserCubit>().profilePic == null) {
//         //   return const DefaultImage();
//         // } else {
//         //   return SizedBox(
//         //     width: 130,
//         //     height: 130,
//         //     child: CircleAvatar(
//         //       backgroundColor: Colors.grey.shade200,
//         //       backgroundImage: FileImage(
//         //           File(context.read<UserCubit>().profilePic?.path ?? '')),
//         //       child: Stack(
//         //         children: [
//         //           Positioned(
//         //             bottom: 5,
//         //             right: 5,
//         //             child: Container(
//         //               height: 50,
//         //               width: 50,
//         //               decoration: BoxDecoration(
//         //                 color: Colors.blue.shade400,
//         //                 border: Border.all(color: Colors.white, width: 3),
//         //                 borderRadius: BorderRadius.circular(25),
//         //               ),
//         //               child: InkWell(
//         //                 onTap: () {
//         //                   ImagePicker()
//         //                       .pickImage(source: ImageSource.camera)
//         //                       .then((value) {
//         //                     if (value != null) {
//         //                       context.read<UserCubit>().uploadProFilePic(value);
//         //                     }
//         //                   });
//         //                 },
//         //                 child: const Icon(
//         //                   Icons.camera_alt_sharp,
//         //                   color: Colors.white,
//         //                   size: 25,
//         //                 ),
//         //               ),
//         //             ),
//         //           ),
//         //         ],
//         //       ),
//         //     ),
//         //   );
//         // }
//       },
//     );
//   }
// }

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UploadProfilePic) {}
      },
      builder: (context, state) => SizedBox(
        width: 130,
        height: 130,
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          backgroundImage: context.read<UserCubit>().profilePic == null
              ? const AssetImage("assets/images/avatar.png")
              : FileImage(
                  File(context.read<UserCubit>().profilePic?.path ?? '')),
          child: Stack(
            children: [
              Positioned(
                bottom: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: InkWell(
                      onTap: () {
                        ImagePicker()
                            .pickImage(source: ImageSource.gallery)
                            .then((value) {
                          if (value != null) {
                            context.read<UserCubit>().uploadProFilePic(value);
                          }
                        });
                      },
                      child: const Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
