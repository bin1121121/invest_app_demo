import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';

class AccountAvatarWidget extends StatelessWidget {
  const AccountAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: AppShared()
          .watchUserProfile()
          .map((userProfile) => userProfile?.avatar),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CachedNetworkImage(
            imageUrl: snapshot.data ?? "",
            placeholder: (context, url) => Container(
              width: 150.w,
              height: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grey2,
              ),
            ),
            imageBuilder: (context, imageProvider) => Container(
              width: 150.w,
              height: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }
        return Center(
          child: Container(
            width: 150.w,
            height: 150.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey2,
            ),
          ),
        );
      },
    );
  }
}
