import 'package:flutter/material.dart';
import 'dart:convert';
// import 'dart:html';
// import 'dart:io';
import 'package:http/http.dart' as http;
// import 'package:mime_type/mime_type.dart';
// import 'package:http_parser/http_parser.dart';
import 'package:logginapp2/models/sizes.dart';

class SizesService extends ChangeNotifier {
  final String _url =
      'https://flutter-varios2-2d54a-default-rtdb.firebaseio.com';
  final String _baseUrl = 'flutter-varios2-2d54a-default-rtdb.firebaseio.com';

  String _idProducto = '';
  String _idColor = '';
  String _idSize = '';
  String _idNewTarea = '';

  get idProducto {
    return _idProducto;
  }

  set idProducto(nombre) {
    this._idProducto = nombre;
    notifyListeners();
  }

  get idColor {
    return _idColor;
  }

  set idColor(nombre) {
    this._idColor = nombre;
    notifyListeners();
  }

  get idSize {
    return _idSize;
  }

  set idSize(nombre) {
    this._idSize = nombre;
    notifyListeners();
  }

  get idNewTarea {
    return _idNewTarea;
  }

  set idNewTarea(nombre) {
    this._idNewTarea = nombre;
    notifyListeners();
  }

  final List<SizeModel> sizes = [];

  late SizeModel selectedSize;

  bool isLoading = true;
  bool isSaving = false;

  Future<List<SizeModel>> loadSizes(
      String _idProducts, String _idColors) async {
    final url = '$_url/Zapatos/$_idProducts/colores/$_idColors/tallas.json';
    final resp = await http.get(Uri.parse(url));

    if (json.decode(resp.body) != null) {
      final Map<String, dynamic> decodedData = json.decode(resp.body);

      final List<SizeModel> sizes = [];

      // if (decodedData == null) return [];

      decodedData.forEach((id, siz) {
        final sizTemp = SizeModel.fromMap(siz);
        sizTemp.id = id;

        sizes.add(sizTemp);
      });
      // print(url);
      return sizes;
    } else {
      return [];
    }
  }

  //Metodo de hacer interacciones con Firebase (Crear y actualizar)
  // final String id = 'hola';
  Future saveOrCreateSize(SizeModel size) async {
    isSaving = true;
    notifyListeners();

    if (size.id == null) {
      //Crear
      await this.createSize(size);
    } else {
      //Actualizar
      await this.updateSize(size);
    }

    isSaving = false;
    notifyListeners();
  }

  // Peticion para actualizar Tallas

  Future<String> updateSize(SizeModel size) async {
    final urlCompleta = Uri.https(_baseUrl,
        'Zapatos/${idProducto}/colores/${idColor}/tallas/${idSize}.json');
    final resp = await http.put(urlCompleta, body: size.toJson());
    final decodedData = resp.body;

    print(urlCompleta);

    // final index = this.sizes.indexWhere((element) => element.id == size.id);
    // this.sizes[index] = size;
    size.id = idSize;
    return size.id!;
  }

  //NUEVA TALLA
  Future<String> createSize(SizeModel size) async {
    final urlCompleta = Uri.https(
        _baseUrl, 'Zapatos/${idProducto}/colores/${idColor}/tallas.json');
    final resp = await http.post(urlCompleta, body: size.toJson());
    final decodedData = json.decode(resp.body);
    print(json.decode(resp.body));
    size.id = decodedData['name'];
    this.sizes.add(size);
    // print(decodedData);

    return size.id!;
  }

  Future<String> createSizeTarea(SizeModel size) async {
    final urlCompleta =
        Uri.https(_baseUrl, 'Tareas/${idNewTarea}/zapatos.json');
    final resp = await http.post(urlCompleta, body: size.toJson());
    final decodedData = json.decode(resp.body);
    print(json.decode(resp.body));
    size.id = decodedData['name'];
    this.sizes.add(size);
    // print(decodedData);

    return size.id!;
  }
}
