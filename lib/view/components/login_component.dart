// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../viewmodel/cubits/auth/login/login_cubit.dart';
// import '../constant/assets.dart';
// import '../constant/color_manager.dart';
// import '../constant/data.dart';
// import '../constant/navigation_service.dart';
// import 'core/buttons/main_button.dart';
// import 'core/custom_rich_text.dart';
// import 'core/custom_text.dart';
// import 'core/textfields/custom_text_form_filed.dart';
//
// // todo : I Created this all (buda)
// class LoginHeader extends StatelessWidget {
//   const LoginHeader({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: 50.0.sp),
//       child: CustomRichText(
//         firstText: 'Welcome',
//         secondText: 'Back!',
//         customFirstTextStyle: GoogleFonts.poppins(
//             fontSize: 50.sp, fontWeight: FontWeight.w700, color: mainColor),
//         customSecondTextStyle: GoogleFonts.poppins(
//             height: 1,
//             fontSize: 50.sp,
//             fontWeight: FontWeight.w700,
//             color: whiteColor),
//       ),
//     );
//   }
// }
//
// class LoginForm extends StatelessWidget {
//   final LoginCubit loginCubit;
//   const LoginForm({Key? key, required this.loginCubit}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: loginCubit.formKey,
//       child: Column(
//         children: [
//           TextFormFieldsCustom(
//             controller: loginCubit.emailController,
//             focus: loginCubit.emailFocusNode,
//             onChanged: (emailValue) {
//               loginCubit.emailChanged(emailValue!);
//             },
//             validator: (emailValue) => emailValue!.isEmpty
//                 ? 'Please Enter Your Email'
//                 : !RegExp(validationEmail).hasMatch(emailValue.trim())
//                     ? 'Enter correct Email'
//                     : null,
//             enableInteractive: false,
//             hintText: "Email",
//             keyboardType: TextInputType.text,
//             textInputAction: TextInputAction.next,
//             prefixIcon: Padding(
//               padding: EdgeInsets.all(20.0.sp),
//               child: SvgPicture.asset(
//                 email,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 30.h,
//           ),
//           TextFormFieldsCustom(
//             controller: loginCubit.passwordController,
//             focus: loginCubit.passwordFocusNode,
//             onChanged: (passwordValue) {
//               loginCubit.passwordChanged(passwordValue!);
//             },
//             validator: (passwordValue) => passwordValue!.isEmpty
//                 ? 'Please Enter Your Password'
//                 : !RegExp(validationPassword).hasMatch(passwordValue.trim())
//                     ? 'Enter correct password'
//                     : null,
//             enableInteractive: false,
//             hintText: "Password",
//             isPassword: loginCubit.isPasswordVisible,
//             suffixIcon: IconButton(
//               onPressed: () {
//                 loginCubit.togglePasswordVisibility();
//               },
//               icon: Icon(
//                 loginCubit.isPasswordVisible
//                     ? Icons.visibility_off
//                     : Icons.visibility,
//                 color: loginCubit.isPasswordVisible ? mainColor : grey,
//               ),
//             ),
//             keyboardType: TextInputType.text,
//             textInputAction: TextInputAction.next,
//             prefixIcon: Padding(
//               padding: EdgeInsets.all(20.0.sp),
//               child: SvgPicture.asset(
//                 lock,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ForgetButton extends StatelessWidget {
//   const ForgetButton({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0),
//       child: Align(
//         alignment: Alignment.centerRight,
//         child: GestureDetector(
//           onTap: () {
//             NavigationService.instance.navigateTo(forgetPasswordScreen);
//             // navigatorTo(con, ForgetPasswordScreen());
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: CustomText(
//               text: 'Forgot password?',
//               fontSize: 12.sp,
//               fontWeight: FontWeight.w500,
//               color: mainColor,
//               textDecoration: TextDecoration.underline,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class LoginButton extends StatelessWidget {
//   final LoginCubit loginCubit;
//   const LoginButton({Key? key, required this.loginCubit}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MainButton(
//       title: 'login',
//       onTap: () {
//         loginCubit.login(context);
//       },
//     );
//   }
// }
