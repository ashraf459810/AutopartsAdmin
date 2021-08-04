// To parse this JSON data, do
//
//     final addNote = addNoteFromJson(jsonString);

import 'dart:convert';

AddNote addNoteFromJson(String str) => AddNote.fromJson(json.decode(str));

String addNoteToJson(AddNote data) => json.encode(data.toJson());

class AddNote {
  AddNote({
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
  bool vendorGaveDiscount;
  double discount;
  bool customerAcceptedDiscount;
  bool productIsReturned;
  DateTime doneDate;
  Customer customer;
  Customer vendor;
  Item item;
  double transportCosts;
  dynamic amountToCollect;
  List<Note> notes;
  List<PaymentTodo> paymentTodos;

  factory AddNote.fromJson(Map<String, dynamic> json) => AddNote(
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
        customer: Customer.fromJson(json["customer"]),
        vendor: Customer.fromJson(json["vendor"]),
        item: Item.fromJson(json["item"]),
        transportCosts: json["transportCosts"],
        amountToCollect: json["amountToCollect"],
        notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
        paymentTodos: List<PaymentTodo>.from(
            json["paymentTodos"].map((x) => PaymentTodo.fromJson(x))),
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
        "doneDate": doneDate.toIso8601String(),
        "customer": customer.toJson(),
        "vendor": vendor.toJson(),
        "item": item.toJson(),
        "transportCosts": transportCosts,
        "amountToCollect": amountToCollect,
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
        "paymentTodos": List<dynamic>.from(paymentTodos.map((x) => x.toJson())),
      };
}

class Customer {
  Customer({
    this.id,
    this.fullName,
    this.mobileNumber,
  });

  int id;
  FullName fullName;
  String mobileNumber;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        fullName: fullNameValues.map[json["fullName"]],
        mobileNumber: json["mobileNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullNameValues.reverse[fullName],
        "mobileNumber": mobileNumber,
      };
}

enum FullName { ASHRAAS, ASDAASD, VENDOR }

final fullNameValues = EnumValues({
  "asdaasd": FullName.ASDAASD,
  "ashraas": FullName.ASHRAAS,
  "vendor": FullName.VENDOR
});

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

class Note {
  Note({
    this.id,
    this.admin,
    this.note,
  });

  int id;
  Customer admin;
  String note;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        admin: Customer.fromJson(json["admin"]),
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin": admin.toJson(),
        "note": note,
      };
}

class PaymentTodo {
  PaymentTodo({
    this.id,
    this.fromSide,
    this.toSide,
    this.status,
    this.amount,
    this.invoiceNumber,
  });

  int id;
  String fromSide;
  String toSide;
  String status;
  double amount;
  String invoiceNumber;

  factory PaymentTodo.fromJson(Map<String, dynamic> json) => PaymentTodo(
        id: json["id"],
        fromSide: json["fromSide"],
        toSide: json["toSide"],
        status: json["status"],
        amount: json["amount"],
        invoiceNumber: json["invoiceNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fromSide": fromSide,
        "toSide": toSide,
        "status": status,
        "amount": amount,
        "invoiceNumber": invoiceNumber,
      };
}

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
