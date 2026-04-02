import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/networking/dio_helper.dart';
import 'package:meal_app/features/home/data/db_helper/db_helper.dart';
import 'package:meal_app/features/home/data/meal_item_model.dart';
import 'package:meal_app/features/on_boarding/services/on_boarding_services.dart';

import 'core/navigation/on_generator.dart';
import 'core/styling/theme_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initDio();
  DataBaseHelper dbHelper= DataBaseHelper.dataBaseHelper;
  dbHelper.insertMeal(MealItemModel(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOX2YyS0W1LnrD5eyd-7Q9kvO1JGvE80AXXA&s',
      mealName: 'MSG Smash Burgers',
      description: 'Buttery melted onions seal the deal on these burgers.',
      rate: 4.5, duration: '25-30'));
  dbHelper.insertMeal(MealItemModel(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfnm2bLiasFYx2iVqm1iKS3uOcyxRFJJvGJg&s',
      mealName: 'French Fries',
      description: 'These fries are golden and crispy on the outside, and soft on the inside.',
      rate: 4, duration: '15-20'));
      dbHelper.insertMeal(MealItemModel(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPK5vHLFn3BZiM3eQuMf33INLYluE3JqJO-A&s',
      mealName: 'Indian Fried Chicken',
      description: 'Buttery melted onions seal the deal on these burgers.',
      rate: 5, duration: '45-60'));
      print(dbHelper.getAllMeals().toString());
  await OnBoardingServices.initializeSharedPreferencesInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp.router(
          routerConfig: OnGenerator.routes,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
        );
      },
    );

  }
}

