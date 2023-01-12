import 'package:get/get.dart';

import 'package:restaurant_app/data/api/api_client.dart';
import 'package:restaurant_app/utilites/app_constans.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({
    required this.apiClient,
  });

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.recommededProductUrl);
  }
}
