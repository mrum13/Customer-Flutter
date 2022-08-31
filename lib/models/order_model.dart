// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
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
    required this.idContract,
    required this.idCustomer,
    required this.volume,
    required this.unloadDate,
    required this.unloadTime,
    required this.year,
    required this.index,
    required this.code,
    required this.idCustomerUser,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });

  String idContract;
  String idCustomer;
  String volume;
  DateTime unloadDate;
  String unloadTime;
  String year;
  int index;
  String code;
  String idCustomerUser;
  String id;
  DateTime updatedAt;
  DateTime createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idContract: json["id_contract"],
        idCustomer: json["id_customer"],
        volume: json["volume"],
        unloadDate: DateTime.parse(json["unload_date"]),
        unloadTime: json["unload_time"],
        year: json["year"],
        index: json["index"],
        code: json["code"],
        idCustomerUser: json["id_customer_user"],
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_contract": idContract,
        "id_customer": idCustomer,
        "volume": volume,
        "unload_date":
            "${unloadDate.year.toString().padLeft(4, '0')}-${unloadDate.month.toString().padLeft(2, '0')}-${unloadDate.day.toString().padLeft(2, '0')}",
        "unload_time": unloadTime,
        "year": year,
        "index": index,
        "code": code,
        "id_customer_user": idCustomerUser,
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}
