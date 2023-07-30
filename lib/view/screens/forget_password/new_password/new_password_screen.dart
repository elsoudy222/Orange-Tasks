import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/core/buttons/custom_button.dart';
import '../../../components/core/custom_appbar.dart';
import '../../../components/core/custom_text.dart';
import '../../../components/core/textfields/custom_text_form_filed.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/fonts.dart';
import '../../../constant/navigation_service.dart';


class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key? key}) : super(key: key);
  static final formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        onPressed: () {},
        colorAppBar: white,

        colorTxtAppBar: black,
      ),
      body: SingleChildScrollView(
        child: Container(
          //margin: EdgeInsets.only(top: 50.h),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: 'Create New Password',
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                  fontSize: textFont15.sp,
                  color: black,
                ),

                SizedBox(
                  height: 42.h,
                ),

                // icon
                SvgPicture.asset(
                  'assets/svg/new_pass.svg',
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height / 4.2,
                ),

                // text

                SizedBox(
                  height: 38.h,
                ),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  width: double.infinity,
                  child: CustomText(
                    textAlign: TextAlign.start,
                    text: "New password",
                    color: Color(0xFF1A1A1A),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // New Password
                TextFormFieldsCustom(
                  enableInteractive: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hintText: 'New Password',
                  borderRadius: 10.0.h,
                  controller: newPasswordController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Password must be not Empty";
                    } else if (!value.trim().contains(RegExp(r'[A-Z]'))) {
                      return "Password must Contains UpperCase Letter";
                    } else if (!value.trim().contains(RegExp(r'[0-9]'))) {
                      return "Password must Contains Digit";
                    } else if (!value.trim().contains(RegExp(r'[a-z]'))) {
                      return "Password must Contains LowerCase Letter";
                    } else if (!value
                        .trim()
                        .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return "Password must Contains Special Character";
                    } else if (value.trim().length < 8) {
                      return "Password must be more 8 Letters";
                    } else if (!RegExp(
                        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$/&*~.]).{8,}$")
                        .hasMatch(value.trim())) {
                      return "Password is not Valid";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 22.h,
                ),
                // Confirm Password
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  width: double.infinity,
                  child: CustomText(
                    textAlign: TextAlign.start,
                    text: "Confirm Password",
                    color: Color(0xFF1A1A1A),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextFormFieldsCustom(
                  enableInteractive: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  hintText: 'Confirm Password',
                  borderRadius: 10.0.h,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Password must be not Empty";
                    } else if (!value.trim().contains(RegExp(r'[A-Z]'))) {
                      return "Password must Contains UpperCase Letter";
                    } else if (!value.trim().contains(RegExp(r'[0-9]'))) {
                      return "Password must Contains Digit";
                    } else if (!value.trim().contains(RegExp(r'[a-z]'))) {
                      return "Password must Contains LowerCase Letter";
                    } else if (!value
                        .trim()
                        .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return "Password must Contains Special Character";
                    } else if (value.trim().length < 8) {
                      return "Password must be more 8 Letters";
                    } else if (!RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~.]).{8,}$')
                        .hasMatch(value.trim())) {
                      return "Password is not Valid";
                    }
                    return '';
                  },
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomButton(
                  color: mainColor,
                  onClick: () {
                    if (formKey.currentState!.validate()) {
                      NavigationService.instance.navigationKey!.currentState!
                          .pushNamed('OnBoardScreen');
                    }
                  },
                  title: CustomText(
                    text: 'Confirm',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}