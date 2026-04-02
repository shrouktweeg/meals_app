import 'dart:developer';

import 'package:meal_app/core/networking/api_end_point.dart';
import 'package:meal_app/core/networking/dio_helper.dart';
import 'package:meal_app/features/home/models/meal_model.dart';

class MealDetailsApi {
  getMealDetailsApi({required String id})async{
    try{
      final response=await DioHelper.getRequest(endPoint: ApiEndPoint.mealDetailsEndPoint, query: {
        "i":id,
      });
      var data = response.data['meals'];
      if(response.statusCode==200){
        Meal meal=Meal.fromJson(data[0]);
        log(meal.toString());
        return meal;
      }
    }catch(e){
      log(e.toString());
      return Future.error(e.toString());
    }
  }



}