import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppStyle{
  static TextStyle onBoardingTitleStyle=GoogleFonts.inter(
          fontSize: 32.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.whiteColor,
  );  static TextStyle hintStyle=GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: AppColor.greyColor
  );
  static TextStyle subTitleStyle=GoogleFonts.inter(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.whiteColor,
  ); static TextStyle textButtonStyle=GoogleFonts.inter(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.whiteColor,
  );static TextStyle titleStyle=GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.lightBlackColor,
  );static TextStyle ratingStyle=GoogleFonts.inter(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.lightBlackColor,
  );
}