import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/page/contact_info/components/contract_info_avatar_widget.dart';
import 'package:invest_app_flutter_test/ui/page/contact_info/components/input_text_form_field_widget.dart';
import 'package:invest_app_flutter_test/ui/page/contact_info/components/selected_date.dart';
import 'package:invest_app_flutter_test/ui/page/contact_info/components/show_gender_picker.dart';
import 'package:invest_app_flutter_test/ui/page/contact_info/contact_info_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/components/icon_button_pre_page.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_string.dart';

class ContactInfoPage extends StatelessWidget {
  const ContactInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ContactInfoViewModel>(
      onViewModelReady: (viewModel) => viewModel.onInit(),
      viewModel: ContactInfoViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Form(
              key: viewModel.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50.w),
                    Row(
                      children: [
                        const IconButtonPrePage(),
                        Expanded(
                          child: Center(
                            child: Text(
                              AppString.contactInfo,
                              style:
                                  customContentTextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.w),
                    //avatar
                    ContactInfoAvatarWidget(
                      viewModel: viewModel,
                    ),
                    //user name
                    SizedBox(height: 30.w),
                    InputTextFormFieldWidget(
                      textEditingController: viewModel.userNameTextController,
                      labelText: AppString.name,
                      validator: (value) => viewModel.validUserName(value),
                    ),
                    //birthdate
                    SizedBox(height: 30.w),
                    InputTextFormFieldWidget(
                      textEditingController: viewModel.birthDateTextController,
                      labelText: AppString.birthDate,
                      readOnly: true,
                      onTap: () async {
                        DateTime? date = await selectedDate(context);
                        viewModel.dateFormatter(date);
                      },
                      validator: (value) => viewModel.validBirthDate(value),
                    ),
                    //gender
                    SizedBox(height: 30.w),
                    InputTextFormFieldWidget(
                      textEditingController: viewModel.genderTextController,
                      labelText: AppString.gender,
                      readOnly: true,
                      onTap: () {
                        showGenderPicker(context, viewModel);
                      },
                      validator: (value) => viewModel.validGender(value),
                    ),
                    //email
                    SizedBox(height: 30.w),
                    InputTextFormFieldWidget(
                      textEditingController: viewModel.emailTextController,
                      labelText: AppString.email,
                      validator: (value) => viewModel.validEmail(value),
                    ),
                    //phone
                    SizedBox(height: 30.w),
                    InputTextFormFieldWidget(
                      textEditingController:
                          viewModel.phoneNumberTextController,
                      labelText: AppString.phoneNumber,
                      keyboardType: TextInputType.number,
                      validator: (value) => viewModel.validPhoneNumber(value),
                    ),
                    SizedBox(height: 60.w),
                    Container(
                      margin: EdgeInsets.only(bottom: 40.w),
                      height: 60.w,
                      width: double.infinity,
                      child: customButtom(
                        backgroundColor: AppColors.green,
                        onPressed: () => viewModel.onSave(),
                        child: Text(
                          AppString.save,
                          style: customContentTextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
