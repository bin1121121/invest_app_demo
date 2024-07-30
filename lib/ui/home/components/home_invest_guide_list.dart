import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/home/home_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:provider/provider.dart';

class HomeInvestGuideList extends StatelessWidget {
  const HomeInvestGuideList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        itemCount: viewModel.investGuideCardList.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          InvestGuideCard investGuideCard =
              viewModel.investGuideCardList[index];
          return Row(
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      investGuideCard.title,
                      style: customHeaderTextStyle(
                        color: AppColors.grey1,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5.w),
                    Text(
                      investGuideCard.content,
                      style: customContentTextStyle(
                          color: AppColors.grey1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(investGuideCard.image),
              ),
            ],
          );
        },
      ),
    );
  }
}
