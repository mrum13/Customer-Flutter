// To parse this JSON data, do
//
//     final volumeModel = volumeModelFromJson(jsonString);

import 'dart:convert';

VolumeModel volumeModelFromJson(String str) => VolumeModel.fromJson(json.decode(str));

String volumeModelToJson(VolumeModel data) => json.encode(data.toJson());

class VolumeModel {
    VolumeModel({
        required this.success,
        required this.data,
        required this.message,
    });

    bool success;
    List<VolumeData> data;
    String message;

    factory VolumeModel.fromJson(Map<String, dynamic> json) => VolumeModel(
        success: json["success"],
        data: List<VolumeData>.from(json["data"].map((x) => VolumeData.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class VolumeData {
    VolumeData({
        required this.id,
        required this.volume,
        required this.active,
        required this.createdAt,
        required this.updatedAt,
    });

    String id;
    int volume;
    bool active;
    DateTime createdAt;
    DateTime updatedAt;

    factory VolumeData.fromJson(Map<String, dynamic> json) => VolumeData(
        id: json["id"],
        volume: json["volume"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "volume": volume,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
