import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/models/card_model.dart';

class SendMoneyProvider extends ChangeNotifier {
  String _amount = '0';
  bool _hasDecimal = false;
  List<CardModel> _cards = [];
  int _selectedCardIndex = 0;

  String get amount => _amount;
  bool get hasDecimal => _hasDecimal;
  List<CardModel> get cards => _cards;
  CardModel get selectedCard => _cards[_selectedCardIndex];

  void setCards(List<CardModel> cards) {
    _cards = cards;
    notifyListeners();
  }

  void selectCard(int index) {
    if (index >= 0 && index < _cards.length) {
      _selectedCardIndex = index;
      notifyListeners();
    }
  }

  void handleNumberInput(String value) {
    if (value == 'backspace') {
      if (_amount.length > 0) {
        if (_amount.endsWith('.')) {
          _hasDecimal = false;
        }
        _amount = _amount.substring(0, _amount.length - 1);
        if (_amount.isEmpty) {
          _amount = '0';
          _hasDecimal = false;
        }
      }
    } else if (value == '.') {
      if (!_hasDecimal && _amount.length > 0) {
        _amount = '$_amount.';
        _hasDecimal = true;
      }
    } else {
      if (_amount == '0' && value != '.') {
        _amount = value;
      } else {
        if (_hasDecimal) {
          final parts = _amount.split('.');
          if (parts.length > 1 && parts[1].length < 2) {
            _amount = '${parts[0]}.${parts[1]}$value';
          }
        } else {
          _amount = _amount + value;
        }
      }
    }

    _formatAmount();
    notifyListeners();
  }

  void _formatAmount() {
    if (!_amount.contains('.')) {
      final numberFormat = NumberFormat('#,##0', 'en_US');
      try {
        final number = int.parse(_amount.replaceAll(',', ''));
        _amount = numberFormat.format(number);
      } catch (e) {
        // Handle parsing errors
      }
    } else {
      final parts = _amount.split('.');
      if (parts.length > 0) {
        try {
          final number = int.parse(parts[0].replaceAll(',', ''));
          final numberFormat = NumberFormat('#,##0', 'en_US');
          _amount = '${numberFormat.format(number)}.${parts[1]}';
        } catch (e) {
          // Handle parsing errors
        }
      }
    }
  }

  void reset() {
    _amount = '0';
    _hasDecimal = false;
    notifyListeners();
  }
}
