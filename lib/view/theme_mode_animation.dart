import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../view_model/cubits/theme/theme_cubit.dart';
import 'constant/color_manager.dart';



class ThemeModeAnimation extends StatefulWidget {
  const ThemeModeAnimation({super.key,});


  @override
  State<ThemeModeAnimation> createState() => _ThemeModeAnimationState();
}

class _ThemeModeAnimationState extends State<ThemeModeAnimation> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        ThemeCubit.get(context).changeAppTheme();
        ThemeCubit.get(context).cashAppTheme(ThemeCubit.get(context).isDark);
        print('cubitttt ${ThemeCubit.get(context).isDark}');
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Stack(
        children: [
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 4),
            width: 65,
            height: 35,
            decoration: BoxDecoration(
              color: isSelected == false
                  ? darkBackground
                  : white,
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            child: Align(
              alignment: isSelected == false
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: SvgPicture.asset(
                isSelected == false ? "assets/svg/moon.svg" : "assets/svg/sun.svg",
                width: 26,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            left: isSelected ? 35 : 8,
            top: 7,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  color: mainColor, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}