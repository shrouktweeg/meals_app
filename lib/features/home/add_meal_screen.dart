import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/core/navigation/routes_name.dart';
import 'package:meal_app/core/styling/app_color.dart';
import 'package:meal_app/core/styling/app_style.dart';
import 'package:meal_app/core/widgets/custom_button.dart';
import 'package:meal_app/core/widgets/custom_icon_back.dart';
import 'package:meal_app/core/widgets/custom_sized_box.dart';
import 'package:meal_app/features/home/data/db_helper/db_helper.dart';
import 'package:meal_app/features/home/data/meal_item_model.dart';

import '../../core/widgets/custom_text_form_field.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  DataBaseHelper dataBaseHelper=DataBaseHelper.dataBaseHelper;
  final GlobalKey<FormState> formKey =GlobalKey();
  late TextEditingController mealNameController;
  late TextEditingController imageUrlController;
  late TextEditingController rateController;
  late TextEditingController timeController;
  late TextEditingController descriptionController;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    mealNameController = TextEditingController();
    imageUrlController = TextEditingController();
    descriptionController = TextEditingController();
    rateController = TextEditingController();
    timeController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    mealNameController.dispose();
    imageUrlController.dispose();
    descriptionController.dispose();
    rateController.dispose();
    timeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: Text('Add Meal',style: AppStyle.titleStyle,),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: CustomIconBack(),
      ),
      body: Form(
        key: formKey,
        child: isLoading?Center(
          child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ),
        ):SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Text("Meal Name", style: AppStyle.subTitleStyle),
               const  CustomHeightSizedBox(height: 8),
                CustomTextFormField(keyboardType: TextInputType.text,textEditingController: mealNameController,hintText: 'Meal Name',validator: (val){
                  if(val==null ||val.trim().isEmpty){
                    return "Enter Meal Name";
                  }
                  else if (val.length<3){
                    return 'Enter valid Meal Name';
                  }
                  return null;
                },),
                const CustomHeightSizedBox(height:16),
                Text("Image URl", style: AppStyle.subTitleStyle),
                const  CustomHeightSizedBox(height: 8),
                 CustomTextFormField(maxLines:3,keyboardType: TextInputType.text,textEditingController: imageUrlController,hintText: 'Image URL',validator: (val){
                  if(val==null ||val.trim().isEmpty){
                    return "Enter Image Url";
                  }
                  else if (val.length<3){
                    return 'Enter valid Image Url';
                  }
                  return null;
                },),
                const CustomHeightSizedBox(height:16),
                Text("Meal Rate", style: AppStyle.subTitleStyle),
                const  CustomHeightSizedBox(height: 8),
                CustomTextFormField(keyboardType: TextInputType.number,textEditingController: rateController,hintText: 'rate',validator: (val){
                  if(val==null ||val.trim().isEmpty){
                    return "Enter meal rate";
                  }
                  return null;
                },),
                const CustomHeightSizedBox(height:16),
                Text("Meal Time", style: AppStyle.subTitleStyle),
                const  CustomHeightSizedBox(height: 8),
                CustomTextFormField(keyboardType: TextInputType.number,textEditingController: timeController,hintText: 'Meal Time',validator: (val){
                  if(val==null ||val.trim().isEmpty){
                    return "Enter Meal Time";
                  }
                  return null;
                },),
                const CustomHeightSizedBox(height:16),
                Text("Meal description", style: AppStyle.subTitleStyle),
                const  CustomHeightSizedBox(height: 8),
                CustomTextFormField(maxLines: 3,keyboardType: TextInputType.text,textEditingController: descriptionController,hintText: 'Meal description',validator: (val){
                  if(val==null ||val.trim().isEmpty){
                    return "Enter Meal description";
                  }
                  else if (val.length<3){
                    return 'Enter valid Meal description';
                  }
                  return null;
                },),
                CustomHeightSizedBox(height: 70),
                CustomButton(width: 327.w,height: 52.h,backgroundColor: AppColor.primaryColor,title: 'Add Meal',borderRadius: 100,onPressed: () {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    MealItemModel meal = MealItemModel(
                        imageUrl: imageUrlController.text,
                        mealName: mealNameController.text,
                        description: descriptionController.text,
                        rate: double.parse(rateController.text),
                        duration: timeController.text);
                    dataBaseHelper.insertMeal(meal).then(
                            (val) {
                          GoRouter.of(context)
                              .pushReplacementNamed(RoutesName.home);
                        });
                  }
                })
                 ] )
                  )
                  )
                  )
                  );
                }}
