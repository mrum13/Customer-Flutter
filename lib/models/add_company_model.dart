// To parse this JSON data, do
//
//     final addCompanyModel = addCompanyModelFromJson(jsonString);

import 'dart:convert';

AddCompanyModel addCompanyModelFromJson(String str) =>
    AddCompanyModel.fromJson(json.decode(str));

String addCompanyModelToJson(AddCompanyModel data) =>
    json.encode(data.toJson());

class AddCompanyModel {
  AddCompanyModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  AddCompanyData data;
  String message;

  factory AddCompanyModel.fromJson(Map<String, dynamic> json) =>
      AddCompanyModel(
        success: json["success"],
        data: AddCompanyData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class AddCompanyData {
  AddCompanyData({
    required this.idCustomerUser,
    required this.idCustomer,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });

  String idCustomerUser;
  String idCustomer;
  String id;
  DateTime updatedAt;
  DateTime createdAt;

  factory AddCompanyData.fromJson(Map<String, dynamic> json) => AddCompanyData(
        idCustomerUser: json["id_customer_user"],
        idCustomer: json["id_customer"],
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_customer_user": idCustomerUser,
        "id_customer": idCustomer,
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}
