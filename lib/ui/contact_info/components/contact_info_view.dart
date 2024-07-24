import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/contact_info/components/contract_info_avatar_widget.dart';
import 'package:invest_app_flutter_test/ui/contact_info/components/input_text_form_field_widget.dart';
import 'package:invest_app_flutter_test/ui/contact_info/components/selected_date.dart';
import 'package:invest_app_flutter_test/ui/contact_info/components/show_gender_picker.dart';
import 'package:invest_app_flutter_test/ui/contact_info/contact_info_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/create_account/components/icon_button_pre_page.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/ui/widgets/exnpanded_child_scroll_view.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class ContactInfoView extends StatelessWidget {
  final ContactInfoViewModel _viewModel;
  const ContactInfoView({
    required ContactInfoViewModel viewModel,
    super.key,
  }) : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.w, 0.w, 30.w, 30.w),
        child: ExpandedChildScrollView(
          child: Form(
            key: _viewModel.formKey,
            child: Column(
              children: [
                SizedBox(height: 50.w),
                Row(
                  children: [
                    const IconButtonPrePage(),
                    Expanded(
                      child: Center(
                        child: Text(
                          AppLanguages.contactInfo,
                          style: customContentTextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.w),
                //avatar
                ContactInfoAvatarWidget(
                  viewModel: _viewModel,
                ),
                //user name
                SizedBox(height: 30.w),
                InputTextFormFieldWidget(
                  textEditingController: _viewModel.userNameTextController,
                  labelText: AppLanguages.name,
                  validator: (value) => _viewModel.validUserName(value),
                ),
                //birthDate
                SizedBox(height: 30.w),
                InputTextFormFieldWidget(
                  textEditingController: _viewModel.birthDateTextController,
                  labelText: AppLanguages.birthDate,
                  readOnly: true,
                  onTap: () async {
                    DateTime? date = await selectedDate(context);
                    _viewModel.dateFormatter(date);
                  },
                  validator: (value) => _viewModel.validBirthDate(value),
                ),
                //gender
                SizedBox(height: 30.w),
                InputTextFormFieldWidget(
                  textEditingController: _viewModel.genderTextController,
                  labelText: AppLanguages.gender,
                  readOnly: true,
                  onTap: () {
                    showGenderPicker(context, _viewModel);
                  },
                  validator: (value) => _viewModel.validGender(value),
                ),
                //email
                SizedBox(height: 30.w),
                InputTextFormFieldWidget(
                  textEditingController: _viewModel.emailTextController,
                  labelText: AppLanguages.email,
                  validator: (value) => _viewModel.validEmail(value),
                ),
                //phone
                SizedBox(height: 30.w),
                InputTextFormFieldWidget(
                  textEditingController: _viewModel.phoneNumberTextController,
                  labelText: AppLanguages.phoneNumber,
                  keyboardType: TextInputType.number,
                  validator: (value) => _viewModel.validPhoneNumber(value),
                ),
                SizedBox(height: 60.w),
                SizedBox(
                  height: 60.w,
                  width: double.infinity,
                  child: customButton(
                    backgroundColor: AppColors.green,
                    onPressed: () => _viewModel.onSave(),
                    child: Text(
                      AppLanguages.save,
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
  }
}
