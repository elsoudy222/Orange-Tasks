import 'package:flutter/material.dart';

import '../../constant/color_manager.dart';

class CustomRichText extends StatelessWidget {
  CustomRichText({
    super.key,
    required this.firstText,
    required this.secondText,
    this.fontSize,
    this.thirdText,
    this.customTextSpanStyle,
    this.customFirstTextStyle,
    this.customSecondTextStyle,
  });

  final String firstText;
  final String secondText;
  final double? fontSize;
  String? thirdText;
  final TextStyle? customTextSpanStyle;
  final TextStyle? customFirstTextStyle;
  final TextStyle? customSecondTextStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        // style: customTextSpanStyle ??
        //     TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700),
        children: [
          // added Spaces between every textSpan.
          TextSpan(
            text: '$firstText ',

            style: customFirstTextStyle ??
                const TextStyle(
                  color: mainColor,
                ),

          ),
          TextSpan(
            text: "$secondText",
            style: customSecondTextStyle ??
                TextStyle(
                  color: whiteColor,
                ),
          ),

          TextSpan(
            text: thirdText,
          ),

          // Try to add background color for text.
          // WidgetSpan(
          //     style: TextStyle(color: white, fontSize: 51),
          //     child: FractionallySizedBox(
          //       widthFactor: 1,
          //       heightFactor: .5,
          //       child: Container(
          //         width: double.infinity,
          //         height: double.infinity,
          //         decoration: BoxDecoration(
          //           color: orange,
          //         ),
          //         child: Text('Back!', style: TextStyle(color: white, fontSize: 51),),
          //       ),
          //     ),),
        ],
      ),
    );
  }
}
