// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
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
    required this.idCustomer,
    required this.name,
    required this.point,
    required this.pastDueDays,
    required this.amountDueRemaining,
  });

  String idCustomer;
  String name;
  int point;
  int pastDueDays;
  int amountDueRemaining;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idCustomer: json["id_customer"],
        name: json["name"],
        point: json["point"],
        pastDueDays: json["past_due_days"],
        amountDueRemaining: json["amount_due_remaining"],
      );

  Map<String, dynamic> toJson() => {
        "id_customer": idCustomer,
        "name": name,
        "point": point,
        "past_due_days": pastDueDays,
        "amount_due_remaining": amountDueRemaining,
      };
}
