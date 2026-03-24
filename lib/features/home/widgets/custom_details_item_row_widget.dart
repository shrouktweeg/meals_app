import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/widgets/custom_sized_box.dart';

import '../../../core/styling/app_color.dart';
import '../../../core/styling/app_style.dart';

class CustomDetailsItemRowWidget extends StatelessWidget {
  final IconData? icon;
  final String data;
  const CustomDetailsItemRowWidget({super.key, this.icon, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: AppColor.primaryColor),
        CustomWidthSizedBox(width: 4),
        Text(data, style: AppStyle.ratingStyle),
      ],
    );
  }
}
