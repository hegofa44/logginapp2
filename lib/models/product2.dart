// // To parse this JSON data, do
// //
// //     final product = productFromMap(jsonString);

// import 'dart:convert';

// class Product {
//     Product({
//         this.colores,
//         this.descripcion,
//         this.disponible,
//         this.fechaCreacion,
//         this.fotoUrl,
//         this.referencia,
//         this.valorUnidad,
//     });

//     Colores? colores;
//     String? descripcion;
//     bool disponible;
//     String? fechaCreacion;
//     String? fotoUrl;
//     String? referencia;
//     double? valorUnidad;

//     factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Product.fromMap(Map<String, dynamic> json) => Product(
//         colores: Colores.fromMap(json["colores"]),
//         descripcion: json["descripcion"],
//         disponible: json["disponible"],
//         fechaCreacion: json["fechaCreacion"],
//         fotoUrl: json["fotoUrl"],
//         referencia: json["referencia"],
//         valorUnidad: json["valorUnidad"].toDouble(),
//     );

//     Map<String, dynamic> toMap() => {
//         "colores": colores!.toMap(),
//         "descripcion": descripcion,
//         "disponible": disponible,
//         "fechaCreacion": fechaCreacion,
//         "fotoUrl": fotoUrl,
//         "referencia": referencia,
//         "valorUnidad": valorUnidad,
//     };
// }

// class Colores {
//     Colores({
//         this.comodin,
//         this.tallas,
//     });

//     String comodin;
//     Tallas tallas;

//     factory Colores.fromJson(String str) => Colores.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Colores.fromMap(Map<String, dynamic> json) => Colores(
//         comodin: json["comodin"],
//         tallas: Tallas.fromMap(json["tallas"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "comodin": comodin,
//         "tallas": tallas.toMap(),
//     };
// }

// class Tallas {
//     Tallas({
//         this.comodin,
//     });

//     String comodin;

//     factory Tallas.fromJson(String str) => Tallas.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Tallas.fromMap(Map<String, dynamic> json) => Tallas(
//         comodin: json["comodin"],
//     );

//     Map<String, dynamic> toMap() => {
//         "comodin": comodin,
//     };
// }
