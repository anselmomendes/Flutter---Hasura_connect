// To parse this JSON data, do
//
//     final modelPhone = modelPhoneFromJson(jsonString);

import 'dart:convert';

ModelPhone modelPhoneFromJson(String str) =>
    ModelPhone.fromJson(json.decode(str));

String modelPhoneToJson(ModelPhone data) => json.encode(data.toJson());

class ModelPhone {
  int id;
  String marca;
  String modelo;
  String nick;

  ModelPhone({
    this.id,
    this.marca,
    this.modelo,
    this.nick,
  });

  factory ModelPhone.fromJson(Map<String, dynamic> json) => ModelPhone(
        id: json["id"],
        marca: json["marca"],
        modelo: json["modelo"],
        nick: json["nick"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "marca": marca,
        "modelo": modelo,
        "nick": nick,
      };
}
