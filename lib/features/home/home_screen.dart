import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/styling/app_style.dart';
import 'package:meal_app/core/widgets/custom_sized_box.dart';
import 'package:meal_app/features/home/widgets/custom_floating_action_button.dart';
import 'package:meal_app/features/home/widgets/custom_grid_view_builder.dart';
import 'package:meal_app/features/home/widgets/custom_top_home_part.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTopHomePart(),
          CustomHeightSizedBox(height: 25),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w),
            child: Text('Your Food',style: AppStyle.titleStyle,),
          ),
          Expanded(child: CustomGridViewBuilder()),
          
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(),
      );
  }
}
