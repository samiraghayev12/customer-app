import 'package:customer/presentation/components/delegate/pickable.dart';

class CardModel implements Pickable {
  final String name;
  final String surname;
  final String birthDate;
  final String phoneNumber;
  int balance;
  final String cardNumber;
  @override
  dynamic get value => cardNumber;

  CardModel({
    required this.name,
    required this.surname,
    required this.birthDate,
    required this.phoneNumber,
    required this.balance,
    required this.cardNumber,
  });
}
