import 'package:flutter/material.dart';

class SizeColorConexion with ChangeNotifier {
  String _heroe = '';
  String _heroe2 = '';
  String _heroe3 = '';
  String _heroe4 = '';
  double _totalTarea = 0.0;
  double _totalVentas = 0.0;
  double _top = 100.0;
  bool _guardando = false;
  bool _reset = false;
  bool _reset2 = false;
  int _totalPares = 1;
  String _referencia = '';
  String _color = '';

  get heroe {
    return _heroe;
  }

  get heroe2 {
    return _heroe2;
  }

  get heroe3 {
    return _heroe3;
  }

  get heroe4 {
    return _heroe4;
  }

  get totalVentas {
    return _totalVentas;
  }

  get totalPares {
    return _totalPares;
  }

  get totalTarea {
    return _totalTarea;
  }

  get top {
    return _top;
  }

  get guardando {
    return _guardando;
  }

  get reset {
    return _reset;
  }

  get reset2 {
    return _reset2;
  }

  get referencia {
    return _referencia;
  }

  get color {
    return _color;
  }

  set heroe(nombre) {
    this._heroe = nombre;
    notifyListeners();
  }

  set heroe2(nombre) {
    this._heroe2 = nombre;
    notifyListeners();
  }

  set heroe3(nombre) {
    this._heroe3 = nombre;
    notifyListeners();
  }

  set heroe4(nombre) {
    this._heroe4 = nombre;
    notifyListeners();
  }

  set totalVentas(ventaTotal) {
    this._totalVentas = ventaTotal;
    notifyListeners();
    // print(ventaTotal.toString());
  }

  set totalTarea(costoTarea) {
    this._totalTarea = costoTarea;
    notifyListeners();
    // print(ventaTotal.toString());
  }

  set guardando(guardar) {
    this._guardando = guardar;
    notifyListeners();
    // print(ventaTotal.toString());
  }

  set reset(res) {
    this._reset = res;
    notifyListeners();
    // print(ventaTotal.toString());
  }

  set reset2(res2) {
    this._reset2 = res2;
    notifyListeners();
    // print(ventaTotal.toString());
  }

  set totalPares(totalPar) {
    this._totalPares = totalPar;
    notifyListeners();
    // print(ventaTotal.toString());
  }

  set referencia(referencias) {
    this._referencia = referencias;
    notifyListeners();
    // print(ventaTotal.toString());
  }

  set color(colores) {
    this._color = colores;
    notifyListeners();
    // print(ventaTotal.toString());
  }

  set top(tops) {
    this._top = tops;
    notifyListeners();
    // print(ventaTotal.toString());
  }
}
