// To parse this JSON data, do
//
//     final vendorAcceptDiscount = vendorAcceptDiscountFromJson(jsonString);

import 'dart:convert';

ReturnProcessModel vendorAcceptDiscountFromJson(String str) =>
    ReturnProcessModel.fromJson(json.decode(str));

String vendorAcceptDiscountToJson(ReturnProcessModel data) =>
    json.encode(data.toJson());

class ReturnProcessModel {
  ReturnProcessModel({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.attachments,
    this.status,
    this.reason,
    this.vendorGaveDiscount,
    this.discount,
    this.customerAcceptedDiscount,
    this.productIsReturned,
    this.doneDate,
    this.transportCosts,
    this.customer,
    this.vendor,
    this.item,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  String objectType;
  List<dynamic> attachments;
  String status;
  String reason;
  bool vendorGaveDiscount;
  int discount;
  dynamic customerAcceptedDiscount;
  dynamic productIsReturned;
  dynamic doneDate;
  dynamic transportCosts;
  Customer customer;
  Customer vendor;
  Item item;

  factory ReturnProcessModel.fromJson(Map<String, dynamic> json) =>
      ReturnProcessModel(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        status: json["status"],
        reason: json["reason"],
        vendorGaveDiscount: json["vendorGaveDiscount"],
        discount: json["discount"],
        customerAcceptedDiscount: json["customerAcceptedDiscount"],
        productIsReturned: json["productIsReturned"],
        doneDate: json["doneDate"],
        transportCosts: json["transportCosts"],
        customer: Customer.fromJson(json["customer"]),
        vendor: Customer.fromJson(json["vendor"]),
        item: Item.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "status": status,
        "reason": reason,
        "vendorGaveDiscount": vendorGaveDiscount,
        "discount": discount,
        "customerAcceptedDiscount": customerAcceptedDiscount,
        "productIsReturned": productIsReturned,
        "doneDate": doneDate,
        "transportCosts": transportCosts,
        "customer": customer.toJson(),
        "vendor": vendor.toJson(),
        "item": item.toJson(),
      };
}

class Customer {
  Customer({
    this.id,
    this.fullName,
  });

  int id;
  String fullName;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
      };
}

class Item {
  Item({
    this.id,
  });

  int id;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
