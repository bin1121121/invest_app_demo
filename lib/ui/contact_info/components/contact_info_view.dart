import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/helper/input_formatter.dart';
import 'package:invest_app_flutter_test/helper/validation.dart';
import 'package:invest_app_flutter_test/ui/contact_info/components/contact_info_button_save.dart';
import 'package:invest_app_flutter_test/ui/contact_info/components/contact_info_gender_picker.dart';
import 'package:invest_app_flutter_test/ui/contact_info/components/contract_info_avatar.dart';
import 'package:invest_app_flutter_test/ui/contact_info/contact_info_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/icon_button_pre_page.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_field.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/ui/widgets/exnpanded_child_scroll_view.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_show_bottom_sheet.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class ContactInfoView extends StatelessWidget {
  const ContactInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ContactInfoViewModel>();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: IconButtonPrePage(),
        ),
        title: Text(
          AppLanguages.contactInfo,
          style: CustomTextStyle().contentTextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ExpandedChildScrollView(
        padding: EdgeInsets.fromLTRB(30.w, 0.w, 30.w, 20.w),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              SizedBox(height: 50.w),
              //avatar
              ContactInfoAvatar(),
              //user name
              SizedBox(height: 30.w),
              CustomTextField(
                controller: viewModel.userNameTextController,
                hintText: AppLanguages.name,
                validator: ValidationHelper().isUserNameValidMessage,
                onChanged: (value) => viewModel.isAllInputValidSink(),
              ),
              //birthDate
              SizedBox(height: 30.w),
              CustomTextField(
                  controller: viewModel.birthDateTextController,
                  hintText: AppLanguages.birthDate,
                  readOnly: true,
                  onTapToSelect: viewModel.selectedDate,
                  validator: ValidationHelper().isBirthDateValidMessage,
                  onChanged: (value) => viewModel.isAllInputValidSink()),
              //gender
              SizedBox(height: 30.w),
              CustomTextField(
                  controller: viewModel.genderTextController,
                  hintText: AppLanguages.gender,
                  readOnly: true,
                  onTapToSelect: () => customShowBottomSheet(
                      context, ContactInfoGenderPicker(viewModel: viewModel)),
                  validator: ValidationHelper().isGenderValidMessage,
                  onChanged: (value) => viewModel.isAllInputValidSink()),
              //email
              SizedBox(height: 30.w),
              CustomTextField(
                  controller: viewModel.emailTextController,
                  hintText: AppLanguages.email,
                  validator: ValidationHelper().isEmailValidMessage,
                  onChanged: (value) => viewModel.isAllInputValidSink()),
              //phone
              SizedBox(height: 30.w),
              CustomTextField(
                controller: viewModel.phoneNumberTextController,
                hintText: AppLanguages.phoneNumber,
                keyboardType: TextInputType.number,
                validator: ValidationHelper().isPhoneNumberValid,
                inputFormatters: inputFormattersForNumberPhone,
                onChanged: (value) => viewModel.isAllInputValidSink(),
              ),
              SizedBox(height: 60.w),
              ContactInfoButtonSave(),
            ],
          ),
        ),
      ),
    );
  }
}
