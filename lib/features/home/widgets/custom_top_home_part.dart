import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/assets_string.dart';
import '../../../core/styling/app_color.dart';
import '../../../core/styling/app_style.dart';

class CustomTopHomePart extends StatelessWidget {
  const CustomTopHomePart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(ImagesString.titleBG,width: double.infinity,height: 270.h,fit: BoxFit.cover,),
        Positioned(
          bottom: 18.h,
          left: 25.w,
          child: Container(
            padding: EdgeInsets.all(12.sp),
            width: 220.w,
            height: 186.h,
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(48.r),
            ),
            child: Text('Welcome Add A New Recipe.',
              textAlign: TextAlign.left,
              style: AppStyle.onBoardingTitleStyle,
            ),
          ),
        )
      ],
    );
  }
}
