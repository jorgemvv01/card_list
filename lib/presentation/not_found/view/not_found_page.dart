import 'package:card_list/core/utils/text_style/custom_text_style.dart';
import 'package:card_list/presentation/shared/widget/button/custom_elevetad_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Oops! Page not found",
          style: CustomTextStyles.titleH1(
            isBold: true
          )
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message ?? "The page you are looking for does not exist.",
              style: CustomTextStyles.titleH2(),
              textAlign: TextAlign.center,
            ),
            CustomElevetadButton(
              onPressed: () {
                context.go('/');
              },
              label: "Go to home",
            )
          ],
        ),
      )
    );
  }
}
