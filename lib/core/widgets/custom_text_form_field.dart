


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/styling/app_style.dart';

import '../styling/app_color.dart';

class CustomTextFormField extends StatelessWidget {
 final TextEditingController? textEditingController;
 final String? hintText;
 final double? borderRadius;
 final void Function()? onPressed;
 final int?maxLines;
final  TextInputType? keyboardType;
 final String? Function(String?)? validator;
  const CustomTextFormField({super.key, this.textEditingController, this.hintText, this.borderRadius, this.onPressed, this.validator, this.keyboardType, this.maxLines,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines??1,
      cursorColor: AppColor.primaryColor,
      keyboardType:keyboardType??TextInputType.text ,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller:textEditingController,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsGeometry.only(top:17.r,left: 18.r),
        filled: true,
        fillColor: AppColor.whiteColor,
        hint: Text(hintText??'',style: AppStyle.hintStyle,),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8.r),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius??5.r),
      borderSide: BorderSide(color: AppColor.primaryColor),
    ),
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??5.r),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??5.r),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),) );
  }
}
