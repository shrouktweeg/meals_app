import 'dart:developer';

import 'package:meal_app/core/networking/api_end_point.dart';
import 'package:meal_app/core/networking/dio_helper.dart';
import 'package:meal_app/features/home/models/meal_model.dart';

class HomeApiService {
  getMeals({required String firstChar})async{
    try{
      final response=await DioHelper.getRequest(endPoint: ApiEndPoint.mealsEndPoint, query: {
        "f":firstChar,
      });
      if(response.statusCode==200){
        MealResponse mealItemResponse=MealResponse.fromJson(response.data);
        log(mealItemResponse.toString());
        return mealItemResponse;
      }
    }catch(e){
      log(e.toString());
      return Future.error(e.toString());
    }
  }



}