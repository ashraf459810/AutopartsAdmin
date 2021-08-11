// To parse this JSON data, do
//
//     final cars = carsFromJson(jsonString);

import 'dart:convert';

List<Cars> carsFromJson(String str) =>
    List<Cars>.from(json.decode(str).map((x) => Cars.fromJson(x)));

String carsToJson(List<Cars> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cars {
  Cars({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.name,
    this.code,
    this.brand,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  String objectType;
  String name;
  String code;
  Cars brand;

  factory Cars.fromJson(Map<String, dynamic> json) => Cars(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        name: json["name"],
        code: json["code"],
        brand: json["brand"] == null ? null : Cars.fromJson(json["brand"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "name": name,
        "code": code,
        "brand": brand == null ? null : brand.toJson(),
      };
}
