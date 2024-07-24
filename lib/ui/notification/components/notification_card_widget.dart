import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:invest_app_flutter_test/ui/utils/date_format.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

class NotificationCardWidget extends StatelessWidget {
  final String _thumbnail;
  final String _description;
  final DateTime _createdAt;
  final Function _onDelete;
  NotificationCardWidget({
    super.key,
    required String thumbnail,
    required String description,
    required DateTime createdAt,
    Function? onDelete,
  })  : _thumbnail = thumbnail,
        _description = description,
        _createdAt = createdAt,
        _onDelete = onDelete ?? (() {});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (context) => _onDelete(),
            backgroundColor: AppColors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 70.w,
                width: 70.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                    image: AssetImage(
                      _thumbnail,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        dateFormatted(_createdAt),
                        style: customContentTextStyle(
                            color: AppColors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: 60.w,
                        left: 10.w,
                      ),
                      child: Text(
                        _description,
                        style: customContentTextStyle(
                          color: AppColors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.w),
          const Divider(
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
