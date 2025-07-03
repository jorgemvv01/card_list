import 'package:card_list/domain/custom_card/model/custom_card.dart';
import 'package:equatable/equatable.dart';

class CardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CardInitial extends CardState {}

class CardLoaded extends CardState {
  final List<CustomCard> cards;

  CardLoaded({required this.cards});

  @override
  List<Object?> get props => [cards];
}
