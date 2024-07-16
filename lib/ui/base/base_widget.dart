import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

import 'base_viewmodel.dart';

class BaseWidget<T extends BaseViewModel> extends StatelessWidget {
  final T viewModel;
  final Widget Function(BuildContext context, T viewModel, Widget? child)
      builder;
  final Widget? child;
  final ValueChanged<T>? onViewModelReady;

  const BaseWidget({
    super.key,
    required this.viewModel,
    required this.builder,
    this.child,
    this.onViewModelReady,
  });

  @override
  Widget build(BuildContext context) {
    viewModel.setContext(context);
    return ChangeNotifierProvider<T>(
      create: (context) {
        onViewModelReady?.call(viewModel);
        return viewModel;
      },
      child: KeyboardDismisser(
        child: Consumer<T>(
          builder: builder,
          child: child,
        ),
      ),
    );
  }
}
