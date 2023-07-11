
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/color_manager.dart';

Widget buildOtpTextField({
  required FocusNode focusNode,
  required TextEditingController controller,
  FocusNode? nextFocusNode,
  final String? Function(String?)? validator,
  FocusNode? previousFocusNode,
  final TextInputAction? textInputAction,
  required BuildContext context
}) {
  return Container(
    width: 50.0.w,
    height: 50.0.h,
    padding:  EdgeInsets.symmetric(vertical: 3.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      border: Border.all(color: grey900)
    ),
    child: Column(
      children: [
        TextFormField(
          autofocus: true,
          textInputAction: textInputAction ?? TextInputAction.next,
          onFieldSubmitted: (value) {
            if (nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            } else if (focusNode != null) {
              focusNode!.unfocus();
            }
          },
          validator: validator,
          cursorColor: mainColor,
          cursorHeight: 25.h,
          controller: controller,
          focusNode: focusNode,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 1,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0.sp, color: Colors.black),
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              if (nextFocusNode != null) {
                nextFocusNode.requestFocus();
              } else {
                focusNode.unfocus();
              }
            } else {
              if (previousFocusNode != null) {
                previousFocusNode.requestFocus();
              }
            }
          },
        ),
        const Spacer(),
       // Container(height: 2,color: const Color(0xFFA5A5A5),width: 16.w,)
      ],
    ),
  );
}
