import 'package:card_list/core/utils/button/custom_elevetad_button.dart';
import 'package:card_list/core/utils/color/custom_colors.dart';
import 'package:card_list/core/utils/text_style/custom_text_style.dart';
import 'package:card_list/core/utils/util.dart';
import 'package:card_list/presentation/home/cubit/card_cubit.dart';
import 'package:card_list/presentation/home/cubit/card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatelessWidget {
  final int cardId;

  const DetailsPage({super.key, required this.cardId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: CustomTextStyles.titleH1(
            isBold: true
          )
        )
      ),
      body: BlocBuilder<CardCubit, CardState>(
        builder: (context, state) {
          if (state is CardLoaded) {
            final cardsFound = state.cards.where((c) => c.id == cardId);
            final card = cardsFound.isNotEmpty ? cardsFound.first : null;
            if (card == null) {
              return Center(
                child: Text(
                  "Card not found",
                  style: CustomTextStyles.titleH2(
                  isBold: true
                  )
                )
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          card.title,
                          style: CustomTextStyles.titleH1(
                            isBold: true
                          )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: CustomColors.primaryVariant,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.push('/form/${card.id}');
                                },
                                icon: const Icon(
                                  size: 34,
                                  Icons.edit_outlined,
                                  color: CustomColors.background
                                )
                              ),
                              IconButton(
                                onPressed: () {
                                  _showDeleteConfirmationDialog(context, card.id);
                                },
                                icon: const Icon(
                                  size: 34,
                                  Icons.delete_forever_outlined,
                                  color: CustomColors.background
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        Util.formatDateTime(card.createdAt),
                        style: CustomTextStyles.smallParagraph(
                          color: CustomColors.textSecondary
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        card.description,
                        style: CustomTextStyles.paragraph(
                          color: CustomColors.textPrimary
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int cardId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Delete item',
            style: CustomTextStyles.titleH2(
              isBold: true,
            ),
          ),
          content: Text(
            'Are you sure you want to delete this item? This action cannot be undone.',
            style: CustomTextStyles.paragraph(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Cancel',
                style: CustomTextStyles.paragraph(
                  isBold: true,
                  color: CustomColors.textSecondary,
                ),
              ),
            ),
            CustomElevetadButton(
              onPressed: () {
                context.read<CardCubit>().deleteCard(cardId);
                context.go('/');
              },
              label: 'Delete',
            ),
          ],
        );
      },
    );
  }
}
