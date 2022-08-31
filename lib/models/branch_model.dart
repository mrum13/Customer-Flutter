// To parse this JSON data, do
//
//     final branchModel = branchModelFromJson(jsonString);

import 'dart:convert';

BranchModel branchModelFromJson(String str) =>
    BranchModel.fromJson(json.decode(str));

String branchModelToJson(BranchModel data) => json.encode(data.toJson());

class BranchModel {
  BranchModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<BranchData> data;
  String message;

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        success: json["success"],
        data: List<BranchData>.from(
            json["data"].map((x) => BranchData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class BranchData {
  BranchData({
    required this.id,
    required this.code,
    required this.name,
    required this.address,
    required this.phone,
    required this.fax,
    required this.city,
    required this.idCompany,
    required this.company,
    required this.index,
    required this.idRegion,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  dynamic code;
  dynamic name;
  dynamic address;
  dynamic phone;
  dynamic fax;
  dynamic city;
  dynamic idCompany;
  dynamic company;
  dynamic index;
  dynamic idRegion;
  DateTime createdAt;
  DateTime updatedAt;

  factory BranchData.fromJson(Map<String, dynamic> json) => BranchData(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        fax: json["fax"],
        city: json["city"],
        idCompany: json["id_company"],
        company: json["company"],
        index: json["index"],
        idRegion: json["id_region"] == null ? "-" : json["id_region"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "address": address,
        "phone": phone,
        "fax": fax,
        "city": city,
        "id_company": idCompany,
        "company": company,
        "index": index,
        "id_region": idRegion == null ? "-" : idRegion,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
