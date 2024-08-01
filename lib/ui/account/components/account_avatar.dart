import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/widgets/app_cached_network_image.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';

class AccountAvatar extends StatelessWidget {
  const AccountAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: AppShared()
          .watchUserProfile()
          .map((userProfile) => userProfile?.avatar),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return AppCachedNetworkImage(
            imageUrl: snapshot.data ?? "",
            width: 150,
            height: 150,
            shape: BoxShape.circle,
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
