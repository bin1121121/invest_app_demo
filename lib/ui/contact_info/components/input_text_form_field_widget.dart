import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_fonts.dart';

class InputTextFormFieldWidget extends StatelessWidget {
  final TextEditingController _textEditingController;
  final String _labelText;
  final bool _readOnly;
  final Function _onTap;
  final TextInputType _keyboardType;
  final String? Function(String?)? _validator;
  InputTextFormFieldWidget({
    super.key,
    required TextEditingController textEditingController,
    required String labelText,
    bool? readOnly,
    Function? onTap,
    TextInputType? keyboardType,
    String? Function(String? value)? validator,
  })  : _textEditingController = textEditingController,
        _labelText = labelText,
        _readOnly = readOnly ?? false,
        _onTap = onTap ?? (() {}),
        _keyboardType = keyboardType ?? TextInputType.text,
        _validator = validator;

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter>? _inputFormatters =
        _keyboardType == TextInputType.number
            ? [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                LengthLimitingTextInputFormatter(10),
              ]
            : null;
    return TextFormField(
      validator: _validator,
      keyboardType: _keyboardType,
      readOnly: _readOnly,
      onTap: () => _onTap(),
      inputFormatters: _inputFormatters,
      controller: _textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          bottom: 10.w,
        ),
        labelText: _labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: customContentTextStyle(
          color: AppColors.black1,
          fontFamily: AppFonts.Catamaran,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.black,
            width: 0.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.green,
            width: 0.5,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
            width: 0.5,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.green,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
