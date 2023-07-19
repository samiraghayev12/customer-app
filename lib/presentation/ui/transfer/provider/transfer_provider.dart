import 'package:customer/presentation/router/navigation.dart';
import 'package:customer/presentation/ui/main/model/card_model.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

enum CardSelection { fromCard, toCard }

class TransferProvider extends ChangeNotifier {
  final List<CardModel> cards;
  TransferProvider(this.cards);

  String _amount = "";

  String? _amountError;
  String? _cardNumberError;
  CardModel? _fromCard;
  CardModel? _toCard;
  final _fromCardController = MaskedTextController(mask: "0000 0000 0000 0000");
  final _toCardController = MaskedTextController(mask: "0000 0000 0000 0000");

  String? get amountError => _amountError;
  String? get cardNumberError => _cardNumberError;
  get fromCardController => _fromCardController;
  get toCardController => _toCardController;

  bool get isFormValid {
    final hasNoError = _amountError == null;
    final isFieldsValid = _amount.isNotEmpty;
    return hasNoError && isFieldsValid;
  }

  void updateAmount(String value) {
    _amount = value;
    int parsedAmount = int.tryParse(_amount) ?? 0;
    if ((_fromCard?.balance ?? 0) < parsedAmount) {
      _amountError = "Amount must be less than balance";
    } else if (parsedAmount == 0) {
      _amountError = "0 cannot be sent";
    } else {
      _amountError = null;
    }

    notifyListeners();
  }

  selectCard(CardModel card, CardSelection selection) {
    switch (selection) {
      case CardSelection.fromCard:
        if (_toCard != card) {
          _fromCard = card;
          _fromCardController.text = card.cardNumber;
        }
        break;
      case CardSelection.toCard:
        if (_fromCard != card) {
          _toCard = card;
          _toCardController.text = card.cardNumber;
        }
        break;
    }

    notifyListeners();
  }

  transfer() {
    if (isFormValid) {
      cards.firstWhere((element) => element.cardNumber == _fromCard?.cardNumber).balance -= int.parse(_amount);
      cards.firstWhere((element) => element.cardNumber == _toCard?.cardNumber).balance += int.parse(_amount);
      Navigation.pop(result: cards);
    }
  }
}
