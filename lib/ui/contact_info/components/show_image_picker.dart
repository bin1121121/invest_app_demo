import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invest_app_flutter_test/core/models/contact_info_viewmodel.dart';

void showImagePicker(BuildContext context, ContactInfoViewModel viewModel) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () => viewModel.pickImage(ImageSource.camera),
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Gallery'),
            onTap: () => viewModel.pickImage(ImageSource.gallery),
          ),
        ],
      );
    },
  );
}
