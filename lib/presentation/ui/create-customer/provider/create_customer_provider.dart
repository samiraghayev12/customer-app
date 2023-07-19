import 'dart:math';

import 'package:customer/presentation/components/date-picker/date_picker.dart';
import 'package:customer/presentation/ui/main/model/card_model.dart';
import 'package:flutter/material.dart';

class CreateCustomerProvider extends ChangeNotifier {
  final _birthdateController = TextEditingController();

  String _name = '';
  String _surname = '';
  String _birthDate = '';
  String _phoneNumber = '';

  String? _nameError;
  String? _surnameError;
  String? _birthDateError;
  String? _phoneNumberError;

  String? get nameError => _nameError;
  String? get surnameError => _surnameError;
  String? get birthDateError => _birthDateError;
  String? get phoneNumberError => _phoneNumberError;
  TextEditingController get birthdateController => _birthdateController;

  bool get isFormValid {
    final hasNoError = _nameError == null && _surnameError == null && _birthDateError == null && _phoneNumberError == null;
    final isFieldsValid = _name.isNotEmpty && _surname.isNotEmpty && _birthDate.isNotEmpty && _phoneNumber.isNotEmpty;
    return hasNoError && isFieldsValid;
  }

  CardModel get card => CardModel(
        name: _name,
        surname: _surname,
        birthDate: _birthDate,
        phoneNumber: _phoneNumber,
        balance: 10,
        cardNumber: generateCardNumber(),
      );

  String generateCardNumber() {
    final random = Random();
    String cardNumber = List.generate(
      16,
      (_) => random.nextInt(10).toString(),
    ).join().replaceAllMapped(
          RegExp(r".{4}"),
          (match) => "${match.group(0)} ",
        );
    return cardNumber.trim();
  }

  updateName(String value) {
    _name = value;
    if (_name.isEmpty) {
      _nameError = 'Name is required';
    } else {
      _nameError = null;
    }
    notifyListeners();
  }

  updateSurname(String value) {
    _surname = value;
    if (_surname.isEmpty) {
      _surnameError = 'Surname is required';
    } else {
      _surnameError = null;
    }
    notifyListeners();
  }

  updateBirthDate(context) async {
    final startDate = DateTime.now().subtract(const Duration(days: 6574)).toString();
    final result = await DatePicker.show(
      context,
      selectedDate: DateTime.parse(startDate),
    );
    _birthDate = result.toString().substring(0, 10);
    _birthdateController.text = _birthDate;
    notifyListeners();
  }

  updatePhoneNumber(String value) {
    _phoneNumber = value;
    if (_phoneNumber.isEmpty) {
      _phoneNumberError = 'Phone Number is required';
    } else {
      _phoneNumberError = null;
    }
    notifyListeners();
  }
}
