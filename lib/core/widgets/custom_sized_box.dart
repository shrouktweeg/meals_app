import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeightSizedBox extends StatelessWidget {
 final double height;
  const CustomHeightSizedBox({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height.h,
    );
  }
}
class CustomWidthSizedBox extends StatelessWidget {
  final double width;
  const CustomWidthSizedBox({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width.w,
    );
  }
}