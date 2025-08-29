import 'dart:io';

import 'package:events/cubit/user_cubit.dart';
import 'package:events/cubit/user_sate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<UserCubit>();
        final selectedImage = cubit.profilePicc;

        return InkWell(
          onTap: () async {
            final picked =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (picked != null) {
              cubit.uploadProfilePic(picked);
            }
          },
          child: SizedBox(
            width: 130,
            height: 130,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              backgroundImage: selectedImage != null
                  ? FileImage(File(selectedImage.path))
                  : null,
              child: selectedImage == null
                  ? const Icon(
                      Icons.add,
                      color: Colors.grey,
                      size: 50,
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}
