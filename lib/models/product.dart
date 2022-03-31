// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
  Product({
    this.id,
    this.referencia,
    this.descripcion,
    this.fechaCreacion = '02/03/2022',
    this.color,
    required this.disponible,
    this.fotoUrl,
    this.valorUnidad,
    // this.valorVenta,
  });

  String? id;
  String? referencia;
  String? descripcion;
  String fechaCreacion;
  String? color;
  bool disponible;
  String? fotoUrl;
  double? valorUnidad;
  // double? valorVenta = 0.0;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        // id: json["id"],
        referencia: json["referencia"],
        descripcion: json["descripcion"],
        fechaCreacion: json["fechaCreacion"],
        color: json["color"],
        disponible: json["disponible"],
        fotoUrl: json["fotoUrl"],
        valorUnidad: json["valorUnidad"].toDouble(),
        // valorVenta: json["valorVenta"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        // "id": id,
        "referencia": referencia,
        "descripcion": descripcion,
        "fechaCreacion": fechaCreacion,
        "color": color,
        "disponible": disponible,
        "fotoUrl": fotoUrl,
        "valorUnidad": valorUnidad,
        // "valorVenta": valorVenta,
      };

  Product copy() => Product(
        id: this.id,
        referencia: this.referencia,
        descripcion: this.descripcion,
        fechaCreacion: this.fechaCreacion,
        color: this.color,
        disponible: this.disponible,
        fotoUrl: this.fotoUrl,
        valorUnidad: this.valorUnidad,
        // valorVenta: this.valorVenta
      );
}

// // To parse this JSON data, do

// //     final product = productFromMap(jsonString);

// import 'dart:convert';

// class Product {
//   Product({
//     this.id,
//     this.referencia,
//     this.descripcion,
//     this.fechaCreacion,
//     this.color,
//     required this.disponible,
//     this.fotoUrl,
//     this.valorUnidad,
//     this.colores,
//     // this.valorVenta,
//   });

//   String? id;
//   String? referencia;
//   String? descripcion;
//   String? fechaCreacion;
//   String? color;
//   bool disponible;
//   String? fotoUrl;
//   double? valorUnidad;
//   Colores? colores;
//   // double? valorVenta = 0.0;

//   factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Product.fromMap(Map<String, dynamic> json) => Product(
//         // id: json["id"],
//         referencia: json["referencia"],
//         descripcion: json["descripcion"],
//         fechaCreacion: json["fechaCreacion"],
//         color: json["color"],
//         disponible: json["disponible"],
//         fotoUrl: json["fotoUrl"],
//         valorUnidad: json["valorUnidad"].toDouble(),
//         colores: Colores.fromMap(json["colores"]),
//         // valorVenta: json["valorVenta"].toDouble(),
//       );

//   Map<String, dynamic> toMap() => {
//         // "id": id,
//         "referencia": referencia,
//         "descripcion": descripcion,
//         "fechaCreacion": fechaCreacion,
//         "color": color,
//         "disponible": disponible,
//         "fotoUrl": fotoUrl,
//         "valorUnidad": valorUnidad,
//         "colores": colores!.toMap(),
//         // "valorVenta": valorVenta,
//       };

//   Product copy() => Product(
//         id: this.id,
//         referencia: this.referencia,
//         descripcion: this.descripcion,
//         fechaCreacion: this.fechaCreacion,
//         color: this.color,
//         disponible: this.disponible,
//         fotoUrl: this.fotoUrl,
//         valorUnidad: this.valorUnidad,
//         colores: this.colores,
//         // valorVenta: this.valorVenta
//       );
// }

// class Colores {
//   Colores({
//     this.comodin = 'colores',
//   });

//   String comodin;

//   factory Colores.fromJson(String str) => Colores.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Colores.fromMap(Map<String, dynamic> json) => Colores(
//         comodin: json["comodin"],
//       );

//   Map<String, dynamic> toMap() => {
//         "comodin": comodin,
//       };
// }
