
import 'package:go_router/go_router.dart';
import 'package:meal_app/core/navigation/routes_name.dart';
import 'package:meal_app/features/home/add_meal_screen.dart';
import 'package:meal_app/features/home/data/meal_item_model.dart';
import 'package:meal_app/features/home/home_screen.dart';
import 'package:meal_app/features/home/models/meal_model.dart';
import 'package:meal_app/features/meal_details_screen/meal_details_screen.dart';

import '../../features/on_boarding/on_boarding_screen.dart';

class OnGenerator{
  static final GoRouter routes=GoRouter(
    initialLocation:RoutesName.initial,
    routes: [
      GoRoute(path: RoutesName.initial,name:RoutesName.initial,builder: (context,state)=>OnBoardingScreen()),
      GoRoute(path: RoutesName.onBoarding,name: RoutesName.onBoarding,builder: (context,state)=>OnBoardingScreen()),
      GoRoute(path:RoutesName.home,name: RoutesName.home,builder: (context,state)=>HomeScreen()),
      GoRoute(path: RoutesName.addMeal,name: RoutesName.addMeal,builder: (context,state)=>AddMealScreen()),
      GoRoute(path: RoutesName.mealDetails,name: RoutesName.mealDetails,builder: (context,state){
//MealItemModel meal=state.extra as MealItemModel;
     // Meal meal=state.extra as Meal;
        String id=state.extra as String;
 return MealDetailsScreen(id: id);
  }

          ),
    ]
  );
}