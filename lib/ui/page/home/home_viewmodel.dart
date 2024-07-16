import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:provider/provider.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class HomeViewmodel extends BaseViewModel {
  late final AppShared _appShared;
  final List<StockCard> _cardStockList = [
    StockCard(
      color1: AppColors.yellow1,
      color2: AppColors.yellow2,
      title: "Gold",
      subTitle: "30% return",
      image: AppAssets.img_gold,
    ),
    StockCard(
      color1: AppColors.grey3,
      color2: AppColors.grey4,
      title: "Silver",
      subTitle: "60% return",
      image: AppAssets.img_silver,
    ),
    StockCard(
      color1: AppColors.purple1,
      color2: AppColors.purple2,
      title: "Platinum",
      subTitle: "90% return",
      image: AppAssets.img_gold,
    ),
  ];

  final List<InvestGuideCard> _investGuideCardList = [
    InvestGuideCard(
      title: "Basic type of investments",
      content:
          "This is how you set your foot for 2020 Stock market recession. What’s next...",
      image: AppAssets.img_eclipse,
    ),
    InvestGuideCard(
      title: "How much can you start wit..",
      content:
          "What do you like to see? It’s a very different market from 2018. The way...",
      image: AppAssets.img_eclipse_2,
    ),
    InvestGuideCard(
      title: "How much can you start wit..",
      content:
          "What do you like to see? It’s a very different market from 2018. The way...",
      image: AppAssets.img_eclipse_2,
    ),
    InvestGuideCard(
      title: "How much can you start wit..",
      content:
          "What do you like to see? It’s a very different market from 2018. The way...",
      image: AppAssets.img_eclipse_2,
    ),
  ];
  late Stream<String?> _userNameStream;

  void onInit() {
    _appShared = Provider.of<AppShared>(context, listen: false);
    _userNameStream = _appShared.rxSharedPreferences
        .getStringStream(STORAGE_USER_NAME)
        .asBroadcastStream();
  }

  List<StockCard> get cardStockList => _cardStockList;
  List<InvestGuideCard> get investGuideCardList => _investGuideCardList;
  Stream<String?> get userNameStream => _userNameStream;

  // void onLogout() {
  //   // _appShared.remove(STORAGE_USER_NAME);
  //   Navigator.of(context).pushReplacementNamed(RouteName.signUpPage);
  // }
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
