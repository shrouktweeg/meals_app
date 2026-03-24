import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/core/navigation/routes_name.dart';
import 'package:meal_app/core/styling/app_color.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.whiteColor,
      elevation: 0,
      shape: CircleBorder(side: BorderSide(color: AppColor.primaryColor)),
      onPressed: (){
        GoRouter.of(context).pushNamed(RoutesName.addMeal);
      },child: Center(child: Icon(Icons.add,size: 20.sp,color: AppColor.primaryColor,weight: 20.w,)),);
  }
}
