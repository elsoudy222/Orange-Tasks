import 'package:flutter/material.dart';

import 'custom_text_form_filed.dart';


class MainTextFormField extends StatelessWidget {
  const MainTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormFieldsCustom(
      hintText: 'email', enableInteractive: false,
    );
  }
}
