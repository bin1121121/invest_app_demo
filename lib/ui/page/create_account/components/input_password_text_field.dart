import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

class InPutPasswordTextField extends StatelessWidget {
  final TextEditingController _controller;
  final String _labelText;
  final bool _isVisible;
  final Function _onChangeVisibility;
  final Function(String?)? _validator;
  final Function(String)? _onChangeTextField;
  const InPutPasswordTextField({
    super.key,
    required TextEditingController texEditingController,
    required bool isVisible,
    required String labelText,
    required Function onChangeVisibility,
    required Function(String?)? validator,
    required Function(String)? onChangeTextField,
  })  : _controller = texEditingController,
        _isVisible = isVisible,
        _labelText = labelText,
        _onChangeVisibility = onChangeVisibility,
        _validator = validator,
        _onChangeTextField = onChangeTextField;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isVisible,
      controller: _controller,
      decoration: InputDecoration(
        labelText: _labelText,
        suffixIcon: IconButton(
          onPressed: () => _onChangeVisibility(),
          icon: Icon(
            _isVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.green,
          ),
        ),
      ),
      validator: (value) => _validator!(value),
      onChanged: (value) => _onChangeTextField!(value),
    );
  }
}
