import 'package:conversoraapp/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<CurrencyModel>? currencies;
  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  final BuildContext context;

  HomeController(
      {required this.fromText, required this.toText, required this.context}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies![0];
    fromCurrency = currencies![1];
  }

  void convert() {
    String text = toText.text;
    double? value =
        double.tryParse(text.replaceAll(' ', '').replaceAll(',', '.'));

    if (value == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'O valor digitado $text não é um número',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ));
      return;
    }
    double returnValue = 0;
    if (fromCurrency.name == 'Real') {
      returnValue = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      returnValue = value * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      returnValue = value * toCurrency.euro;
    } else if (fromCurrency.name == 'Bitcoin') {
      returnValue = value * toCurrency.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
