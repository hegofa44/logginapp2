// To parse this JSON data, do
//
//     final sizeModel = sizeModelFromMap(jsonString);

import 'dart:convert';

class SizeModel {
  SizeModel({
    this.id,
    this.nombreTalla,
    this.paresTalla,
  });
  String? id;
  int? nombreTalla;
  int? paresTalla;

  factory SizeModel.fromJson(String str) => SizeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SizeModel.fromMap(Map<String, dynamic> json) => SizeModel(
        nombreTalla: json["nombreTalla"],
        paresTalla: json["paresTalla"],
      );

  Map<String, dynamic> toMap() => {
        "nombreTalla": nombreTalla,
        "paresTalla": paresTalla,
      };
}
