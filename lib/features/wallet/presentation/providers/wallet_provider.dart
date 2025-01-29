import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WalletProvider extends ChangeNotifier {
  double _balance = 67323.00;

  String get formattedBalance => NumberFormat('#,##0.00').format(_balance);

  double get balance => _balance;

  void deductAmount(double amount) {
    _balance -= amount;
    notifyListeners();
  }

  void addAmount(double amount) {
    _balance += amount;
    notifyListeners();
  }
}
