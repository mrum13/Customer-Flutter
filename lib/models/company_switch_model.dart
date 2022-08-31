// To parse this JSON data, do
//
//     final companySwitchModel = companySwitchModelFromJson(jsonString);

import 'dart:convert';

CompanySwitchModel companySwitchModelFromJson(String str) =>
    CompanySwitchModel.fromJson(json.decode(str));

String companySwitchModelToJson(CompanySwitchModel data) =>
    json.encode(data.toJson());

class CompanySwitchModel {
  CompanySwitchModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<CompanyData> data;
  String message;

  factory CompanySwitchModel.fromJson(Map<String, dynamic> json) =>
      CompanySwitchModel(
        success: json["success"],
        data: List<CompanyData>.from(
            json["data"].map((x) => CompanyData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class CompanyData {
  CompanyData({
    required this.id,
    required this.name,
    required this.status,
    required this.active,
    required this.regencyName,
  });

  String id;
  String name;
  dynamic status;
  bool active;
  dynamic regencyName;

  factory CompanyData.fromJson(Map<String, dynamic> json) => CompanyData(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        active: json["active"],
        regencyName: json["regency_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "active": active,
        "regency_name": regencyName,
      };
}
