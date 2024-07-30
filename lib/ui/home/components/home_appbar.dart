import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/home/components/home_manager_header.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      pinned: true,
      floating: true,
      flexibleSpace: const HomeManagerHeader(),
      automaticallyImplyLeading: false,
    );
  }
}
