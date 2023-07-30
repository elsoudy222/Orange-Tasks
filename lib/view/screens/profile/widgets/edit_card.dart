import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_odc_tasks/view/constant/assets.dart';

class EditCard extends StatelessWidget {
  const EditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      child: ListTile(
        onTap: (){},
        contentPadding: EdgeInsets.all(10),
        leading: SvgPicture.asset(softwareLogo),
        title: Text(
          "Bank Account",
          style: TextStyle(
            fontSize: 16.sp
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
