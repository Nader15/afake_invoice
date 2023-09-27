// To parse this JSON data, do
//
//     final posFormModel = posFormModelFromJson(jsonString);

import 'dart:developer';

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

AddInvoiceModel addInvoiceModelJson(String str) => AddInvoiceModel.fromJson(json.decode(str));

String addInvoiceModelToJson(AddInvoiceModel data) => json.encode(data.toJson());

class AddInvoiceModel {
  DataAdded? data;
  int status;
  String message;
  bool isSuccess;
  dynamic token;

  AddInvoiceModel({
     this.data,
    required this.status,
    required this.message,
    required this.isSuccess,
    required this.token,
  });

  factory AddInvoiceModel.fromJson(Map<String, dynamic> json){
    log("isSuccess --> ${json['isSuccess']}");
    if (!json['isSuccess']) {
      return AddInvoiceModel(
        // data: json["data"],
        status: json["status"],
        message: json["message"],
        isSuccess: json["isSuccess"],
        token: json["token"],
      );
    }else{
      return AddInvoiceModel(
        data: DataAdded.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
        isSuccess: json["isSuccess"],
        token: json["token"],
      );
    }

  }

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "status": status,
    "message": message,
    "isSuccess": isSuccess,
    "token": token,
  };
}
class DataAdded {
  int? companyId;
  int? branchId;
  int? invoiceType;
  int? fyId;
  int? invoiceId;
  String? invoiceCode;
  DateTime? invoiceDate;
  int? jvId;
  String? jvSerial;
  String? tafkit;
  String? qrCode;

  DataAdded({
     this.companyId,
     this.branchId,
     this.invoiceType,
     this.fyId,
     this.invoiceId,
     this.invoiceCode,
     this.invoiceDate,
     this.jvId,
     this.jvSerial,
     this.tafkit,
     this.qrCode,
  });

  factory DataAdded.fromJson(Map<String, dynamic> json) => DataAdded(
    companyId: json["companyId"],
    branchId: json["branchId"],
    invoiceType: json["invoiceType"],
    fyId: json["fyId"],
    invoiceId: json["invoiceId"],
    invoiceCode: json["invoiceCode"],
    invoiceDate: DateTime.parse(json["invoiceDate"]),
    jvId: json["jvId"],
    jvSerial: json["jvSerial"],
    tafkit: json["tafkit"],
    qrCode: json["qrCode"],
  );

  Map<String, dynamic> toJson() => {
    "companyId": companyId,
    "branchId": branchId,
    "invoiceType": invoiceType,
    "fyId": fyId,
    "invoiceId": invoiceId,
    "invoiceCode": invoiceCode,
    "invoiceDate": invoiceDate!.toIso8601String(),
    "jvId": jvId,
    "jvSerial": jvSerial,
    "tafkit": tafkit,
    "qrCode": qrCode,
  };
}