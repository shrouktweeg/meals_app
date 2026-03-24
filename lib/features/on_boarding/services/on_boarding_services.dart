import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingServices{
 static late SharedPreferences sharedPreferences;
 static Future initializeSharedPreferencesInstance()async{
   sharedPreferences=await SharedPreferences.getInstance();
 }
 static bool isFirstTime(){
  bool isFirstTime=sharedPreferences.getBool('isFirstTime')??true;
  return isFirstTime;
 }
 static  setIsFirstTime(){
  sharedPreferences.setBool('isFirstTime',false);
 }

}