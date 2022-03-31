// To parse this JSON data, do
//
//     final color = colorFromMap(jsonString);

import 'dart:convert';

class ColorModel {
  ColorModel({
    this.id,
    this.fotoColor,
    this.nombreColor,
  });
  String? id;
  String? fotoColor;
  String? nombreColor;

  factory ColorModel.fromJson(String str) =>
      ColorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ColorModel.fromMap(Map<String, dynamic> json) => ColorModel(
        fotoColor: json["fotoColor"],
        nombreColor: json["nombreColor"],
      );

  Map<String, dynamic> toMap() => {
        "fotoColor": fotoColor,
        "nombreColor": nombreColor,
      };
}
