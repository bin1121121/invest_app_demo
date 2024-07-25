import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/models/home_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class HomeStockCarouselList extends StatelessWidget {
  const HomeStockCarouselList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return Container(
      height: 160.w,
      // width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.cardStockList.length,
        separatorBuilder: (context, index) => SizedBox(width: 20.w),
        itemBuilder: (context, index) {
          StockCard cardStock = viewModel.cardStockList[index];
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
