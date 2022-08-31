// To parse this JSON data, do
//
//     final listCompanyModel = listCompanyModelFromJson(jsonString);

import 'dart:convert';

ListCompanyModel listCompanyModelFromJson(String str) =>
    ListCompanyModel.fromJson(json.decode(str));

String listCompanyModelToJson(ListCompanyModel data) =>
    json.encode(data.toJson());

class ListCompanyModel {
  ListCompanyModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<ListCompanyData> data;
  String message;

  factory ListCompanyModel.fromJson(Map<String, dynamic> json) =>
      ListCompanyModel(
        success: json["success"],
        data: List<ListCompanyData>.from(
            json["data"].map((x) => ListCompanyData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class ListCompanyData {
  ListCompanyData({
    required this.id,
    required this.name,
    required this.status,
    required this.regencyName,
  });

  String id;
  String name;
  dynamic status;
  dynamic regencyName;

  factory ListCompanyData.fromJson(Map<String, dynamic> json) =>
      ListCompanyData(
        id: json["id"],
        name: json["name"],
        status: json["status"] == null ? "Null" : json["status"],
        regencyName: json["regency_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "regency_name": regencyName,
      };
}
