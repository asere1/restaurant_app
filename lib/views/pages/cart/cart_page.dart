import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controllers/cart_controller.dart';
import 'package:restaurant_app/controllers/popular_product_controller.dart';
import 'package:restaurant_app/controllers/recommended_product_controller.dart';
import 'package:restaurant_app/models/cart_model.dart';
import 'package:restaurant_app/utilites/app_constans.dart';
import 'package:restaurant_app/utilites/colors.dart';
import 'package:restaurant_app/utilites/dimensions.dart';
import 'package:restaurant_app/views/pages/home/main_food_page.dart';
import 'package:restaurant_app/views/widgets/app_icon.dart';
import 'package:restaurant_app/views/widgets/big_text_widget.dart';
import 'package:restaurant_app/views/widgets/small_text_widget.dart';

import '../../../routes/routs.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back,
                  iconSize: Dimensions.icon24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
                SizedBox(
                  width: Dimensions.width30 * 9,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routs.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconSize: Dimensions.icon24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconSize: Dimensions.icon24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
              ],
            )),
        Positioned(
          right: Dimensions.width20,
          left: Dimensions.width20,
          top: Dimensions.height20 * 6,
          bottom: 0,
          child: Container(
            margin: EdgeInsets.only(top: Dimensions.height15),
            // color: Colors.red,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GetBuilder<CartController>(builder: (cartController) {
                List<CartModel> cartList = cartController.getItems;
                return ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (_, index) {
                      return Container(
                        height: 100,
                        width: double.maxFinite,
                        // color: Colors.blue,
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                var popularIndex =
                                    Get.find<PopularProductController>()
                                        .popularProductList
                                        .indexOf(
                                          cartList[index].product!,
                                        );
                                if (popularIndex >= 0) {
                                  Get.toNamed(Routs.getPopularFood(
                                      popularIndex, 'cartPage'));
                                } else {
                                  var recommendedIndex =
                                      Get.find<RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(
                                            cartList[index].product!,
                                          );
                                  Get.toNamed(Routs.getRecommendedFood(
                                      recommendedIndex, 'cartPage'));
                                }
                              },
                              child: Container(
                                height: Dimensions.height20 * 9,
                                width: Dimensions.width20 * 10.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius20,
                                  ),
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      AppConstants.baseUrl +
                                          AppConstants.uploadUrl +
                                          cartController.getItems[index].img!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: Dimensions.height20 * 9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigTextWidget(
                                      text:
                                          cartController.getItems[index].name!,
                                      color: Colors.black87,
                                    ),
                                    const SmallTextWidget(text: 'Spicy'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigTextWidget(
                                          text:
                                              '\$ ${cartController.getItems[index].price}',
                                          color: Colors.redAccent,
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(
                                                top: Dimensions.height20,
                                                bottom: Dimensions.height20,
                                                left: Dimensions.width20,
                                                right: Dimensions.width20),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                color: Colors.white),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    cartController.addItem(
                                                      cartList[index].product!,
                                                      -1,
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                    size: Dimensions.icon24,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width10 / 2,
                                                ),
                                                BigTextWidget(
                                                  text: cartList[index]
                                                      .quantity
                                                      .toString(),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width10 / 2,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    cartController.addItem(
                                                      cartList[index].product!,
                                                      1,
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                    size: Dimensions.icon24,
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }),
            ),
          ),
        ),
      ]),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (CartController) {
        return Container(
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
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Dimensions.width10 * 2,
                      ),
                      BigTextWidget(text: '\$ ${CartController.totalAmount}'),
                      SizedBox(
                        width: Dimensions.width10 * 2,
                      ),
                    ],
                  )),
              InkWell(
                // onTap: () {
                //   popularProduct.addItem(product);
                // },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: BigTextWidget(
                    text: ' Check out',
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
