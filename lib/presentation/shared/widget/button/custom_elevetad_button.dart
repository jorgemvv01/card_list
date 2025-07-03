import 'package:card_list/core/utils/color/custom_colors.dart';
import 'package:card_list/core/utils/text_style/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomElevetadButton extends StatelessWidget {
  const CustomElevetadButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.primaryVariant,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: CustomTextStyles.paragraph(
          color: CustomColors.background,
          isBold: true,
        )
      ),
    );
  }
}