import 'package:get/get.dart';

import 'package:restaurant_app/data/api/api_client.dart';
import 'package:restaurant_app/utilites/app_constans.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({
    required this.apiClient,
  });

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.popularProductUrl);
  }
}
