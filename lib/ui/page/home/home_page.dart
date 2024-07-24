import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/page/home/components/invest_guide_list.dart';
import 'package:invest_app_flutter_test/ui/page/home/components/manager_header.dart';
import 'package:invest_app_flutter_test/ui/page/home/components/stock_carousel_list.dart';
import 'package:invest_app_flutter_test/ui/page/home/components/total_asset.dart';
import 'package:invest_app_flutter_test/ui/page/home/components/welcome_title.dart';
import 'package:invest_app_flutter_test/ui/page/home/home_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewmodel>(
      viewModel: HomeViewmodel(),
      onViewModelReady: (value) => value.onInit(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: AppColors.background,
                pinned: true,
                floating: true,
                flexibleSpace: const ManagerHeader(),
                automaticallyImplyLeading: false,
              ),
              SliverPadding(padding: EdgeInsets.only(top: 18.w)),
              SliverToBoxAdapter(
                child: WelcomeTitle(homeViewmodel: viewModel),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 34.w)),
              const SliverToBoxAdapter(
                child: TotalAsset(),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 20.w)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLanguages.bestPlans,
                        style: customHeaderTextStyle(
                            fontSize: 22.w, color: AppColors.black),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(text: AppLanguages.seeAll),
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.red,
                                size: 23.w,
                              ),
                            )
                          ],
                          style: customContentTextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 20.w)),
              SliverToBoxAdapter(
                child: StockCarouselList(homeViewmodel: viewModel),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 40.w)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Text(
                    AppLanguages.InvestmentGuide,
                    style: customHeaderTextStyle(
                        fontSize: 22, color: AppColors.black),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 10.w)),
              SliverToBoxAdapter(
                child: InvestGuideList(
                  homeViewModel: viewModel,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
