// To parse this JSON data, do
//
//     final returnRequestModel = returnRequestModelFromJson(jsonString);

import 'dart:convert';

ReturnRequestModel returnRequestModelFromJson(String str) =>
    ReturnRequestModel.fromJson(json.decode(str));

String returnRequestModelToJson(ReturnRequestModel data) =>
    json.encode(data.toJson());

class ReturnRequestModel {
  ReturnRequestModel({
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
    this.customer,
    this.vendor,
    this.item,
    this.transportCosts,
    this.amountToCollect,
    this.notes,
    this.paymentTodos,
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
  dynamic vendorGaveDiscount;
  dynamic discount;
  dynamic customerAcceptedDiscount;
  dynamic productIsReturned;
  dynamic doneDate;
  Customer customer;
  Customer vendor;
  Item item;
  dynamic transportCosts;
  dynamic amountToCollect;
  List<dynamic> notes;
  List<dynamic> paymentTodos;

  factory ReturnRequestModel.fromJson(Map<String, dynamic> json) =>
      ReturnRequestModel(
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
        customer: Customer.fromJson(json["customer"]),
        vendor: Customer.fromJson(json["vendor"]),
        item: Item.fromJson(json["item"]),
        transportCosts: json["transportCosts"],
        amountToCollect: json["amountToCollect"],
        notes: List<dynamic>.from(json["notes"].map((x) => x)),
        paymentTodos: List<dynamic>.from(json["paymentTodos"].map((x) => x)),
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
        "customer": customer.toJson(),
        "vendor": vendor.toJson(),
        "item": item.toJson(),
        "transportCosts": transportCosts,
        "amountToCollect": amountToCollect,
        "notes": List<dynamic>.from(notes.map((x) => x)),
        "paymentTodos": List<dynamic>.from(paymentTodos.map((x) => x)),
      };
}

class Customer {
  Customer({
    this.id,
    this.fullName,
    this.mobileNumber,
  });

  int id;
  String fullName;
  String mobileNumber;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        fullName: json["fullName"],
        mobileNumber: json["mobileNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "mobileNumber": mobileNumber,
      };
}

class Item {
  Item({
    this.id,
    this.brand,
    this.car,
    this.product,
  });

  int id;
  Brand brand;
  Brand car;
  Product product;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand.toJson(),
        "car": car.toJson(),
        "product": product.toJson(),
      };
}

class Brand {
  Brand({
    this.name,
  });

  String name;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Product {
  Product({
    this.name,
    this.arabicName,
  });

  String name;
  String arabicName;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        arabicName: json["arabicName"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "arabicName": arabicName,
      };
}