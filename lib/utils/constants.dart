import 'package:flutter/material.dart';

const currencies = [
  "COP",
  "USD",
  "EUR",
];

var currencyIcons = {
  "COP": Icons.attach_money,
  "USD": Icons.attach_money,
  "EUR": Icons.euro
};

final List<List<double>> rates = [
  [1.0, 0.00026, 0.00025],
  [3829, 1.0, .94],
  [4080, 1.07, 1.0]
];
