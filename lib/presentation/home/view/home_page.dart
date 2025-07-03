import 'package:card_list/presentation/home/cubit/card_cubit.dart';
import 'package:card_list/presentation/home/cubit/card_state.dart';
import 'package:card_list/presentation/home/widget/card_item_wg.dart';
import 'package:card_list/core/utils/color/custom_colors.dart';
import 'package:card_list/core/utils/text_style/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List of Cards",
          style: CustomTextStyles.titleH1(
            isBold: true
          )
        )
      ),
      body: BlocBuilder<CardCubit, CardState>(
        builder: (context, state) {
          if (state is CardLoaded) {
            final cards = state.cards;
            return ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                return CardItemWg(customCard: card);
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.surface,
        onPressed: () {
          context.go('/form');
        },
        child: const Icon(
          size: 32,
          Icons.add,
          color: CustomColors.primaryVariant,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
