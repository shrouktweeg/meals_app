import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/core/navigation/routes_name.dart';
import 'package:meal_app/core/styling/app_color.dart';
import 'package:meal_app/core/styling/app_style.dart';
import 'package:meal_app/features/home/data/meal_item_model.dart';

import '../data/db_helper/db_helper.dart';
import 'custom_item_widget.dart';
DataBaseHelper dbHelper= DataBaseHelper.dataBaseHelper;


class CustomGridViewBuilder extends StatefulWidget {
  const CustomGridViewBuilder({super.key});

  @override
  State<CustomGridViewBuilder> createState() => _CustomGridViewBuilderState();
}

class _CustomGridViewBuilderState extends State<CustomGridViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: dbHelper.getAllMeals(), builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(color: AppColor.primaryColor,),);
      }
      if(snapshot.data!.isEmpty){
        return Center(child: Text('No Data Found',style: AppStyle.titleStyle,));
      }
     else if(snapshot.hasData){
         return GridView.builder(
             itemCount:snapshot.data!.length ,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                 crossAxisSpacing: 22.w,
                 mainAxisSpacing: 20.h,
                 childAspectRatio: 0.9
             ),
             itemBuilder:(context,index){
               MealItemModel meal=snapshot.data![index];
               return CustomItemWidget(meal:meal,onTap: (){
                 GoRouter.of(context).pushNamed(RoutesName.mealDetails,extra:meal);
               },);
             } );
       }
       else if(snapshot.hasError){
         return Center(child: Text("${snapshot.error}",));
       }
       return  Container();
    }
    );
  }
}
