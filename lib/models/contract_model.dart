// To parse this JSON data, do
//
//     final contractModel = contractModelFromJson(jsonString);

import 'dart:convert';

ContractModel contractModelFromJson(String str) =>
    ContractModel.fromJson(json.decode(str));

String contractModelToJson(ContractModel data) => json.encode(data.toJson());

class ContractModel {
  ContractModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<ContractData> data;
  String message;

  factory ContractModel.fromJson(Map<String, dynamic> json) => ContractModel(
        success: json["success"],
        data: List<ContractData>.from(
            json["data"].map((x) => ContractData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class ContractData {
  ContractData({
    required this.id,
    required this.name,
    required this.contractNumber,
    required this.tonnageRemaining,
  });

  String id;
  String name;
  String contractNumber;
  int tonnageRemaining;

  factory ContractData.fromJson(Map<String, dynamic> json) => ContractData(
        id: json["id"],
        name: json["name"],
        contractNumber: json["contract_number"],
        tonnageRemaining: json["tonnage_remaining"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contract_number": contractNumber,
        "tonnage_remaining": tonnageRemaining,
      };
}
