// To parse this JSON data, do
//
//     final posFormModel = posFormModelFromJson(jsonString);

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

AddInvoiceModel addInvoiceModelJson(String str) => AddInvoiceModel.fromJson(json.decode(str));

String addInvoiceModelToJson(AddInvoiceModel data) => json.encode(data.toJson());

class AddInvoiceModel {
  dynamic data;
  int status;
  String message;
  bool isSuccess;
  dynamic token;

  AddInvoiceModel({
    required this.data,
    required this.status,
    required this.message,
    required this.isSuccess,
    required this.token,
  });

  factory AddInvoiceModel.fromJson(Map<String, dynamic> json) => AddInvoiceModel(
    data: json["data"],
    status: json["status"],
    message: json["message"],
    isSuccess: json["isSuccess"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "status": status,
    "message": message,
    "isSuccess": isSuccess,
    "token": token,
  };
}