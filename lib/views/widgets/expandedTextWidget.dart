import 'package:flutter/material.dart';
import 'package:restaurant_app/utilites/colors.dart';
import 'package:restaurant_app/utilites/dimensions.dart';
import 'package:restaurant_app/views/widgets/small_text_widget.dart';

class ExpandedTextWidget extends StatefulWidget {
  final String text;

  const ExpandedTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandedTextWidget> createState() => _ExpandedTextWidgetState();
}

class _ExpandedTextWidgetState extends State<ExpandedTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 2.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallTextWidget(
              text: firstHalf,
              size: Dimensions.font15,
              color: AppColors.paraColor,
              height: 1.8,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallTextWidget(
                  text: hiddenText ? ('$firstHalf...') : firstHalf + secondHalf,
                  maxLines: hiddenText
                      ? firstHalf.length
                      : (firstHalf.length + secondHalf.length),
                  height: 1.8,
                  size: Dimensions.font15,
                  color: AppColors.paraColor,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: hiddenText
                        ? Row(children: [
                            SmallTextWidget(
                              text: 'Show more',
                              color: AppColors.mainColor,
                              size: Dimensions.font15,
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.mainColor,
                            )
                          ])
                        : Row(children: [
                            SmallTextWidget(
                              text: 'Show less',
                              color: AppColors.mainColor,
                              size: Dimensions.font15,
                            ),
                            const Icon(
                              Icons.arrow_drop_up,
                              color: AppColors.mainColor,
                            )
                          ]))
              ],
            ),
    );
  }
}
