import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controllers/popular_product_controller.dart';
import 'package:restaurant_app/controllers/recommended_product_controller.dart';
import 'package:restaurant_app/utilites/app_constans.dart';

import 'package:restaurant_app/utilites/colors.dart';
import 'package:restaurant_app/utilites/dimensions.dart';
import 'package:restaurant_app/views/widgets/app_icon.dart';
import 'package:restaurant_app/views/widgets/big_text_widget.dart';
import 'package:restaurant_app/views/widgets/expandedTextWidget.dart';

import '../../../controllers/cart_controller.dart';
import '../../../routes/routs.dart';
import '../cart/cart_page.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final String page;
  final int pageId;
  const RecommendedFoodDetail({
    Key? key,
    required this.pageId,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    ScrollController controller = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(controller: controller, slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
                onTap: () {
                  if (page == 'cartPage') {
                    Get.toNamed(Routs.getCartPage());
                  } else {
                    Get.toNamed(Routs.getInitial());
                  }
                },
                child: const AppIcon(icon: Icons.clear)),
            GetBuilder<PopularProductController>(builder: (controller) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  InkWell(
                      onTap: () {
                        Get.toNamed(Routs.getCartPage());
                      },
                      child: const AppIcon(icon: Icons.shopping_cart_outlined)),
                  Get.find<PopularProductController>().totalItems >= 1
                      ? Positioned(
                          right: 0,
                          top: 0,
                          child: AppIcon(
                            icon: Icons.circle,
                            size: Dimensions.font20,
                            iconColor: Colors.transparent,
                            backgroundColor: AppColors.mainColor,
                          ),
                        )
                      : Container(),
                  Row(
                    children: [
                      BigTextWidget(
                          text: Get.find<PopularProductController>()
                              .totalItems
                              .toString(),
                          size: Dimensions.font15,
                          color: Colors.white),
                      SizedBox(
                        width: Dimensions.font15 / 2.7,
                      ),
                    ],
                  )
                ],
              );
            })
          ]),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20))),
              child: Center(
                  child: BigTextWidget(
                text: product.name!,
                size: Dimensions.font26,
              )),
            ),
          ),
          pinned: true,
          backgroundColor: AppColors.yellowColor,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              AppConstants.baseUrl + AppConstants.uploadUrl + product.img!,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpandedTextWidget(text: product.description!),
              ),
            ],
          ),
        )
      ]),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20 * 2.5,
                  vertical: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                      iconSize: Dimensions.icon24,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      icon: Icons.remove,
                    ),
                  ),
                  BigTextWidget(
                    text:
                        '\$ ${product.price!}' ' x' "${controller.inCartItems}",
                    color: Colors.black,
                    size: Dimensions.font26,
                  ),
                  InkWell(
                    onTap: () {
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                      iconSize: Dimensions.icon24,
                      icon: Icons.add,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.all(
                Dimensions.width20,
              ),
              decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height10 * 1.4,
                      bottom: Dimensions.height10 * 1.4,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white),
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                      child: BigTextWidget(
                        text: '\$ ${product.price!} | Add to cart',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
