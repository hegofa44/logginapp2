// To parse this JSON data, do
//
//     final tareasModel = tareasModelFromMap(jsonString);

import 'dart:convert';

class TareasModel {
  TareasModel({
    this.id,
    this.cantParesZapatos,
    this.color,
    this.costoTarea,
    this.fechaTarea,
    this.proveedor,
    this.referencia,
  });
  String? id;
  int? cantParesZapatos;
  String? color;
  double? costoTarea;
  String? fechaTarea;
  String? proveedor;
  String? referencia;

  factory TareasModel.fromJson(String str) =>
      TareasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TareasModel.fromMap(Map<String, dynamic> json) => TareasModel(
        cantParesZapatos: json["cantParesZapatos"],
        color: json["color"],
        costoTarea: json["costoTarea"],
        fechaTarea: json["fechaTarea"],
        proveedor: json["proveedor"],
        referencia: json["referencia"],
      );

  Map<String, dynamic> toMap() => {
        "cantParesZapatos": cantParesZapatos,
        "color": color,
        "costoTarea": costoTarea,
        "fechaTarea": fechaTarea,
        "proveedor": proveedor,
        "referencia": referencia,
      };
}
