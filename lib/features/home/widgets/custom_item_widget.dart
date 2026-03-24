import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/styling/app_color.dart';
import 'package:meal_app/core/styling/app_style.dart';
import 'package:meal_app/core/widgets/custom_sized_box.dart';
import 'package:meal_app/features/home/data/meal_item_model.dart';

import 'custom_details_item_row_widget.dart';

class CustomItemWidget extends StatelessWidget {
  final void Function()? onTap;
  final MealItemModel meal;
  const CustomItemWidget({super.key, this.onTap, required this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColor.whiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CachedNetworkImage(
               imageUrl: meal.imageUrl,
               width: 137.w,
               height: 106.h,
               fit: BoxFit.cover,
               errorWidget: (context , url,error)=>Icon(Icons.error,color: Colors.red,),
             ),
              CustomHeightSizedBox(height: 8),
              SizedBox(
                width: 137.w,
                child: Text(
                  meal.mealName,
                  maxLines: 1,
                  style: AppStyle.ratingStyle.copyWith(fontSize: 16.sp),
                ),
              ),
              CustomHeightSizedBox(height: 6),
              Row(
                children: [
                  CustomDetailsItemRowWidget(icon: Icons.star, data: meal.rate.toString()),
                  Spacer(),
                  CustomDetailsItemRowWidget(
                    icon: Icons.access_time_filled,
                    data: meal.duration,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

