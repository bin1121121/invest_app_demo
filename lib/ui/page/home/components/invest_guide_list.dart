import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/page/home/home_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

class InvestGuideList extends StatelessWidget {
  final HomeViewmodel _homeViewmodel;
  const InvestGuideList({
    super.key,
    required HomeViewmodel homeViewmodel,
  }) : _homeViewmodel = homeViewmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        itemCount: _homeViewmodel.investGuideCardList.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          InvestGuideCard investGuideCard =
              _homeViewmodel.investGuideCardList[index];
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
