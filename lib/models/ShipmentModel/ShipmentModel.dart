// To parse this JSON data, do
//
//     final shipmentModel = shipmentModelFromJson(jsonString);

import 'dart:convert';

ShipmentModel shipmentModelFromJson(String str) =>
    ShipmentModel.fromJson(json.decode(str));

String shipmentModelToJson(ShipmentModel data) => json.encode(data.toJson());

class ShipmentModel {
  ShipmentModel({
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

  List<Shipments> content;
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

  factory ShipmentModel.fromJson(Map<String, dynamic> json) => ShipmentModel(
        content: List<Shipments>.from(
            json["content"].map((x) => Shipments.fromJson(x))),
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

class Shipments {
  Shipments({
    this.id,
    this.customerName,
    this.status,
  });

  int id;

  String customerName;
  String status;

  factory Shipments.fromJson(Map<String, dynamic> json) => Shipments(
        id: json["id"],
        customerName: json["customerName"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customerName": customerName,
        "status": status,
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
