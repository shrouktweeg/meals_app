import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../styling/app_color.dart';

class CustomIconBack extends StatelessWidget {
  const CustomIconBack({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pop();
      },

      child: Padding(
        padding:  EdgeInsets.only(left: 8.w),
        child: Container(
          alignment: Alignment.center,
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              width: 2,
                color: Color(0xffEDEDED)
            ),
          ),
          child: Center(child: Icon(Icons.arrow_back,size: 20.sp,color: AppColor.lightBlackColor,)),


        ),
      ),
    );
  }
}
