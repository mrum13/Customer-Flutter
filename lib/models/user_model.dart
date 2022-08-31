// To parse required this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.id,
    required this.idUser,
    required this.name,
    required this.phone,
    required this.nik,
    required this.birthPlace,
    required this.birthDate,
    required this.address,
    required this.gender,
    required this.idProvince,
    required this.idRegency,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  int idUser;
  String name;
  String phone;
  dynamic nik;
  dynamic birthPlace;
  dynamic birthDate;
  dynamic address;
  String gender;
  dynamic idProvince;
  dynamic idRegency;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        idUser: json["id_user"],
        name: json["name"],
        phone: json["phone"],
        nik: json["nik"],
        birthPlace: json["birth_place"],
        birthDate: json["birth_date"],
        address: json["address"],
        gender: json["gender"],
        idProvince: json["id_province"],
        idRegency: json["id_regency"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "name": name,
        "phone": phone,
        "nik": nik,
        "birth_place": birthPlace,
        "birth_date": birthDate,
        "address": address,
        "gender": gender,
        "id_province": idProvince,
        "id_regency": idRegency,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
