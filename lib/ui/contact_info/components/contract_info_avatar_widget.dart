import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invest_app_flutter_test/ui/contact_info/components/show_image_picker.dart';
import 'package:invest_app_flutter_test/ui/contact_info/contact_info_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:provider/provider.dart';

class ContactInfoAvatarWidget extends StatelessWidget {
  const ContactInfoAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ContactInfoViewModel>();
    return GestureDetector(
      onTap: () => showImagePicker(context, viewModel),
      child: Stack(
        children: [
          if (viewModel.image.path.isNotEmpty)
            Container(
              height: 150.w,
              width: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(viewModel.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (viewModel.image.path.isEmpty)
            StreamBuilder<String?>(
                stream:
                    AppShared().watchUserProfile().map((e) => e?.avatar ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CachedNetworkImage(
                      imageUrl: snapshot.data ?? "",
                      imageBuilder: (context, imageProvider) => Container(
                        height: 150.w,
                        width: 150.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        width: 150.w,
                        height: 150.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grey2,
                        ),
                      ),
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
                }),
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
