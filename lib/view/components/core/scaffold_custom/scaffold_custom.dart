import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_odc_tasks/view_model/cubits/theme/theme_cubit.dart';

import '../../../constant/color_manager.dart';
import '../custom_appbar.dart';

class ScaffoldCustom extends StatelessWidget {
  final Widget body;

  final String? appBarTitle;
  final IconData? icon;
  final Function? onPressed;
  final Widget? bottomNavigationBar;
  final CustomAppBar? appBarCustom;
  final bool? condition;

  final bool? isExtend;
  final Color backgroundColor ;

  final Widget? floatingActionButton;
  // final Color? color;

  const ScaffoldCustom({
    Key? key,
    required this.body,
    this.appBarTitle,
    this.icon,
    this.onPressed,
    this.bottomNavigationBar,
    this.appBarCustom,
    this.condition = true,
    this.isExtend = false,
    // this.color = primaryColor,
    this.floatingActionButton,
    this.backgroundColor = blackColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      extendBodyBehindAppBar: isExtend!,
      resizeToAvoidBottomInset: true,
      appBar: appBarCustom,
      backgroundColor: ThemeCubit().isDark ? backgroundColor : white,
      body: Padding(
        padding: EdgeInsets.only(left: 32, right: 32, bottom: 32.h,),
        child: body,
      ),
      // Container(
      //   decoration: BoxDecoration(
      //     gradient: backgroundColor(),
      //   ),
      //
      //   child: body,
      // ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
