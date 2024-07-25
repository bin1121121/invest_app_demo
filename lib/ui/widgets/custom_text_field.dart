import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? isPasswordVisible;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTapToSelect;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function()? onPressedChangeVisibility;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.onPressedChangeVisibility,
    this.isPasswordVisible,
    this.onTapToSelect,
    this.readOnly,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      onTap: () => onTapToSelect?.call(),
      controller: controller,
      obscureText: isPasswordVisible ?? false,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: hintText,
        suffixIcon: isPasswordVisible != null
            ? IconButton(
                onPressed: () => onPressedChangeVisibility?.call(),
                icon: Icon(
                  isPasswordVisible! ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.green,
                ),
              )
            : null,
      ),
      onChanged: (value) => onChanged?.call(value),
      validator: (value) => validator?.call(value),
    );
  }
}
