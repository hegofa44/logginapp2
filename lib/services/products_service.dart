import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logginapp2/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsServices extends ChangeNotifier {
  // String _idProducto = '';
  final String _baseUrl = 'flutter-varios2-2d54a-default-rtdb.firebaseio.com';
  File? newPictureFile;

  // get idProducto {
  //   return _idProducto;
  // }

  // set idProducto(nombre) {
  //   this._idProducto = nombre;
  //   notifyListeners();
  // }

  final List<Product> products = [];

  late Product selectedProduct;

  bool isLoading = true;
  bool isSaving = false;

  ProductsServices() {
    this.loadProducts();
  }
// <List<Product>>
  Future<List<Product>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'Zapatos.json');
    final resp = await http.get(url);
    if (json.decode(resp.body) == null) return [];
    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });

    // for(int i=0; i<products.length; i++ ){

    // print(this.products[i].id);
    // }
    // print(this.products[0].fotoUrl);

    this.isLoading = false;

    notifyListeners();

    return this.products;
    // print(productsMap);
    /* print(productsMap["Color"]["Amarillo"]["Talla"]); */
  }

  //Metodo de hacer interacciones con Firebase (Crear y actualizar)
  // final String id = 'hola';
  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      //Crear
      await this.createProduct(product);
    } else {
      //Actualizar
      await this.updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  // Peticion para actualizar productos

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'Zapatos/${product.id}.json');
    final resp = await http.put(url, body: product.toJson());
    final decodedData = resp.body;

    // print(decodedData);

    final index =
        this.products.indexWhere((element) => element.id == product.id);
    this.products[index] = product;

    return product.id!;
  }

  //NUEVO PRODUCTO
  Future<String> createProduct(Product product) async {
    // final ColorModel colores;
    // final String id = 'hola';
    // late Product product2;
    // product2.id;
    final url = Uri.https(_baseUrl, 'Zapatos.json');
    final resp = await http.post(url, body: product.toJson());
    final decodedData = json.decode(resp.body);

    product.id = decodedData['name'];
    this.products.add(product);
    // print(decodedData);

    return product.id!;
  }
  // Future<String> createProduct(Product product) async {
  //   final ColorModel colores;
  //   final String id = 'hola';
  //   // late Product product2;
  //   // product2.id;
  //   final url = Uri.https(_baseUrl, 'Zapatos/${idProducto}.json');
  //   final resp = await http.post(url, body: product.toJson());
  //   final decodedData = json.decode(resp.body);

  //   product.id = decodedData['name'];
  //   this.products.add(product);
  //   // print(decodedData);

  //   return product.id!;
  // }

  void updateSelectedProductImage(String path) {
    this.selectedProduct.fotoUrl = path;
    this.newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dm4igy3sr/image/upload?upload_preset=lac2kx97');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath(
      'file',
      newPictureFile!.path,
    );

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    // print(resp.body);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      //print('Algo salio mal');
      //print(resp.body);
      return null;
    }

    this.newPictureFile = null;

    final respData = json.decode(resp.body);
    //print(respData);

    return respData['secure_url'];
  }
}
