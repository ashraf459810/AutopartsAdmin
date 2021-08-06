// To parse this JSON data, do
//
//     final shipOrderDetails = shipOrderDetailsFromJson(jsonString);

import 'dart:convert';

ShipOrderDetails shipOrderDetailsFromJson(String str) =>
    ShipOrderDetails.fromJson(json.decode(str));

String shipOrderDetailsToJson(ShipOrderDetails data) =>
    json.encode(data.toJson());

class ShipOrderDetails {
  ShipOrderDetails({
    this.shipTodos,
    this.returnProductTodos,
    this.order,
  });

  List<ShipTodo> shipTodos;
  List<ReturnProductTodo> returnProductTodos;
  ShipOrderDetailsOrder order;

  factory ShipOrderDetails.fromJson(Map<String, dynamic> json) =>
      ShipOrderDetails(
        shipTodos: List<ShipTodo>.from(
            json["shipTodos"].map((x) => ShipTodo.fromJson(x))),
        returnProductTodos: List<ReturnProductTodo>.from(
            json["returnProductTodos"]
                .map((x) => ReturnProductTodo.fromJson(x))),
        order: ShipOrderDetailsOrder.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "shipTodos": List<dynamic>.from(shipTodos.map((x) => x.toJson())),
        "returnProductTodos":
            List<dynamic>.from(returnProductTodos.map((x) => x.toJson())),
        "order": order.toJson(),
      };
}

