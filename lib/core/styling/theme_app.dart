import 'package:flutter/material.dart';
import 'package:meal_app/core/styling/app_fonts.dart';

import 'app_color.dart';
import 'app_style.dart';

class AppTheme{
  static ThemeData lightTheme=ThemeData(
      fontFamily: AppFonts.inter,
      scaffoldBackgroundColor: AppColor.whiteColor,
      primaryColor: AppColor.primaryColor,
      textTheme: TextTheme(
        titleLarge: AppStyle.titleStyle,
        titleMedium: AppStyle.subTitleStyle,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColor.primaryColor,
        disabledColor:AppColor.greyColor,
      )
  );
}