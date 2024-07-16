import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invest_app_flutter_test/ui/page/contact_info/contact_info_viewmodel.dart';

void showImagePicker(BuildContext context, ContactInfoViewModel viewModel) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Camera'),
            onTap: () => viewModel.pickImage(ImageSource.camera),
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Gallery'),
            onTap: () => viewModel.pickImage(ImageSource.gallery),
          ),
        ],
      );
    },
  );
}
