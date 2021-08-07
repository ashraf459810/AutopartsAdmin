import 'dart:convert';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}

class NoInternet extends AppException {
  NoInternet([String message]) : super(message, "Check your Internet");
}

class InternalServerError extends AppException {
  InternalServerError([String message]) : super(message, "");
}

// To parse this JSON data, do
//
//     final enternalServerError = enternalServerErrorFromJson(jsonString);

EnternalServerError enternalServerErrorFromJson(String str) =>
    EnternalServerError.fromJson(json.decode(str));

String enternalServerErrorToJson(EnternalServerError data) =>
    json.encode(data.toJson());

class EnternalServerError {
  EnternalServerError({
    this.path,
    this.time,
    this.error,
    this.message,
    this.type,
    this.status,
  });

  String path;
  DateTime time;
  String error;
  String message;
  String type;
  int status;

  factory EnternalServerError.fromJson(Map<String, dynamic> json) =>
      EnternalServerError(
        path: json["path"],
        time: DateTime.parse(json["time"]),
        error: json["error"],
        message: json["message"],
        type: json["type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "time": time.toIso8601String(),
        "error": error,
        "message": message,
        "type": type,
        "status": status,
      };
}
