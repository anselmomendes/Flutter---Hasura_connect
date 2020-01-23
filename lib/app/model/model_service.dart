// To parse this JSON data, do
//
//     final modelService = modelServiceFromJson(jsonString);

import 'dart:convert';

ModelService modelServiceFromJson(String str) =>
    ModelService.fromJson(json.decode(str));

String modelServiceToJson(ModelService data) => json.encode(data.toJson());

class ModelService {
  int idPhone;
  int idCliente;
  int id;
  DateTime garantia;
  String descricao;
  DateTime data;

  ModelService({
    this.idPhone,
    this.idCliente,
    this.id,
    this.garantia,
    this.descricao,
    this.data,
  });

  factory ModelService.fromJson(Map<String, dynamic> json) => ModelService(
        idPhone: json["id_phone"],
        idCliente: json["id_cliente"],
        id: json["id"],
        garantia: DateTime.parse(json["garantia"]),
        descricao: json["descricao"],
        data: DateTime.parse(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id_phone": idPhone,
        "id_cliente": idCliente,
        "id": id,
        "garantia":
            "${garantia.year.toString().padLeft(4, '0')}-${garantia.month.toString().padLeft(2, '0')}-${garantia.day.toString().padLeft(2, '0')}",
        "descricao": descricao,
        "data":
            "${data.year.toString().padLeft(4, '0')}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}",
      };
}
