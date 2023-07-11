import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:my_odc_tasks/view/constant/data.dart';

import '../../../components/core/custom_text.dart';
import '../../../constant/assets.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/fonts.dart';


class AttendanceLowerSection extends StatelessWidget {
  const AttendanceLowerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, questsScreen);
      },
      child: Card(

        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  SizedBox(
                    height: 90,
                    width: 90,
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
                        fontSize: textFont24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 2, top: 5),
                    child: SvgPicture.asset(reflection),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 5,
                    child: SvgPicture.asset(reflection2),
                  ),
                  Positioned(
                    top: 13,
                    left: 12,
                    child: SvgPicture.asset(reflection3),
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: SvgPicture.asset(reflection4),
                  ),
                ],
              ),
              // Stack(
              //   alignment: Alignment.centerRight,
              //   children: [
              //     SizedBox(
              //       height: 80,
              //       width: 80,
              //       child: LiquidCircularProgressIndicator(
              //         value: 0.50,
              //         // Defaults to 0.5.
              //         borderColor: textColorFormField.withOpacity(.4),
              //         borderWidth: 4,
              //         valueColor: AlwaysStoppedAnimation(mainColor),
              //         // Defaults to the current Theme's accentColor.
              //         backgroundColor: Colors.transparent,
              //         // Defaults to the current Theme's backgroundColor.
              //         center: CustomText(
              //           text: '50',
              //           color: whiteColor,
              //           fontSize: textFont20,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(top: 13),
              //       child: SvgPicture.asset(reflection),
              //     ),
              //     Positioned(
              //       bottom: 5,
              //       left: 5,
              //       child: SvgPicture.asset(reflection2),
              //     ),
              //     Positioned(
              //       top: 19,
              //       left: 15,
              //       child: SvgPicture.asset(reflection3),
              //     ),
              //     Positioned(
              //       top: 30,
              //       left: 17,
              //       child: SvgPicture.asset(reflection4),
              //     ),
              //   ],
              // ),
              const SizedBox(
                width: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: 'Daily Quest',
                    color: mainColor,
                  ),
                  CustomText(
                    text: '1/5 complete',
                    color: textColorFormField,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
