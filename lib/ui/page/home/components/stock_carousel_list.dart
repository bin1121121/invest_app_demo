import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/page/home/home_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_card.dart';

class StockCarouselList extends StatelessWidget {
  final HomeViewmodel _homeViewmodel;
  const StockCarouselList({super.key, required HomeViewmodel homeViewmodel})
      : _homeViewmodel = homeViewmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.w,
      // width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _homeViewmodel.cardStockList.length,
        separatorBuilder: (context, index) => SizedBox(width: 20.w),
        itemBuilder: (context, index) {
          StockCard cardStock = _homeViewmodel.cardStockList[index];
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
