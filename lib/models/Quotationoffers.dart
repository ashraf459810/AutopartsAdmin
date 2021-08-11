// To parse this JSON data, do
//
//     final quotationOffers = quotationOffersFromJson(jsonString);

import 'dart:convert';

QuotationOffers quotationOffersFromJson(String str) =>
    QuotationOffers.fromJson(json.decode(str));

String quotationOffersToJson(QuotationOffers data) =>
    json.encode(data.toJson());

class QuotationOffers {
  QuotationOffers({
    this.content,
    this.pageable,
    this.last,
    this.totalPages,
    this.totalElements,
    this.sort,
    this.numberOfElements,
    this.first,
    this.size,
    this.number,
    this.empty,
  });

  List<Offers> content;
  Pageable pageable;
  bool last;
  int totalPages;
  int totalElements;
  Sort sort;
  int numberOfElements;
  bool first;
  int size;
  int number;
  bool empty;

  factory QuotationOffers.fromJson(Map<String, dynamic> json) =>
      QuotationOffers(
        content:
            List<Offers>.from(json["content"].map((x) => Offers.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        last: json["last"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        sort: Sort.fromJson(json["sort"]),
        numberOfElements: json["numberOfElements"],
        first: json["first"],
        size: json["size"],
        number: json["number"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
        "last": last,
        "totalPages": totalPages,
        "totalElements": totalElements,
        "sort": sort.toJson(),
        "numberOfElements": numberOfElements,
        "first": first,
        "size": size,
        "number": number,
        "empty": empty,
      };
}

class Offers {
  Offers({
    this.brandName,
    this.daysToDeliver,
    this.notes,
    this.carName,
    this.vendorName,
    this.fullPrice,
    this.type,
    this.productName,
    this.productCondition,
    this.ourPercentage,
    this.warrantyMonths,
    this.vendorMobile,
    this.price,
    this.id,
    this.productArabicName,
    this.status,
  });

  String brandName;
  int daysToDeliver;
  String notes;
  String carName;
  String vendorName;
  double fullPrice;
  String type;
  String productName;
  ProductCondition productCondition;
  double ourPercentage;
  double warrantyMonths;
  String vendorMobile;
  double price;
  int id;
  String productArabicName;
  String status;

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
        brandName: json["brandName"],
        daysToDeliver: json["daysToDeliver"],
        notes: json["notes"],
        carName: json["carName"],
        vendorName: json["vendorName"],
        fullPrice: json["fullPrice"].toDouble(),
        type: json["type"],
        productName: json["productName"],
        productCondition: ProductCondition.fromJson(json["productCondition"]),
        ourPercentage: json["ourPercentage"].toDouble(),
        warrantyMonths: json["warrantyMonths"],
        vendorMobile: json["vendorMobile"],
        price: json["price"].toDouble(),
        id: json["id"],
        productArabicName: json["productArabicName"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "brandName": brandName,
        "daysToDeliver": daysToDeliver,
        "notes": notes,
        "carName": carName,
        "vendorName": vendorName,
        "fullPrice": fullPrice,
        "type": type,
        "productName": productName,
        "productCondition": productCondition.toJson(),
        "ourPercentage": ourPercentage,
        "warrantyMonths": warrantyMonths,
        "vendorMobile": vendorMobile,
        "price": price,
        "id": id,
        "productArabicName": productArabicName,
        "status": status,
      };
}

class ProductCondition {
  ProductCondition({
    this.label,
    this.value,
  });

  String label;
  String value;

  factory ProductCondition.fromJson(Map<String, dynamic> json) =>
      ProductCondition(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}

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
