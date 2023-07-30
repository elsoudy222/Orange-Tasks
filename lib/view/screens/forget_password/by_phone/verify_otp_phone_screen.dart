import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/core/buttons/custom_button.dart';
import '../../../components/core/custom_appbar.dart';
import '../../../components/core/custom_text.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/fonts.dart';
import '../../../constant/navigation_service.dart';
import '../widget/otp_widget.dart';

class VerifyPhoneScreen extends StatefulWidget {
  VerifyPhoneScreen({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();
  final FocusNode _thirdFocusNode = FocusNode();
  final FocusNode _fourthFocusNode = FocusNode();

  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();

  String? validateOtp(String? value) {
    if (value!.isEmpty || value.length != 4) {
      return 'Please enter a valid 4-digit OTP code';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        onPressed: () {},
        title: 'Verify Your Email',
        colorTxtAppBar: black,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.h),
          child: Column(
            children: [
              // image
              SvgPicture.asset(
                'assets/svg/otp.svg',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height / 4.0,
              ),
              SizedBox(
                height: 42.h,
              ),
              // text : enter 4 digits otp
              CustomText(
                text: 'Check your messages for OTP code',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.normal,
                fontSize: textFont13.sp,
                color: grey900,
              ),
              SizedBox(
                height: 18.h,
              ),
              // text : enter 4 digits otp
              CustomText(
                text: 'Enter OTP code',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
                fontSize: textFont13.sp,
                color: grey900,
              ),
              SizedBox(
                height: 20.h,
              ),
              // OTP
              Form(
                key: VerifyPhoneScreen.formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildOtpTextField(
                      context: context,
                      focusNode: _firstFocusNode,
                      controller: _firstController,
                      nextFocusNode: _secondFocusNode,
                      previousFocusNode: null,
                    ),
                    SizedBox(width: 20.0.w),
                    buildOtpTextField(
                      context: context,
                      focusNode: _secondFocusNode,
                      controller: _secondController,
                      nextFocusNode: _thirdFocusNode,
                      previousFocusNode: _firstFocusNode,
                    ),
                    SizedBox(width: 20.0.w),
                    buildOtpTextField(
                      context: context,
                      focusNode: _thirdFocusNode,
                      controller: _thirdController,
                      nextFocusNode: _fourthFocusNode,
                      previousFocusNode: _secondFocusNode,
                    ),
                    SizedBox(width: 20.0.w),
                    buildOtpTextField(
                        context: context,
                        focusNode: _fourthFocusNode,
                        controller: _fourthController,
                        nextFocusNode: null,
                        previousFocusNode: _thirdFocusNode,
                        textInputAction: TextInputAction.done),
                  ],
                ),
              ),
              SizedBox(height: 15.0.h),
              
              CustomText(
                  text: "30 sec",
                color: mainColor,
                fontWeight: FontWeight.normal,

              ),
              
              
              
              SizedBox(height: 20.0.h),
              
              // Resend Code:
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                        text: "Didn’t receive code?  ",
                      ),
                      TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              NavigationService
                                  .instance.navigationKey!.currentState!
                                  .pushNamed(
                                "SignupScreen",
                              );
                            }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              // verify button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: CustomButton(
                  color: mainColor,
                  onClick: () {
                    // Extract the OTP code from the text fields
                    String otp = _firstController.text +
                        _secondController.text +
                        _thirdController.text +
                        _fourthController.text;

                    // Validate the OTP code
                    String? validationResult = validateOtp(otp);

                    if (validationResult == null) {
                      if (VerifyPhoneScreen.formKey.currentState!.validate()) {
                        NavigationService.instance.navigationKey!.currentState!
                            .pushNamed('NewPasswordScreen');
                      }
                    } else {
                      // OTP code is not valid,

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(validationResult),
                        ),
                      );
                    }
                  },
                  title: CustomText(
                    text: 'Confirm',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
