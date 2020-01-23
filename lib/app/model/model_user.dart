// To parse this JSON data, do
//
//     final modelUser = modelUserFromJson(jsonString);

import 'dart:convert';

ModelUser modelUserFromJson(String str) => ModelUser.fromJson(json.decode(str));

String modelUserToJson(ModelUser data) => json.encode(data.toJson());

class ModelUser {
  DateTime dataDeNascimento;
  int id;
  String nome;
  String sobrenome;

  ModelUser({
    this.dataDeNascimento,
    this.id,
    this.nome,
    this.sobrenome,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
        dataDeNascimento: DateTime.parse(json["data_de_nascimento"]),
        id: json["id"],
        nome: json["nome"],
        sobrenome: json["sobrenome"],
      );

  Map<String, dynamic> toJson() => {
        "data_de_nascimento":
            "${dataDeNascimento.year.toString().padLeft(4, '0')}-${dataDeNascimento.month.toString().padLeft(2, '0')}-${dataDeNascimento.day.toString().padLeft(2, '0')}",
        "id": id,
        "nome": nome,
        "sobrenome": sobrenome,
      };
}
