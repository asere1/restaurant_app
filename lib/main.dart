import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controllers/popular_product_controller.dart';
import 'package:restaurant_app/views/pages/food/popular_food_details.dart';
import 'package:restaurant_app/views/pages/food/recommeded_food_detail.dart';
import 'package:restaurant_app/views/pages/home/food_page_body.dart';
import 'package:restaurant_app/views/pages/home/main_food_page.dart';
import 'package:restaurant_app/views/pages/splash/splash_page.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'routes/routs.dart';
import 'utilites/app_constans.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      // home: SplashScreen(),
      initialRoute: Routs.getSplashPage(),
      getPages: Routs.routs,
    );
  }
}
