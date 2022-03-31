import 'package:flutter/material.dart';
import 'package:logginapp2/models/cart_model.dart';

class CartService with ChangeNotifier {
  Cart? _usuario;

  get usuario => this._usuario;

  bool get existeUsuario => (this._usuario != null) ? true : false;

  set usuario(user) {
    this._usuario = user;
    notifyListeners();
  }

  void deleteListCartShopping() {
    this._usuario = null;
    notifyListeners();
  }

  void agregarUrlFotos(String urlFotos) {
    this._usuario!.fotosUrl!.add(urlFotos);
    notifyListeners();
    print(_usuario!.fotosUrl!.length);
  }

  void agregarColor(String color) {
    this._usuario!.colores!.add(color);
    notifyListeners();
    print(_usuario!.colores!.length);
  }

  void agregarTallas(String talla) {
    this._usuario!.tallas!.add(talla);
    notifyListeners();
    print(_usuario!.tallas!.length);
  }

  void agregarPares(String par) {
    this._usuario!.pares!.add(par);
    notifyListeners();
    print(_usuario!.pares!.length);
  }

  void agregarId(String id) {
    this._usuario!.id!.add(id);
    notifyListeners();
    print(_usuario!.id!.length);
  }

  void agregarPdisponibles(String pDisponibles) {
    this._usuario!.pDisponibles!.add(pDisponibles);
    notifyListeners();
    print(_usuario!.pDisponibles!.length);
  }

  void agregarPpMayor(double ppMayor) {
    this._usuario!.ppMayor!.add(ppMayor);
    notifyListeners();
    print(_usuario!.ppMayor!.length);
  }
}
