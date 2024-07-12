import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invest_app_flutter_test/core/resource/asset_icon.dart';
import 'package:invest_app_flutter_test/core/resource/color_manager.dart';
import 'package:invest_app_flutter_test/core/resource/string_manager.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/create_account_viewmodel.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  CreateAccountViewmodel _createAccountViewmodel = CreateAccountViewmodel();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _createAccountViewmodel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 50.w,
                    ),
                    padding: EdgeInsets.all(5.w),
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(AssetIcon.ic_pre),
                  ),
                ),
                SizedBox(height: 20.w),
                Text(
                  "Create an account",
                  style: customHeaderTextStyle(color: ColorManager.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.w),
                Text(
                  "Invest and double your income now",
                  style: customContentTextStyle(color: ColorManager.grey1),
                ),
                SizedBox(height: 87.w),
                TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                  ),
                  validator: (value) {
                    if (!_createAccountViewmodel.isUserNameValid(value ?? "")) {
                      return StringManager.userNameError;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _createAccountViewmodel.setUserName(value);
                  },
                ),
                SizedBox(height: 18.w),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (!_createAccountViewmodel.isEmailValid(value ?? "")) {
                      return StringManager.emailError;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _createAccountViewmodel.setEmail(value);
                  },
                ),
                SizedBox(height: 18.w),
                Consumer<CreateAccountViewmodel>(
                  builder: (context, createAccountViewmodel, child) {
                    return TextFormField(
                      obscureText: createAccountViewmodel.isPasswordVisible,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            createAccountViewmodel.changePasswordVisibility();
                          },
                          icon: Icon(
                            createAccountViewmodel.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: ColorManager.green,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (!createAccountViewmodel
                            .isPasswordValid(value ?? "")) {
                          return StringManager.passwordError;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _createAccountViewmodel.setPassword(value);
                      },
                    );
                  },
                ),
                SizedBox(height: 30.w),
                StreamBuilder<bool>(
                  stream: _createAccountViewmodel.isAllInputsValidStream,
                  builder: (context, snapshot) {
                    return SizedBox(
                      height: 60.w,
                      width: MediaQuery.of(context).size.width,
                      child: customButtom(
                        backgroundColor: snapshot.data == true
                            ? ColorManager.green
                            : ColorManager.grey2,
                        onPressed: snapshot.data == true
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  _createAccountViewmodel.onRegister(context);
                                }
                              }
                            : () {},
                        child: Text(
                          "Create Account",
                          style: customContentTextStyle(
                            color: ColorManager.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 40.w),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Already have an account?",
                    style: customContentTextStyle(color: ColorManager.green),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
