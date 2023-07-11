import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_odc_tasks/view/components/core/scaffold_custom/scaffold_custom.dart';

import '../../../constant/assets.dart';

class BackgroundCustom extends StatelessWidget {
  const BackgroundCustom({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      // color: backgroundColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              light,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            // padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h, right: 32, left: 32,bottom: 32),
                    child: body,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
