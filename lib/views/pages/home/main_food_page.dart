import 'package:flutter/material.dart';
import 'package:restaurant_app/utilites/colors.dart';
import 'package:restaurant_app/utilites/dimensions.dart';
import 'package:restaurant_app/views/pages/home/food_page_body.dart';
import 'package:restaurant_app/views/widgets/big_text_widget.dart';
import 'package:restaurant_app/views/widgets/small_text_widget.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(
                top: Dimensions.height30,
              ),
              padding: EdgeInsets.all(Dimensions.height20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BigTextWidget(
                        text: 'Egypt',
                        color: AppColors.mainColor,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SmallTextWidget(
                            text: 'Damnhour',
                            color: Colors.black45,
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: Dimensions.icon16,
                          )
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius15,
                        ),
                        color: AppColors.mainColor,
                      ),
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.icon24,
                      ),
                    ),
                  )
                ],
              )),
          const Expanded(child: SingleChildScrollView(child: FoodPageBody())),
        ],
      ),
    );
  }
}
