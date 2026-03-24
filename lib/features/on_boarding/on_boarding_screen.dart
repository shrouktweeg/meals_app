import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/core/navigation/routes_name.dart';
import 'package:meal_app/core/styling/app_color.dart';
import 'package:meal_app/core/styling/app_style.dart';
import 'package:meal_app/core/widgets/custom_sized_box.dart';
import 'package:meal_app/features/on_boarding/services/on_boarding_services.dart';

import '../../core/constants/assets_string.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}


class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_){
      bool isFirstTime=OnBoardingServices.isFirstTime();
      OnBoardingServices.setIsFirstTime();
       if(isFirstTime==false){
         context.pushReplacementNamed(RoutesName.home);
       }
    });
    super.initState();
  }
  List<String> titles = [
    'Save Your Meals Ingredient',
    'Use Our App The Best Choice',
    ' Our App Your Ultimate Choice',
  ];
  List<String> descriptions = [
    'Add Your Meals and its Ingredients and we will save it for you',
    'the best choice for your kitchen do not hesitate',
    'All the best restaurants and their top menus are ready for you',
  ];
  double currentIndexPage = 0;
  CarouselSliderController carouselController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagesString.backgroundAsset),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 32.w,
            right: 32.w,
            bottom: 40.h,
            child: Container(
              padding: EdgeInsets.only(top:32.sp,left: 32.sp,right: 32.sp),
              width: 311.w,
              height: 400.h,
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 250.h,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndexPage = index.toDouble();
                        });
                      },
                    ),
                    items: List.generate(titles.length, (index) {
                      return Builder(
                        builder: (context) {
                          return SizedBox(
                            width: 240.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  titles[index],
                                  style: AppStyle.onBoardingTitleStyle,
                                  textAlign: TextAlign.center,
                                ),
                                CustomHeightSizedBox(height: 16),
                                Text(
                                  descriptions[index],
                                  style: AppStyle.subTitleStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  DotsIndicator(
                    position: currentIndexPage,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      color: Color(0xffC2C2C2),
                      activeColor: Colors.white,
                      size: Size(24.w, 6.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.sp),
                      ),
                      activeSize: Size(24.w, 6.h),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.sp),
                      ),
                    ),
                    onTap: (index) {
                      setState(() {
                        carouselController.animateToPage(index);
                        currentIndexPage = index.toDouble();
                      });
                    },
                  ),
                  CustomHeightSizedBox(height: 20),
              currentIndexPage<2? Row(
                    children: [
                      TextButton(onPressed: (){}, child: Text('Skip',style: AppStyle.textButtonStyle,)),
                      Spacer(),
                      TextButton(onPressed: (){
                        setState(() {
                          if(currentIndexPage<2){
                            currentIndexPage++;
                            carouselController.animateToPage(currentIndexPage.toInt());
                          }
                        });
                      }, child: Text('Next',style: AppStyle.textButtonStyle,)),
                    ],
                  ):InkWell(
                onTap: (){
                  context.pushReplacementNamed(RoutesName.home);

                },
                    child: Container(
                                    width: 62.w,
                                    height: 62.h,
                                    decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle,),
                                    child: Center(child: Icon(Icons.arrow_forward,size: 24.sp,color: AppColor.primaryColor,)),
                                  ),
                  ),
                  CustomHeightSizedBox(height: 16)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
