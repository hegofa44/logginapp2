import 'package:flutter/material.dart';
import 'dart:convert';

import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:logginapp2/models/tareasModel.dart';

class TareasService extends ChangeNotifier {
  final String _url =
      'https://flutter-varios2-2d54a-default-rtdb.firebaseio.com';
  final String _baseUrl = 'flutter-varios2-2d54a-default-rtdb.firebaseio.com';

  String _idProducto = '';
  File? newPictureFile;

  get idProducto {
    return _idProducto;
  }

  set idProducto(nombre) {
    this._idProducto = nombre;
    notifyListeners();
  }

  final List<TareasModel> tareas = [];

  late TareasModel selectedTarea;

  bool isLoading = true;
  bool isSaving = false;

  // ColorsService() {
  //   this.loadColors();
  // }

  // Future<List<ColorModel>> loadColors() async {
  //   this.isLoading = true;
  //   notifyListeners();

  //   final urlCompleta = Uri.https(_url, 'Zapatos.json');
  //   final resp = await http.get(urlCompleta);

  //   if (json.decode(resp.body) == null) return [];

  //   final Map<String, dynamic> colorsMap = json.decode(resp.body);

  //   colorsMap.forEach((key, value) {
  //     final tempColor = ColorModel.fromJson(value);
  //     tempColor.id = key;
  //     this.colors.add(tempColor);
  //   });

  //   this.isLoading = false;
  //   notifyListeners();

  //   return this.colors;
  // }

  Future<List<TareasModel>> cargarTareas(String _id) async {
    final url = '$_url/Tareas.json';
    final resp = await http.get(Uri.parse(url));
    //print(url);
    //print(json.decode(resp.body));
    if (json.decode(resp.body) != null) {
      final Map<String, dynamic> decodedData = json.decode(resp.body);
      // if (decodedData == null) return [];
      final List<TareasModel> tareas = [];

      // if (decodedData == null) return [];

      decodedData.forEach((id, tar) {
        final tarTemp = TareasModel.fromMap(tar);
        tarTemp.id = id;

        tareas.add(tarTemp);
      });
      // print(url);
      return tareas;
    } else {
      return [];
    }
  }

  //Metodo de hacer interacciones con Firebase (Crear y actualizar)
  // final String id = 'hola';
  Future saveOrCreateTarea(TareasModel tarea) async {
    isSaving = true;
    notifyListeners();

    if (tarea.id == null) {
      //Crear
      await this.createTarea(tarea);
    } else {
      //Actualizar
      await this.updateTarea(tarea);
    }

    isSaving = false;
    notifyListeners();
  }

  // Peticion para actualizar Colores

  Future<String> updateTarea(TareasModel tarea) async {
    final urlCompleta = Uri.https(_baseUrl, 'Tareas/${tarea.id}.json');
    final resp = await http.put(urlCompleta, body: tarea.toJson());
    final decodedData = resp.body;

    // print(decodedData);

    final index = this.tareas.indexWhere((element) => element.id == tarea.id);
    this.tareas[index] = tarea;

    return tarea.id!;
  }

  //NUEVO Color
  Future<String> createTarea(TareasModel tarea) async {
    // final ColorModel colores;
    // final String id = 'hola';
    // late Product product2;
    // product2.id;
    final urlCompleta = Uri.https(_baseUrl, 'Tareas.json');
    final resp = await http.post(urlCompleta, body: tarea.toJson());
    final decodedData = json.decode(resp.body);
    print(json.decode(resp.body));
    tarea.id = decodedData['name'];
    this.tareas.add(tarea);
    // print(decodedData);

    return tarea.id!;
  }

  // void updateSelectedColorImage(String path) {
  //   this.selectedColor.fotoColor = path;
  //   this.newPictureFile = File.fromUri(Uri(path: path));
  //   notifyListeners();
  // }

  // Cargar Imagenes CloudDinary
  // Future<String?> uploadImage() async {
  //   if (this.newPictureFile == null) return null;

  //   this.isSaving = true;
  //   notifyListeners();

  //   final url = Uri.parse(
  //       'https://api.cloudinary.com/v1_1/dm4igy3sr/image/upload?upload_preset=lac2kx97');

  //   final imageUploadRequest = http.MultipartRequest('POST', url);

  //   final file = await http.MultipartFile.fromPath(
  //     'file',
  //     newPictureFile!.path,
  //   );

  //   imageUploadRequest.files.add(file);

  //   final streamResponse = await imageUploadRequest.send();
  //   final resp = await http.Response.fromStream(streamResponse);
  //   // print(resp.body);
  //   if (resp.statusCode != 200 && resp.statusCode != 201) {
  //     //print('Algo salio mal');
  //     //print(resp.body);
  //     return null;
  //   }

  //   this.newPictureFile = null;

  //   final respData = json.decode(resp.body);
  //   //print(respData);

  //   return respData['secure_url'];
  // }
}


// import 'package:flutter/material.dart';
// import 'dart:convert';
// // import 'dart:html';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// // import 'package:mime_type/mime_type.dart';
// // import 'package:http_parser/http_parser.dart';
// import 'package:logginapp2/models/colors.dart';

// class ColorsService extends ChangeNotifier{
//   final String _url =
//       'https://flutter-varios2-2d54a-default-rtdb.firebaseio.com';
  
//   String _idProducto = '';
//   File? newPictureFile;

//   get idProducto {
//     return _idProducto;
//   }

//   set idProducto(nombre) {
//     this._idProducto = nombre;
//     notifyListeners();
//   }

//   Future<List<ColorModel>> cargarProductos(String _id) async {
//     final url = '$_url/Zapatos/$_id/colores.json';
//     final resp = await http.get(Uri.parse(url));
//     //print(url);
//     //print(json.decode(resp.body));
//     if (json.decode(resp.body) != null) {
//       final Map<String, dynamic> decodedData = json.decode(resp.body);
//       // if (decodedData == null) return [];
//       final List<ColorModel> colors = [];

//       // if (decodedData == null) return [];

//       decodedData.forEach((id, col) {
//         final colTemp = ColorModel.fromJson(col);
//         colTemp.id = id;

//         colors.add(colTemp);
//       });
//       // print(url);
//       return colors;
//     } else {
//       return [];
//     }
//   }

  
// }
