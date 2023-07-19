import 'package:customer/presentation/ui/main/model/card_model.dart';
import 'package:flutter/foundation.dart';

class MainProvider extends ChangeNotifier {
  List<CardModel> _cards = [];

  List<CardModel> get cards => _cards;

  updateCards(List<CardModel> cards) {
    _cards = cards;
    notifyListeners();
  }

  void addCard(CardModel card) {
    _cards.add(card);
    notifyListeners();
  }

  void removeCard(CardModel card) {
    _cards.remove(card);
    notifyListeners();
  }
}
