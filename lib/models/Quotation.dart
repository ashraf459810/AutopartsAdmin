// To parse this JSON data, do
//
//     final quotation = quotationFromJson(jsonString);

import 'dart:convert';

Quotation quotationFromJson(String str) => Quotation.fromJson(json.decode(str));

String quotationToJson(Quotation data) => json.encode(data.toJson());

class Quotation {
  Quotation({
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

  List<QuotationsRequests> content;
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

  factory Quotation.fromJson(Map<String, dynamic> json) => Quotation(
        content: List<QuotationsRequests>.from(
            json["content"].map((x) => QuotationsRequests.fromJson(x))),
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

class QuotationsRequests {
  QuotationsRequests({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.attachments,
    this.customer,
    this.brand,
    this.car,
    this.products,
    this.year,
    this.status,
    this.carClass,
    this.productQuality,
    this.type,
    this.notes,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  ObjectType objectType;
  List<dynamic> attachments;
  Customer customer;
  Brand brand;
  Brand car;
  List<Brand> products;
  String year;
  String status;
  CarClass carClass;
  CarClass productQuality;
  Type type;
  String notes;

  factory QuotationsRequests.fromJson(Map<String, dynamic> json) =>
      QuotationsRequests(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: objectTypeValues.map[json["objectType"]],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        customer: Customer.fromJson(json["customer"]),
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        products:
            List<Brand>.from(json["products"].map((x) => Brand.fromJson(x))),
        year: json["year"],
        status: json["status"],
        carClass: CarClass.fromJson(json["carClass"]),
        productQuality: json["productQuality"] == null
            ? null
            : CarClass.fromJson(json["productQuality"]),
        type: typeValues.map[json["type"]],
        notes: json["notes"] == null ? null : json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectTypeValues.reverse[objectType],
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "customer": customer.toJson(),
        "brand": brand.toJson(),
        "car": car.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "year": year,
        "status": status,
        "carClass": carClass.toJson(),
        "productQuality":
            productQuality == null ? null : productQuality.toJson(),
        "type": typeValues.reverse[type],
        "notes": notes == null ? null : notes,
      };
}

class Brand {
  Brand({
    this.id,
    this.name,
    this.code,
    this.brand,
    this.arabicName,
  });

  int id;
  String name;
  String code;
  Brand brand;
  String arabicName;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        arabicName: json["arabicName"] == null ? null : json["arabicName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "brand": brand == null ? null : brand.toJson(),
        "arabicName": arabicName == null ? null : arabicName,
      };
}

class CarClass {
  CarClass({
    this.label,
    this.value,
  });

  String label;
  String value;

  factory CarClass.fromJson(Map<String, dynamic> json) => CarClass(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
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

enum FullName { WAEL_NAHHAS, CUSTOMER, TESTING }

final fullNameValues = EnumValues({
  "customer": FullName.CUSTOMER,
  "testing ": FullName.TESTING,
  "wael Nahhas ": FullName.WAEL_NAHHAS
});

enum ObjectType { REQUEST_FOR_QUOTATION }

final objectTypeValues =
    EnumValues({"RequestForQuotation": ObjectType.REQUEST_FOR_QUOTATION});

enum Type { NEW, USED }

final typeValues = EnumValues({"NEW": Type.NEW, "USED": Type.USED});

class Pageable {
  Pageable({
    this.sort,
    this.pageNumber,
    this.pageSize,
    this.offset,
    this.unpaged,
    this.paged,
  });

  Sort sort;
  int pageNumber;
  int pageSize;
  int offset;
  bool unpaged;
  bool paged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        offset: json["offset"],
        unpaged: json["unpaged"],
        paged: json["paged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort.toJson(),
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "offset": offset,
        "unpaged": unpaged,
        "paged": paged,
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
