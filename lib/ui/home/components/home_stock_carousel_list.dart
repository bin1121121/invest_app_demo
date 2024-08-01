import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/home/components/home_card_item.dart';
import 'package:invest_app_flutter_test/ui/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeStockCarouselList extends StatelessWidget {
  const HomeStockCarouselList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return SizedBox(
      height: 160.w,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.cardStockList.length,
        separatorBuilder: (context, index) => SizedBox(width: 20.w),
        itemBuilder: (context, index) {
          StockCard cardStock = viewModel.cardStockList[index];
          return HomeCardItem(
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
