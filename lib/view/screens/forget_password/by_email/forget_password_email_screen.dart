import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/core/buttons/custom_button.dart';
import '../../../components/core/custom_appbar.dart';
import '../../../components/core/custom_text.dart';
import '../../../components/core/textfields/custom_text_form_filed.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/data.dart';
import '../../../constant/fonts.dart';

class ForgetPasswordEmailScreen extends StatelessWidget {
  ForgetPasswordEmailScreen({Key? key}) : super(key: key);
  static final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        colorAppBar: white,
        onPressed: () {},
        colorTxtAppBar: black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // image
                Container(
                    margin: EdgeInsets.only(top: 50.h, bottom: 32.h),
                    height: 200.h,
                    width: 198.w,
                    child: SvgPicture.asset(
                      // TODO : { Need to change icon: }
                      'assets/svg/attendance_check.svg',
                      fit: BoxFit.contain,
                    )),

                // Description
                CustomText(
                  text:
                      'Please write your email to send your OTP code to reset your password',
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.normal,
                  fontSize: textFont13.sp,
                  color: grey900,
                ),
                SizedBox(
                  height: 32.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  width: double.infinity,
                  child: CustomText(
                    textAlign: TextAlign.start,
                    text: "Email",
                    color: Color(0xFF1A1A1A),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // e-mail text form field
                TextFormFieldsCustom(
                  enableInteractive: true,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  hintText: 'Email',
                  borderRadius: 15.0.h,
                  controller: emailController,
                  // validate
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "email must be not Empty";
                    } else if (!RegExp(validationEmail)
                        .hasMatch(value.trim())) {
                      return "email is not Valid";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CustomText(
                    text: 'or Phone Number',
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.normal,
                    fontSize: textFont13.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 42.h,
                ),

                CustomButton(
                  color: mainColor,
                  borderRadius: 15.0,
                  onClick: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, 'VerifyScreen',
                          arguments: emailController.text);
                    }
                  },
                  //
                  title: CustomText(
                    text: 'Send',
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
