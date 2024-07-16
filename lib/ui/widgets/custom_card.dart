// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String tile;
  final String content;
  final String imgUrl;
  CustomCard({
    Key? key,
    required this.color1,
    required this.color2,
    required this.tile,
    required this.content,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134.w,
      height: 170.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Stack(
        children: [
          Image.asset(
            imgUrl,
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tile,
                  style: customContentTextStyle(
                    color: AppColors.white,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 2.w),
                Text(
                  content,
                  style: customContentTextStyle(
                    color: AppColors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
