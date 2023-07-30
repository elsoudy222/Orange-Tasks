// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../constant/color_manager.dart';
//
// // ignore: must_be_immutable
// class TextFormFieldsCustom extends StatefulWidget {
//   final String? hintText;
//   final int? maxLines;
//   final String? Function(String?)? validator;
//   final Function(String?)? onSaved;
//   bool? isPassword;
//   final TextInputType? keyboardType;
//   final String? helperText;
//   final String initialValue;
//   final Function()? onEditingComplete;
//   final TextInputAction? textInputAction;
//   final TextEditingController? controller;
//   final bool? suffix;
//   final bool? suffixToggle;
//   final Widget? suffixIcon;
//   final Color? suffixIconColor;
//   final IconData? suffixIconToggle;
//   final Color? suffixIconColorToggle;
//   final Function()? suffixOnPressed;
//   final FocusNode? focus;
//   final Function(String?)? onChanged;
//   final bool? enableInteractive;
//   final Widget? prefixIcon;
//
//   TextFormFieldsCustom(
//       {Key? key,
//       this.hintText,
//       this.validator,
//       this.onSaved,
//       this.maxLines = 1,
//       this.keyboardType,
//       this.helperText,
//       this.isPassword = false,
//       this.initialValue = "",
//       this.onEditingComplete,
//       this.textInputAction,
//       this.controller,
//       this.suffix = false,
//       this.suffixToggle = false,
//       this.suffixIcon,
//       this.suffixIconColor = hintColor,
//       this.suffixIconToggle,
//       this.suffixIconColorToggle = hintColor,
//       this.suffixOnPressed,
//       this.focus,
//       this.onChanged,
//       this.enableInteractive = true,
//       this.prefixIcon})
//       : super(key: key);
//
//   @override
//   State<TextFormFieldsCustom> createState() => _TextFormFieldsCustomState();
// }
//
// class _TextFormFieldsCustomState extends State<TextFormFieldsCustom> {
//   //const TextFormFieldsCustom({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       enableInteractiveSelection: widget.enableInteractive,
//       controller: widget.controller,
//       focusNode: widget.focus,
//       maxLines: widget.maxLines,
//       textInputAction: widget.textInputAction ?? TextInputAction.done,
//       onEditingComplete: widget.onEditingComplete,
//       onChanged: (value) {
//         //onChanged!(value);
//         widget.onChanged != null ? widget.onChanged!(value) : null;
//       },
//       style: const TextStyle(
//         color: white
//       ),
//       decoration: InputDecoration(
//         fillColor: toastColor,
//         filled: true,
//         isDense: true,
//         hintText: widget.hintText,
//         helperText: widget.helperText,
//         suffixIcon: widget.suffixIcon,
//         prefixIcon: widget.prefixIcon,
//         floatingLabelBehavior: FloatingLabelBehavior.auto,
//         hintStyle: TextStyle(
//           fontSize: 14.sp,
//           color: greyText,
//         ),
//         // enabledBorder: const OutlineInputBorder(
//         //   borderSide: BorderSide(
//         //     color: fillGrey,
//         //   ),
//         // ),
//         contentPadding: EdgeInsets.symmetric(
//           vertical: 16.sp,
//           horizontal: 18.sp,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10)
//         ),
//         focusedBorder:  OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: toastColor,
//           ),
//           borderRadius: BorderRadius.circular(10)
//         ),
//         errorBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.red,
//           ),
//         ),
//         focusedErrorBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.red,
//           ),
//         ),
//       ),
//       obscureText: widget.isPassword!,
//       validator: widget.validator,
//       onSaved: (value) {
//         widget.onSaved != null ? widget.onSaved!(value) : null;
//       },
//       keyboardType: widget.keyboardType,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/color_manager.dart';
import '../../../constant/color_manager.dart';

// ignore: must_be_immutable
class TextFormFieldsCustom extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  bool? isPassword;
  final TextInputType? keyboardType;
  final String? helperText;
  final String initialValue;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? suffix;
  final bool? suffixToggle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? suffixIconColor;
  final Color borderColor;
  final IconData? suffixIconToggle;
  final Color? suffixIconColorToggle;
  final Function()? suffixOnPressed;
  final FocusNode? focus;
  final Function(String?)? onChanged;

  TextFormFieldsCustom({
    Key? key,
    this.prefixIcon,
    this.hintText,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.helperText,
    this.isPassword = false,
    this.initialValue = "",
    this.onEditingComplete,
    this.textInputAction,
    this.controller,
    this.suffix = false,
    this.suffixToggle = false,
    this.suffixIcon,
    this.suffixIconColor = hintColor,
    this.suffixIconToggle,
    this.suffixIconColorToggle = hintColor,
    this.suffixOnPressed,
    this.focus,
    this.onChanged,
    required bool enableInteractive,
    required double borderRadius,
    this.borderColor = grey600,
  }) : super(key: key);

  @override
  State<TextFormFieldsCustom> createState() => _TextFormFieldsCustomState();
}

class _TextFormFieldsCustomState extends State<TextFormFieldsCustom> {
  //const TextFormFieldsCustom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: widget.controller,
      focusNode: widget.focus,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      onEditingComplete: widget.onEditingComplete,
      onChanged: (value) {
        //onChanged!(value);
        widget.onChanged != null ? widget.onChanged!(value) : null;
      },
      style: const TextStyle(
          color: Colors.black
      ),
      cursorColor: mainColor,
      cursorHeight: 18.h,
      decoration: InputDecoration(
        fillColor: whiteColor,
        filled: true,
        isDense: true,
        hintText: widget.hintText,

        helperText: widget.helperText,
        prefixIcon: widget.prefixIcon,
        suffixIcon:widget.suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle:  TextStyle(
          fontSize: 16.sp,
          color: textColorFormField,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:  BorderSide(
            color: widget.borderColor,
          ),
        ),

        contentPadding:  EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 14.w,
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      obscureText: widget.isPassword!,
      obscuringCharacter: '*',
      validator: widget.validator,
      onSaved: (value) {
        // widget.onSaved != null ? widget.onSaved!(value) : null;
      },
      keyboardType: widget.keyboardType,
    );
  }
}