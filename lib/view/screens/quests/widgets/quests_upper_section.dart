import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

import '../../../components/core/custom_text.dart';
import '../../../constant/assets.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/fonts.dart';

class QuestsUpperSection extends StatelessWidget {
  const QuestsUpperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 180,
          width: 180,
          child: LiquidCircularProgressIndicator(
            value: 0.50,
            // Defaults to 0.5.
            borderColor: textColorFormField.withOpacity(.4),
            borderWidth: 4,
            valueColor: const AlwaysStoppedAnimation(mainColor),
            // Defaults to the current Theme's accentColor.
            backgroundColor: Colors.transparent,
            // Defaults to the current Theme's backgroundColor.
            center: CustomText(
              text: '50',
              color: whiteColor,
              fontSize: textFont42,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Padding(
            padding: const EdgeInsets.only(right: 0, top: 10),
            child: SvgPicture.asset(reflection),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 15,
          child: SvgPicture.asset(reflection2),
        ),
        Positioned(
          top: 26,
          left: 35,
          child: SvgPicture.asset(reflection3),
        ),
        Positioned(
          top: 60,
          left: 25,
          child: SvgPicture.asset(reflection4),
        ),
      ],
    );
  }
}
