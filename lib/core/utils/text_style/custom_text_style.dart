import 'package:card_list/core/utils/color/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomTextStyles {
  CustomTextStyles._();
  static TextStyle titleH1(
      {Color color = CustomColors.textPrimary, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontSize: 24,
    );
  }

  static TextStyle titleH2(
      {Color color = CustomColors.textPrimary, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontSize: 20,
    );
  }

  static TextStyle titleH3(
      {Color color = CustomColors.textPrimary, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontSize: 18,
    );
  }

  static TextStyle paragraph(
      {Color color = CustomColors.textPrimary, bool isBold = false, bool lineThrough = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontSize: 16,
      decoration: lineThrough ? TextDecoration.lineThrough : null
    );
  }

  static TextStyle smallParagraph(
      {Color color = CustomColors.textPrimary, bool isBold = false, bool lineThrough = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontSize: 13,
      decoration: lineThrough ? TextDecoration.lineThrough : null
    );
  }
}