class ShipOrderDetailsOrder {
  ShipOrderDetailsOrder({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.attachments,
    this.customer,
    this.currentCartItems,
    this.status,
    this.fullPrice,
    this.deliverCountry,
    this.deliverCity,
    this.deliverStreet,
    this.deliverAdditionalAddress,
    this.deliverXLongitude,
    this.deliverYLatitude,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  String objectType;
  List<dynamic> attachments;
  PurpleCustomer customer;
  List<dynamic> currentCartItems;
  String status;
  double fullPrice;
  dynamic deliverCountry;
  dynamic deliverCity;
  dynamic deliverStreet;
  dynamic deliverAdditionalAddress;
  dynamic deliverXLongitude;
  dynamic deliverYLatitude;

  factory ShipOrderDetailsOrder.fromJson(Map<String, dynamic> json) =>
      ShipOrderDetailsOrder(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        customer: PurpleCustomer.fromJson(json["customer"]),
        currentCartItems:
            List<dynamic>.from(json["currentCartItems"].map((x) => x)),
        status: json["status"],
        fullPrice: json["fullPrice"].toDouble(),
        deliverCountry: json["deliverCountry"],
        deliverCity: json["deliverCity"],
        deliverStreet: json["deliverStreet"],
        deliverAdditionalAddress: json["deliverAdditionalAddress"],
        deliverXLongitude: json["deliverXLongitude"],
        deliverYLatitude: json["deliverYLatitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "customer": customer.toJson(),
        "currentCartItems": List<dynamic>.from(currentCartItems.map((x) => x)),
        "status": status,
        "fullPrice": fullPrice,
        "deliverCountry": deliverCountry,
        "deliverCity": deliverCity,
        "deliverStreet": deliverStreet,
        "deliverAdditionalAddress": deliverAdditionalAddress,
        "deliverXLongitude": deliverXLongitude,
        "deliverYLatitude": deliverYLatitude,
      };
}

class PurpleCustomer {
  PurpleCustomer({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.attachments,
    this.role,
    this.mobileNumber,
    this.fullName,
    this.email,
    this.roles,
    this.purchasesPoints,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  String objectType;
  List<dynamic> attachments;
  dynamic role;
  String mobileNumber;
  String fullName;
  String email;
  List<dynamic> roles;
  int purchasesPoints;

  factory PurpleCustomer.fromJson(Map<String, dynamic> json) => PurpleCustomer(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        role: json["role"],
        mobileNumber: json["mobileNumber"],
        fullName: json["fullName"],
        email: json["email"],
        roles: List<dynamic>.from(json["roles"].map((x) => x)),
        purchasesPoints: json["purchasesPoints"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "role": role,
        "mobileNumber": mobileNumber,
        "fullName": fullName,
        "email": email,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "purchasesPoints": purchasesPoints,
      };
}

class ReturnProductTodo {
  ReturnProductTodo({
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
  dynamic discount;
  dynamic customerAcceptedDiscount;
  bool productIsReturned;
  dynamic doneDate;
  VendorClass customer;
  VendorClass vendor;
  Item item;
  double transportCosts;
  dynamic amountToCollect;
  List<Note> notes;
  List<PaymentTodo> paymentTodos;

  factory ReturnProductTodo.fromJson(Map<String, dynamic> json) =>
      ReturnProductTodo(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        status: json["status"],
        reason: json["reason"],
        vendorGaveDiscount: json["vendorGaveDiscount"] == null
            ? null
            : json["vendorGaveDiscount"],
        discount: json["discount"],
        customerAcceptedDiscount: json["customerAcceptedDiscount"],
        productIsReturned: json["productIsReturned"] == null
            ? null
            : json["productIsReturned"],
        doneDate: json["doneDate"],
        customer: VendorClass.fromJson(json["customer"]),
        vendor: VendorClass.fromJson(json["vendor"]),
        item: Item.fromJson(json["item"]),
        transportCosts:
            json["transportCosts"] == null ? null : json["transportCosts"],
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
        "vendorGaveDiscount":
            vendorGaveDiscount == null ? null : vendorGaveDiscount,
        "discount": discount,
        "customerAcceptedDiscount": customerAcceptedDiscount,
        "productIsReturned":
            productIsReturned == null ? null : productIsReturned,
        "doneDate": doneDate,
        "customer": customer.toJson(),
        "vendor": vendor.toJson(),
        "item": item.toJson(),
        "transportCosts": transportCosts == null ? null : transportCosts,
        "amountToCollect": amountToCollect,
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
        "paymentTodos": List<dynamic>.from(paymentTodos.map((x) => x.toJson())),
      };
}

class VendorClass {
  VendorClass({
    this.id,
    this.fullName,
    this.mobileNumber,
    this.contactNumber,
  });

  int id;
  String fullName;
  String mobileNumber;
  String contactNumber;

  factory VendorClass.fromJson(Map<String, dynamic> json) => VendorClass(
        id: json["id"],
        fullName: json["fullName"],
        mobileNumber: json["mobileNumber"],
        contactNumber:
            json["contactNumber"] == null ? null : json["contactNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "mobileNumber": mobileNumber,
        "contactNumber": contactNumber == null ? null : contactNumber,
      };
}

class Item {
  Item({
    this.id,
    this.brand,
    this.car,
    this.product,
    this.order,
  });

  int id;
  Brand brand;
  Brand car;
  Product product;
  ItemOrder order;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        product: Product.fromJson(json["product"]),
        order: json["order"] == null ? null : ItemOrder.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand.toJson(),
        "car": car.toJson(),
        "product": product.toJson(),
        "order": order == null ? null : order.toJson(),
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

class ItemOrder {
  ItemOrder({
    this.id,
    this.customer,
  });

  int id;
  FluffyCustomer customer;

  factory ItemOrder.fromJson(Map<String, dynamic> json) => ItemOrder(
        id: json["id"],
        customer: FluffyCustomer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer": customer.toJson(),
      };
}

class FluffyCustomer {
  FluffyCustomer({
    this.fullName,
    this.mobileNumber,
  });

  String fullName;
  String mobileNumber;

  factory FluffyCustomer.fromJson(Map<String, dynamic> json) => FluffyCustomer(
        fullName: json["fullName"],
        mobileNumber: json["mobileNumber"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "mobileNumber": mobileNumber,
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
  VendorClass admin;
  String note;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        admin: VendorClass.fromJson(json["admin"]),
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
        amount: json["amount"].toDouble(),
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

class ShipTodo {
  ShipTodo({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.attachments,
    this.vendor,
    this.item,
    this.status,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  String objectType;
  List<dynamic> attachments;
  VendorClass vendor;
  Item item;
  String status;

  factory ShipTodo.fromJson(Map<String, dynamic> json) => ShipTodo(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        vendor: VendorClass.fromJson(json["vendor"]),
        item: Item.fromJson(json["item"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "vendor": vendor.toJson(),
        "item": item.toJson(),
        "status": status,
      };
}
