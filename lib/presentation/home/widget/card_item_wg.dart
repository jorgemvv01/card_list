import 'package:card_list/presentation/shared/widget/button/custom_elevetad_button.dart';
import 'package:card_list/domain/custom_card/model/custom_card.dart';
import 'package:card_list/core/utils/color/custom_colors.dart';
import 'package:card_list/core/utils/text_style/custom_text_style.dart';
import 'package:card_list/core/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardItemWg extends StatelessWidget {
  const CardItemWg({super.key, required this.customCard});
  final CustomCard customCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.surface,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4,
            decoration: const BoxDecoration(
              color: CustomColors.primary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  customCard.title,
                  style: CustomTextStyles.titleH2(
                    isBold: true
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  customCard.description,
                  style: CustomTextStyles.paragraph(
                    color: CustomColors.textSecondary
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16, color: CustomColors.textSecondary),
                        const SizedBox(width: 8),
                        Text(
                          Util.formatDateTime(customCard.createdAt),
                          style: CustomTextStyles.smallParagraph(
                            color: CustomColors.textSecondary
                          ),
                        ),
                      ],
                    ),
                    CustomElevetadButton(
                      onPressed: (){
                        context.push('/details/${customCard.id}');
                      },
                      label: "Details",
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
