import 'package:card_list/core/utils/color/custom_colors.dart';
import 'package:card_list/core/utils/text_style/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.labelText,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? Function(String?)? validator;
  final int maxLines;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      style: CustomTextStyles.titleH3(),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: CustomColors.primary,
            width: 1
          ),
        ),
      ),
      validator: validator,
    );
  }
}