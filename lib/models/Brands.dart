// To parse this JSON data, do
//
//     final brands = brandsFromJson(jsonString);

import 'dart:convert';

List<Brands> brandsFromJson(String str) =>
    List<Brands>.from(json.decode(str).map((x) => Brands.fromJson(x)));

String brandsToJson(List<Brands> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Brands {
  Brands({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.attachments,
    this.name,
    this.code,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  Type objectType;
  List<Attachment> attachments;
  String name;
  String code;

  factory Brands.fromJson(Map<String, dynamic> json) => Brands(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: typeValues.map[json["objectType"]],
        attachments: List<Attachment>.from(
            json["attachments"].map((x) => Attachment.fromJson(x))),
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": typeValues.reverse[objectType],
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "name": name,
        "code": code,
      };
}

class Attachment {
  Attachment({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.attachments,
    this.tag,
    this.extension,
    this.path,
    this.publicUrl,
    this.ownerId,
    this.ownerType,
    this.linked,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  ObjectType objectType;
  List<dynamic> attachments;
  String tag;
  Extension extension;
  String path;
  String publicUrl;
  int ownerId;
  Type ownerType;
  bool linked;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: objectTypeValues.map[json["objectType"]],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        tag: json["tag"],
        extension: extensionValues.map[json["extension"]],
        path: json["path"],
        publicUrl: json["publicURL"],
        ownerId: json["ownerId"],
        ownerType: typeValues.map[json["ownerType"]],
        linked: json["linked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectTypeValues.reverse[objectType],
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "tag": tag,
        "extension": extensionValues.reverse[extension],
        "path": path,
        "publicURL": publicUrl,
        "ownerId": ownerId,
        "ownerType": typeValues.reverse[ownerType],
        "linked": linked,
      };
}

enum Extension { PNG, JPG }

final extensionValues =
    EnumValues({"jpg": Extension.JPG, "png": Extension.PNG});

enum ObjectType { ATTACHMENT }

final objectTypeValues = EnumValues({"Attachment": ObjectType.ATTACHMENT});

enum Type { BRAND }

final typeValues = EnumValues({"Brand": Type.BRAND});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
