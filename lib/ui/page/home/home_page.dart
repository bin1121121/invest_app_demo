import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invest_app_flutter_test/core/resource/asset_icon.dart';
import 'package:invest_app_flutter_test/core/resource/color_manager.dart';
import 'package:invest_app_flutter_test/ui/page/home/home_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_card.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewmodel _homeViewmodel = HomeViewmodel();
    _homeViewmodel.getUserName();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorManager.white,
            pinned: true,
            floating: true,
            flexibleSpace: _buildManagerHeader(),
            automaticallyImplyLeading: false,
          ),
          // SliverToBoxAdapter(child: _buildManagerHeader()),
          SliverPadding(padding: EdgeInsets.only(top: 18.w)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                right: 30.w,
                left: 30.w,
              ),
              child: FittedBox(
                child: Text(
                  "Welcome, ${_homeViewmodel.userName}",
                  style: customHeaderTextStyle(color: ColorManager.black),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 34.w)),
          SliverToBoxAdapter(
            child: _buildTotalAsset(),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 20.w)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Plans",
                    style: customHeaderTextStyle(
                        fontSize: 22.w, color: ColorManager.black),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "See All "),
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
            child: _buildStockCarousel(_homeViewmodel),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 40.w)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Text(
                "Investment Guide",
                style: customHeaderTextStyle(
                    fontSize: 22, color: ColorManager.black),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 10.w)),
          SliverToBoxAdapter(
            child: _buidInvesGuidList(_homeViewmodel),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _homeViewmodel.bottomNavigationBarItems,
        selectedItemColor: ColorManager.green,
        selectedLabelStyle: customContentTextStyle(
          color: ColorManager.green,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: 'Catamaran',
        ),
        unselectedLabelStyle: customContentTextStyle(
          color: ColorManager.grey1,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: 'Catamaran',
        ),
      ),
    );
  }

  Widget _buidInvesGuidList(HomeViewmodel _homeViewmodel) {
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
                        color: ColorManager.grey1,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5.w),
                    Text(
                      investGuideCard.content,
                      style: customContentTextStyle(
                          color: ColorManager.grey1,
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

  Padding _buildManagerHeader() {
    return Padding(
      padding: EdgeInsets.only(
        right: 30.w,
        left: 30.w,
        top: 50.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AssetIcon.ic_menu),
          SvgPicture.asset(AssetIcon.ic_notifications)
        ],
      ),
    );
  }

  Widget _buildTotalAsset() {
    return Container(
      width: 354.w,
      height: 125.w,
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      padding: EdgeInsets.fromLTRB(30.w, 30.w, 15.w, 20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.green2,
            ColorManager.green1,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.w),
        boxShadow: [
          BoxShadow(
            color: ColorManager.green3.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your total asset portfolio",
            style: customContentTextStyle(
              color: ColorManager.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "N203,935",
                style: customContentTextStyle(
                    color: ColorManager.white, fontSize: 32.w),
              ),
              customButtom(
                backgroundColor: ColorManager.white,
                onPressed: () {},
                radius: 15.w,
                child: Text(
                  "Invest now",
                  style: customContentTextStyle(
                    color: ColorManager.green1,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStockCarousel(HomeViewmodel homeViewmodel) {
    return Container(
      height: 160.w,
      // width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 30.w),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: homeViewmodel.cardStockList.length,
        separatorBuilder: (context, index) => SizedBox(width: 20.w),
        itemBuilder: (context, index) {
          StockCard cardStock = homeViewmodel.cardStockList[index];
          return CustomCard(
              color1: cardStock.color2,
              color2: cardStock.color1,
              tile: cardStock.title,
              content: cardStock.subTitle,
              imgUrl: cardStock.image);
        },
      ),
    );
  }
}
