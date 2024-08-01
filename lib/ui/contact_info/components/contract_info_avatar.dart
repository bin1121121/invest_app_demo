import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invest_app_flutter_test/ui/contact_info/components/contact_info_image_picker.dart';
import 'package:invest_app_flutter_test/ui/contact_info/contact_info_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/app_cached_network_image.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_show_bottom_sheet.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:provider/provider.dart';

class ContactInfoAvatar extends StatelessWidget {
  const ContactInfoAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ContactInfoViewModel>();
    return GestureDetector(
      onTap: () => customShowBottomSheet(
          context, ContactInfoImagePicker(viewModel: viewModel)),
      child: Stack(
        children: [
          if (viewModel.imageFile != null)
            Container(
              height: 150.w,
              width: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(viewModel.imageFile!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (viewModel.imageFile == null)
            StreamBuilder<String?>(
              stream:
                  AppShared().watchUserProfile().map((e) => e?.avatar ?? ""),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return AppCachedNetworkImage(
                    imageUrl: snapshot.data ?? "",
                    width: 150,
                    height: 150,
                    shape: BoxShape.circle,
                  );
                } else {
                  return Container(
                    width: 150.w,
                    height: 150.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.grey2,
                    ),
                  );
                }
              },
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
              child: SvgPicture.asset(AppAssets.icEdit2),
            ),
          ),
        ],
      ),
    );
  }
}
