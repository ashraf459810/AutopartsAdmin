// To parse this JSON data, do
//
//     final dueOrders = dueOrdersFromJson(jsonString);

import 'dart:convert';

DueOrders dueOrdersFromJson(String str) => DueOrders.fromJson(json.decode(str));

String dueOrdersToJson(DueOrders data) => json.encode(data.toJson());

class DueOrders {
    DueOrders({
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

    List<Content> content;
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

    factory DueOrders.fromJson(Map<String, dynamic> json) => DueOrders(
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
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

class Content {
    Content({
        this.fullName,
        this.vendorId,
        this.amount,
        this.orderId,
    });

    String fullName;
    int vendorId;
    int amount;
    int orderId;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        fullName: json["fullName"],
        vendorId: json["vendorId"],
        amount: json["amount"],
        orderId: json["orderId"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "vendorId": vendorId,
        "amount": amount,
        "orderId": orderId,
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
