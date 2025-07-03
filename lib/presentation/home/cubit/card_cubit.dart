import 'package:card_list/domain/custom_card/model/custom_card.dart';
import 'package:card_list/presentation/home/cubit/card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial()) {
    loadCards();
  }

  final List<CustomCard> _cards = [
    CustomCard(
      id: 1,
      title: "Custom card 1",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in ex ut nibh aliquet tempus. Praesent ipsum sapien, aliquam id molestie eu, vehicula ut nibh. Morbi fermentum a magna nec consectetur. \n\nInteger faucibus nunc libero, ac pulvinar nisi facilisis in. Vivamus sit amet ante lacinia, pretium urna vel, faucibus leo. Quisque neque lacus, laoreet non est et, blandit suscipit odio. \n\nNunc tempor, neque et malesuada eleifend, neque sapien pellentesque nunc, vel mattis nunc arcu at quam. Donec scelerisque aliquam mauris a dapibus. Nam eget vestibulum nibh. Aliquam venenatis nisi risus, eu rhoncus lectus ultrices a. Cras ornare tempus tellus, sed sollicitudin lacus placerat ut. Cras sem quam, congue eget nulla ut, mollis rutrum purus. Sed quam tortor, semper quis ultrices eu, sollicitudin ac elit. \n\nVivamus dui justo, cursus vel vehicula ornare, tempus quis lectus. Pellentesque tortor sapien, dapibus nec finibus at, ultricies et nibh. Pellentesque ut libero et dolor blandit lacinia vel fringilla sapien. Duis est elit, rhoncus sit amet urna eget, scelerisque vehicula leo. Morbi eu varius tortor. In ut odio egestas, lobortis augue sit amet, ultricies lectus. Cras ac tincidunt dui. Morbi posuere, quam eget pulvinar laoreet, quam ex laoreet neque, non tempus turpis tellus id enim. Duis scelerisque nisi sapien, ac hendrerit felis venenatis ut.",
      createdAt: DateTime.now()
    ),
    CustomCard(
      id: 2,
      title: "Custom card 2",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in ex ut nibh aliquet tempus. Praesent ipsum sapien, aliquam id molestie eu, vehicula ut nibh. Morbi fermentum a magna nec consectetur. \n\nInteger faucibus nunc libero, ac pulvinar nisi facilisis in. Vivamus sit amet ante lacinia, pretium urna vel, faucibus leo. Quisque neque lacus, laoreet non est et, blandit suscipit odio. \n\nNunc tempor, neque et malesuada eleifend, neque sapien pellentesque nunc, vel mattis nunc arcu at quam. Donec scelerisque aliquam mauris a dapibus. Nam eget vestibulum nibh. Aliquam venenatis nisi risus, eu rhoncus lectus ultrices a. Cras ornare tempus tellus, sed sollicitudin lacus placerat ut. Cras sem quam, congue eget nulla ut, mollis rutrum purus. Sed quam tortor, semper quis ultrices eu, sollicitudin ac elit. \n\nVivamus dui justo, cursus vel vehicula ornare, tempus quis lectus. Pellentesque tortor sapien, dapibus nec finibus at, ultricies et nibh. Pellentesque ut libero et dolor blandit lacinia vel fringilla sapien. Duis est elit, rhoncus sit amet urna eget, scelerisque vehicula leo. Morbi eu varius tortor. In ut odio egestas, lobortis augue sit amet, ultricies lectus. Cras ac tincidunt dui. Morbi posuere, quam eget pulvinar laoreet, quam ex laoreet neque, non tempus turpis tellus id enim. Duis scelerisque nisi sapien, ac hendrerit felis venenatis ut.",
      createdAt: DateTime.now().add(const Duration(minutes: 1))
    ),
    CustomCard(
      id: 3,
      title: "Custom card 3",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in ex ut nibh aliquet tempus. Praesent ipsum sapien, aliquam id molestie eu, vehicula ut nibh. Morbi fermentum a magna nec consectetur. \n\nInteger faucibus nunc libero, ac pulvinar nisi facilisis in. Vivamus sit amet ante lacinia, pretium urna vel, faucibus leo. Quisque neque lacus, laoreet non est et, blandit suscipit odio. \n\nNunc tempor, neque et malesuada eleifend, neque sapien pellentesque nunc, vel mattis nunc arcu at quam. Donec scelerisque aliquam mauris a dapibus. Nam eget vestibulum nibh. Aliquam venenatis nisi risus, eu rhoncus lectus ultrices a. Cras ornare tempus tellus, sed sollicitudin lacus placerat ut. Cras sem quam, congue eget nulla ut, mollis rutrum purus. Sed quam tortor, semper quis ultrices eu, sollicitudin ac elit. \n\nVivamus dui justo, cursus vel vehicula ornare, tempus quis lectus. Pellentesque tortor sapien, dapibus nec finibus at, ultricies et nibh. Pellentesque ut libero et dolor blandit lacinia vel fringilla sapien. Duis est elit, rhoncus sit amet urna eget, scelerisque vehicula leo. Morbi eu varius tortor. In ut odio egestas, lobortis augue sit amet, ultricies lectus. Cras ac tincidunt dui. Morbi posuere, quam eget pulvinar laoreet, quam ex laoreet neque, non tempus turpis tellus id enim. Duis scelerisque nisi sapien, ac hendrerit felis venenatis ut.",
      createdAt: DateTime.now().add(const Duration(minutes: 5))
    ),
  ];

  void loadCards() async{
    await Future.delayed(const Duration(seconds: 1));
    emit(CardLoaded(cards: List.from(_cards)));
  }

  void addCard(CustomCard card) {
    _cards.add(card);
    emit(CardLoaded(cards: List.from(_cards)));
  }

  void updateCard(CustomCard card) {
    final index = _cards.indexWhere((c) => c.id == card.id);
    if (index != -1) {
      _cards[index] = card;
      emit(CardLoaded(cards: List.from(_cards)));
    }
  }

  void deleteCard(int id) {
    _cards.removeWhere((c) => c.id == id);
    emit(CardLoaded(cards: List.from(_cards)));
  }

  CustomCard? getCardById(int id) {
    try {
      return _cards.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }
}
 