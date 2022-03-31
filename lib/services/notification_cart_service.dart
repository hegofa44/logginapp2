import 'package:flutter/material.dart';

class NotificationCart with ChangeNotifier {
  int _numero = 0;

  int get numero => this._numero;

  set numero(int valor) {
    this._numero = valor;
    notifyListeners();
    print(_numero);
  }
}
