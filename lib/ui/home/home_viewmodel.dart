import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/helper/routers.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

class HomeViewModel extends BaseViewModel {
  final List<StockCard> _cardStockList = [
    StockCard(
      color1: AppColors.yellow1,
      color2: AppColors.yellow2,
      title: "Gold",
      subTitle: "30% return",
      image: AppAssets.imgGold,
    ),
    StockCard(
      color1: AppColors.grey3,
      color2: AppColors.grey4,
      title: "Silver",
      subTitle: "60% return",
      image: AppAssets.imgSilver,
    ),
    StockCard(
      color1: AppColors.purple1,
      color2: AppColors.purple2,
      title: "Platinum",
      subTitle: "90% return",
      image: AppAssets.imgGold,
    ),
  ];

  final List<InvestGuideCard> _investGuideCardList = [
    InvestGuideCard(
      title: "Basic type of investments",
      content:
          "This is how you set your foot for 2020 Stock market recession. What’s next...",
      image: AppAssets.imgEclipse,
    ),
    InvestGuideCard(
      title: "How much can you start wit..",
      content:
          "What do you like to see? It’s a very different market from 2018. The way...",
      image: AppAssets.imgEclipse2,
    ),
    InvestGuideCard(
      title: "How much can you start wit..",
      content:
          "What do you like to see? It’s a very different market from 2018. The way...",
      image: AppAssets.imgEclipse2,
    ),
    InvestGuideCard(
      title: "How much can you start wit..",
      content:
          "What do you like to see? It’s a very different market from 2018. The way...",
      image: AppAssets.imgEclipse2,
    ),
  ];

  void onNavigateToNotificationPage() {
    Navigator.of(context).pushNamed(Routers.notification);
  }

  List<StockCard> get cardStockList => _cardStockList;
  List<InvestGuideCard> get investGuideCardList => _investGuideCardList;
}

class StockCard {
  Color color1;
  Color color2;
  String title;
  String subTitle;
  String image;
  StockCard({
    required this.color1,
    required this.color2,
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

class InvestGuideCard {
  String title;
  String content;
  String image;
  InvestGuideCard({
    required this.title,
    required this.content,
    required this.image,
  });
}
