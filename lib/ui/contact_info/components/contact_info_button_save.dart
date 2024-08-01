import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/contact_info/contact_info_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class ContactInfoButtonSave extends StatelessWidget {
  const ContactInfoButtonSave({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ContactInfoViewModel>();
    return SizedBox(
      height: 60.w,
      width: double.infinity,
      child: StreamBuilder<bool>(
          stream: viewModel.enableSaveButtonSubject,
          builder: (context, snapshot) {
            return CustomButton(
              backgroundColor:
                  snapshot.data == true ? AppColors.green : AppColors.grey2,
              onPressed: snapshot.data == true ? viewModel.onSave : () {},
              child: Text(
                AppLanguages.save,
                style:
                    CustomTextStyle().contentTextStyle(color: AppColors.white),
              ),
            );
          }),
    );
  }
}
