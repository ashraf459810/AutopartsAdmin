// To parse this JSON data, do
//
//     final getAllReturn = getAllReturnFromJson(jsonString);

import 'dart:convert';

GetAllReturn getAllReturnFromJson(String str) =>
    GetAllReturn.fromJson(json.decode(str));

String getAllReturnToJson(GetAllReturn data) => json.encode(data.toJson());

class GetAllReturn {
  GetAllReturn({
    this.content,
    this.pageable,
    this.last,
    this.totalPages,
    this.totalElements,
    this.size,
    this.number,
    this.sort,
    this.numberOfElements,
    this.first,
    this.empty,
  });

  List<Content> content;
  Pageable pageable;
  bool last;
  int totalPages;
  int totalElements;
  int size;
  int number;
  Sort sort;
  int numberOfElements;
  bool first;
  bool empty;

  factory GetAllReturn.fromJson(Map<String, dynamic> json) => GetAllReturn(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        last: json["last"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        size: json["size"],
        number: json["number"],
        sort: Sort.fromJson(json["sort"]),
        numberOfElements: json["numberOfElements"],
        first: json["first"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
        "last": last,
        "totalPages": totalPages,
        "totalElements": totalElements,
        "size": size,
        "number": number,
        "sort": sort.toJson(),
        "numberOfElements": numberOfElements,
        "first": first,
        "empty": empty,
      };
}

class Content {
  Content({
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
  Customer customer;
  Customer vendor;
  Item item;
  double transportCosts;
  dynamic amountToCollect;
  List<Note> notes;
  List<PaymentTodo> paymentTodos;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
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
        customer: Customer.fromJson(json["customer"]),
        vendor: Customer.fromJson(json["vendor"]),
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
        // admin: Customer.fromJson(json["admin"]),
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

class Pageable {
  Pageable({
    this.sort,
    this.pageNumber,
    this.pageSize,
    this.offset,
    this.paged,
    this.unpaged,
  });

  Sort sort;
  int pageNumber;
  int pageSize;
  int offset;
  bool paged;
  bool unpaged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        offset: json["offset"],
        paged: json["paged"],
        unpaged: json["unpaged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort.toJson(),
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "offset": offset,
        "paged": paged,
        "unpaged": unpaged,
      };
}

class Sort {
  Sort({
    this.sorted,
    this.unsorted,
    this.empty,
  });

  bool sorted;
  bool unsorted;
  bool empty;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        sorted: json["sorted"],
        unsorted: json["unsorted"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "sorted": sorted,
        "unsorted": unsorted,
        "empty": empty,
      };
}
