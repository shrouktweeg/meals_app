import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/styling/app_color.dart';
import 'package:meal_app/core/styling/app_style.dart';
import 'package:meal_app/core/widgets/custom_icon_back.dart';
import 'package:meal_app/core/widgets/custom_sized_box.dart';
import 'package:meal_app/features/home/data/meal_item_model.dart';
import 'package:meal_app/features/home/models/meal_model.dart';
import 'package:meal_app/features/meal_details_screen/meal_details_api_service/meal_details_api.dart';

import '../home/widgets/custom_details_item_row_widget.dart';

class MealDetailsScreen extends StatelessWidget {
  //final MealItemModel meal;
  final String id;
  const MealDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.sp),
          child: FutureBuilder(future: MealDetailsApi().getMealDetailsApi(id: id), builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
              );
            }
            else if(snapshot.hasData){
              Meal meal=snapshot.data as Meal;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: CachedNetworkImage(
                              imageUrl: meal.strMealThumb??"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGz7NzvCE7BT0kOl5nn-pTTFJvazObnKS6mQ&s",
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(top: 12.h, left: 12.w, child: CustomIconBack()),
                        ],
                      ),
                      CustomHeightSizedBox(height: 16),
                      Text(
                        meal.strMeal??"",
                        style: AppStyle.titleStyle.copyWith(fontSize: 24.sp),
                      ),
                      CustomHeightSizedBox(height: 21),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor.withOpacity(0.4),
                        ),
                        child: Row(
                          children: [
                            CustomDetailsItemRowWidget(
                              icon: Icons.access_time_filled,
                              data: "2025-11-22",
                            ),
                            Spacer(),
                            CustomDetailsItemRowWidget(
                              icon: Icons.star,
                              data: "4.5",
                            ),
                          ],
                        ),
                      ),
                      CustomHeightSizedBox(height: 27),
                      Divider(color: Color(0xffEDEDED), thickness: 2),
                      CustomHeightSizedBox(height: 24),
                      Text('Description', style: AppStyle.titleStyle),
                      Text(meal.strInstructions??"", style: AppStyle.hintStyle),
                    ],
                  ),
                );
            }
            else if(snapshot.hasError){
              return Center(child: Text("${snapshot.error}",));
            }
            return Container();
          }),
        ),
      ),
    );
  }
}

/*
SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: CachedNetworkImage(
                        imageUrl: meal.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(top: 12.h, left: 12.w, child: CustomIconBack()),
                  ],
                ),
                CustomHeightSizedBox(height: 16),
                Text(
                  meal.mealName,
                  style: AppStyle.titleStyle.copyWith(fontSize: 24.sp),
                ),
                CustomHeightSizedBox(height: 21),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.4),
                  ),
                  child: Row(
                    children: [
                      CustomDetailsItemRowWidget(
                        icon: Icons.access_time_filled,
                        data: meal.duration,
                      ),
                      Spacer(),
                      CustomDetailsItemRowWidget(
                        icon: Icons.star,
                        data: meal.rate.toString(),
                      ),
                    ],
                  ),
                ),
                CustomHeightSizedBox(height: 27),
                Divider(color: Color(0xffEDEDED), thickness: 2),
                CustomHeightSizedBox(height: 24),
                Text('Description', style: AppStyle.titleStyle),
                Text(meal.description, style: AppStyle.hintStyle),
              ],
            ),
          ),
        ),
      ),
    )
 */