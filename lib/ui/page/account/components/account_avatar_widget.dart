import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/page/account/account_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';

class AccountAvatarWidget extends StatelessWidget {
  final AccountViewModel _viewModel;
  const AccountAvatarWidget({
    super.key,
    required AccountViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: _viewModel.avatarStream,
      builder: (context, snapshot) {
        ImageProvider _imageProvider = !snapshot.hasData
            ? const AssetImage(AppAssets.img_avatar) as ImageProvider
            : FileImage(
                File(snapshot.data!),
              );
        return Container(
          width: 150.w,
          height: 150.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: _imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
