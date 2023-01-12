import 'package:get/get.dart';
import 'package:restaurant_app/views/pages/cart/cart_page.dart';
import 'package:restaurant_app/views/pages/food/popular_food_details.dart';
import 'package:restaurant_app/views/pages/food/recommeded_food_detail.dart';
import 'package:restaurant_app/views/pages/home/main_food_page.dart';
import 'package:restaurant_app/views/pages/splash/splash_page.dart';

import '../views/pages/home/home_page.dart';

class Routs {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';
  static const String splashPage = '/splash-page';

  static String getInitial() => "$initial";
  static String getPopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";
  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";
  static String getCartPage() => "$cartPage";
  static String getSplashPage() => "$splashPage";

  static List<GetPage> routs = [
    GetPage(name: initial, page: (() => const HomePage())),
    GetPage(name: splashPage, page: (() => const SplashScreen())),
    GetPage(
      name: popularFood,
      page: (() {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetails(pageId: int.parse(pageId!), page: page!);
      }),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: (() {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];

        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
          page: page!,
        );
      }),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: (() => const CartPage()),
      transition: Transition.fadeIn,
    ),
  ];
}
