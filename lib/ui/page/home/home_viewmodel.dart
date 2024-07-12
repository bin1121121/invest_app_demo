// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invest_app_flutter_test/core/resource/asset_icon.dart';
import 'package:invest_app_flutter_test/core/resource/asset_img.dart';
import 'package:invest_app_flutter_test/core/resource/color_manager.dart';

import 'package:invest_app_flutter_test/helper/store/user_store.dart';

class HomeViewmodel extends ChangeNotifier {
  final List<StockCard> _cardStockList = [
    StockCard(
      color1: ColorManager.yellow1,
      color2: ColorManager.yellow2,
      title: "Gold",
      subTitle: "30% return",
      image: AssetImg.img_gold,
    ),
    StockCard(
      color1: ColorManager.grey3,
      color2: ColorManager.grey4,
      title: "Silver",
      subTitle: "60% return",
      image: AssetImg.img_silver,
    ),
    StockCard(
      color1: ColorManager.purple1,
      color2: ColorManager.purple2,
      title: "Platinum",
      subTitle: "90% return",
      image: AssetImg.img_gold,
    ),
  ];
  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetIcon.ic_home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetIcon.ic_search_outline),
      label: "Product",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetIcon.ic_transaction_outline),
      label: "Transaction",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetIcon.ic_profile_outline),
      label: "Profile",
    ),
  ];

  final List<InvestGuideCard> _investGuideCardList = [
    InvestGuideCard(
      title: "Basic type of investments",
      content:
          "This is how you set your foot for 2020 Stock market recession. What’s next...",
      image: AssetImg.img_eclipse,
    ),
    InvestGuideCard(
      title: "How much can you start wit..",
      content:
          "What do you like to see? It’s a very different market from 2018. The way...",
      image: AssetImg.img_eclipse_2,
    ),
    InvestGuideCard(
      title: "How much can you start wit..",
      content:
          "What do you like to see? It’s a very different market from 2018. The way...",
      image: AssetImg.img_eclipse_2,
    ),
    InvestGuideCard(
      title: "How much can you start wit..",
      content:
          "What do you like to see? It’s a very different market from 2018. The way...",
      image: AssetImg.img_eclipse_2,
    ),
  ];

  String? _userName = "";
  Future getUserName() async {
    UserStore _userStore = UserStore();
    _userName = _userStore.userName;
    notifyListeners();
  }

  List<BottomNavigationBarItem> get bottomNavigationBarItems =>
      _bottomNavigationBarItems;
  String? get userName => _userName;
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
