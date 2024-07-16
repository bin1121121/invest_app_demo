import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invest_app_flutter_test/ui/page/contact_info/components/show_image_picker.dart';
import 'package:invest_app_flutter_test/ui/page/contact_info/contact_info_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

class ContactInfoAvatarWidget extends StatelessWidget {
  final ContactInfoViewModel _viewModel;
  const ContactInfoAvatarWidget({
    required ContactInfoViewModel viewModel,
    super.key,
  }) : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    ImageProvider _imageProvider = _viewModel.image.path.isEmpty
        ? AssetImage(AppAssets.img_avatar) as ImageProvider
        : FileImage(
            File(_viewModel.image.path),
          );
    return GestureDetector(
      onTap: () => showImagePicker(context, _viewModel),
      child: Stack(
        children: [
          Container(
            width: 150.w,
            height: 150.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: _imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey1.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(AppAssets.ic_edit_2),
            ),
          ),
        ],
      ),
    );
  }
}
