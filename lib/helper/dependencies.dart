import 'package:get/get.dart';
import 'package:restaurant_app/controllers/cart_controller.dart';
import 'package:restaurant_app/controllers/popular_product_controller.dart';
import 'package:restaurant_app/data/api/api_client.dart';
import 'package:restaurant_app/data/repository/cart_repo.dart';
import 'package:restaurant_app/data/repository/popular_product_repo.dart';
import 'package:restaurant_app/utilites/app_constans.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
