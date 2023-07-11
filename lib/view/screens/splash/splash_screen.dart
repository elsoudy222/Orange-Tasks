import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_odc_tasks/view/constant/extensions.dart';
import 'package:my_odc_tasks/view/layout.dart';

import '../../../view_model/cubits/theme/theme_cubit.dart';
import '../../components/core/custom_text.dart';
import '../../components/core/scaffold_custom/scaffold_custom.dart';
import '../../constant/assets.dart';
import '../../constant/color_manager.dart';
import '../../constant/fonts.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
        body: SizedBox(
          height: context.screenHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [

              SizedBox(
                width: 290.w,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.bottomRight,
                        colors: [
                          primaryColor,
                          primaryColor.withOpacity(0.2),
                          primaryColor.withOpacity(0.1),
                          primaryColor.withOpacity(0.1),
                        ]).createShader(rect);
                  },
                  child: DashedCircularProgressBar.aspectRatio(
                    aspectRatio: 0.5,
                    progress: 49.93,
                    startAngle: 0,
                    sweepAngle: -360,
                    corners: StrokeCap.square,
                    animationCurve: Curves.linear,
                    animationDuration: const Duration(milliseconds: 4000),
                    foregroundStrokeWidth: 3.5,
                    backgroundStrokeWidth: 0,
                    circleCenterAlignment: Alignment.center,
                    foregroundColor: Colors.white,
                    backgroundColor: transparent,
                    animation: true,
                    onAnimationEnd: () {
                      context.push(const Layout());
                    },
                  ),
                ),
              ),

              //progress left
              SizedBox(
                width: 290.w,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.bottomLeft,
                        colors: [
                          primaryColor,
                          primaryColor.withOpacity(0.2),
                          primaryColor.withOpacity(0.1),
                          primaryColor.withOpacity(0.1),
                        ]).createShader(rect);
                  },
                  child: const DashedCircularProgressBar.aspectRatio(
                    aspectRatio: 0.5,
                    // width / height
                    progress: 49.90,
                    startAngle: 0,
                    sweepAngle: 358.5,
                    corners: StrokeCap.square,
                    animationCurve: Curves.linear,
                    animationDuration: Duration(milliseconds: 4000),
                    foregroundStrokeWidth: 3.5,
                    backgroundStrokeWidth: 0,
                    circleCenterAlignment: Alignment.center,
                    foregroundColor: Colors.white,
                    backgroundColor: transparent,
                    animation: true,
                  ),
                ),
              ),

              //circle logo
              // Transform.scale(
              //   scale: 1.42.sp,
              //   child: Container(
              //     height: 180.w,
              //     width: 180.w,
              //     //  margin:  EdgeInsets.only(top: 20.h,left: 10.w),
              //     decoration: BoxDecoration(
              //         color: ThemeCubit.get(context).isDark
              //             ? darkBackground
              //             : grey100,
              //         shape: BoxShape.circle,
              //         boxShadow: [
              //           //drop shadow
              //           BoxShadow(
              //               offset: const Offset(5, 5),
              //               blurRadius: 13,
              //               color: ThemeCubit.get(context).isDark
              //                   ? darkShadow
              //                   : grey200),
              //           BoxShadow(
              //               offset: const Offset(-5, -5),
              //               blurRadius: 10,
              //               color: ThemeCubit.get(context).isDark
              //                   ? darkShadow
              //                   : grey200),
              //           BoxShadow(
              //               offset: const Offset(5, -5),
              //               blurRadius: 10,
              //               color: ThemeCubit.get(context).isDark
              //                   ? darkShadow
              //                   : grey200),
              //           BoxShadow(
              //               offset: const Offset(-5, 5),
              //               blurRadius: 10,
              //               color: ThemeCubit.get(context).isDark
              //                   ? darkShadow
              //                   : grey200),
              //
              //           //inner shadow
              //           BoxShadow(
              //               offset: const Offset(-1, -1),
              //               blurRadius: 2,
              //               color: ThemeCubit.get(context).isDark
              //                   ? darkShadow
              //                   : grey200),
              //           BoxShadow(
              //               offset: const Offset(1, -1),
              //               blurRadius: 2,
              //               color: ThemeCubit.get(context).isDark
              //                   ? darkShadow
              //                   : grey200),
              //         ]),
              //   ),
              // ),

              //img logo
              Center(
                child: SvgPicture.asset(
                  //todo: solve image problem
                  // ThemeCubit.get(context).isDark ? darkLogo : lightLogo,
                  logo,
                  width: 150.w,
                ),
              ),

              //From + Software House
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //from
                    CustomText(
                      text: "From",
                      color: grey600,
                      fontWeight: FontWeight.w500,
                    ),

                    //Software House
                    CustomText(
                      text: "Software House",
                      color: primaryColor,
                      fontSize: btnFont16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}