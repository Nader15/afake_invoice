// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Data data;
  int status;
  String message;
  bool isSuccess;
  String token;

  LoginModel({
    required this.data,
    required this.status,
    required this.message,
    required this.isSuccess,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    data: Data.fromJson(json["data"]),
    status: json["status"],
    message: json["message"],
    isSuccess: json["isSuccess"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "status": status,
    "message": message,
    "isSuccess": isSuccess,
    "token": token,
  };
}

class Data {
  String userName;
  DateTime loginDate;
  int languages;
  int userId;
  int financialYear;
  int type;
  int companyId;
  int branchId;
  bool companyBranchShowHide;
  String companyNameA;
  String companyNameE;
  String financialCode;
  String branchNameA;
  String branchNameE;
  DateTime beginDate;
  DateTime endDate;
  String beginDateHj;
  String endDateHj;
  int financialType;
  int financialStatus;
  dynamic strServerName;
  dynamic strDatabase;
  int intSqlAuthenticationType;
  dynamic strSqlUserName;
  dynamic strSqlPassword;
  DateTime serverDateTime;
  int sdpItems;
  int sdpaDiscount;
  bool showSalesPolicy;
  bool joinUserStore;
  bool manualFollowCost;
  String strInitialCatalogOld;
  String strDataSourceOld;
  String strUserIdOld;
  dynamic strPasswordOld;
  int authenticationTypeOld;
  int financialYearOld;
  int companyIdOld;
  int programVersion;
  bool importFromExcel;
  bool exportToExcel;
  dynamic computerName;

  Data({
    required this.userName,
    required this.loginDate,
    required this.languages,
    required this.userId,
    required this.financialYear,
    required this.type,
    required this.companyId,
    required this.branchId,
    required this.companyBranchShowHide,
    required this.companyNameA,
    required this.companyNameE,
    required this.financialCode,
    required this.branchNameA,
    required this.branchNameE,
    required this.beginDate,
    required this.endDate,
    required this.beginDateHj,
    required this.endDateHj,
    required this.financialType,
    required this.financialStatus,
    required this.strServerName,
    required this.strDatabase,
    required this.intSqlAuthenticationType,
    required this.strSqlUserName,
    required this.strSqlPassword,
    required this.serverDateTime,
    required this.sdpItems,
    required this.sdpaDiscount,
    required this.showSalesPolicy,
    required this.joinUserStore,
    required this.manualFollowCost,
    required this.strInitialCatalogOld,
    required this.strDataSourceOld,
    required this.strUserIdOld,
    required this.strPasswordOld,
    required this.authenticationTypeOld,
    required this.financialYearOld,
    required this.companyIdOld,
    required this.programVersion,
    required this.importFromExcel,
    required this.exportToExcel,
    required this.computerName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userName: json["userName"],
    loginDate: DateTime.parse(json["loginDate"]),
    languages: json["languages"],
    userId: json["userId"],
    financialYear: json["financialYear"],
    type: json["type"],
    companyId: json["companyId"],
    branchId: json["branchId"],
    companyBranchShowHide: json["companyBranchShowHide"],
    companyNameA: json["companyNameA"],
    companyNameE: json["companyNameE"],
    financialCode: json["financialCode"],
    branchNameA: json["branchNameA"],
    branchNameE: json["branchNameE"],
    beginDate: DateTime.parse(json["beginDate"]),
    endDate: DateTime.parse(json["endDate"]),
    beginDateHj: json["beginDateHJ"],
    endDateHj: json["endDateHJ"],
    financialType: json["financialType"],
    financialStatus: json["financialStatus"],
    strServerName: json["strServerName"],
    strDatabase: json["strDatabase"],
    intSqlAuthenticationType: json["intSQLAuthenticationType"],
    strSqlUserName: json["strSQLUserName"],
    strSqlPassword: json["strSQLPassword"],
    serverDateTime: DateTime.parse(json["serverDateTime"]),
    sdpItems: json["sdpItems"],
    sdpaDiscount: json["sdpaDiscount"],
    showSalesPolicy: json["showSalesPolicy"],
    joinUserStore: json["joinUserStore"],
    manualFollowCost: json["manualFollowCost"],
    strInitialCatalogOld: json["strInitialCatalogOld"],
    strDataSourceOld: json["strDataSourceOld"],
    strUserIdOld: json["strUserIDOld"],
    strPasswordOld: json["strPasswordOld"],
    authenticationTypeOld: json["authenticationTypeOld"],
    financialYearOld: json["financialYearOld"],
    companyIdOld: json["companyIdOld"],
    programVersion: json["programVersion"],
    importFromExcel: json["importFromExcel"],
    exportToExcel: json["exportToExcel"],
    computerName: json["computerName"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "loginDate": loginDate.toIso8601String(),
    "languages": languages,
    "userId": userId,
    "financialYear": financialYear,
    "type": type,
    "companyId": companyId,
    "branchId": branchId,
    "companyBranchShowHide": companyBranchShowHide,
    "companyNameA": companyNameA,
    "companyNameE": companyNameE,
    "financialCode": financialCode,
    "branchNameA": branchNameA,
    "branchNameE": branchNameE,
    "beginDate": beginDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "beginDateHJ": beginDateHj,
    "endDateHJ": endDateHj,
    "financialType": financialType,
    "financialStatus": financialStatus,
    "strServerName": strServerName,
    "strDatabase": strDatabase,
    "intSQLAuthenticationType": intSqlAuthenticationType,
    "strSQLUserName": strSqlUserName,
    "strSQLPassword": strSqlPassword,
    "serverDateTime": serverDateTime.toIso8601String(),
    "sdpItems": sdpItems,
    "sdpaDiscount": sdpaDiscount,
    "showSalesPolicy": showSalesPolicy,
    "joinUserStore": joinUserStore,
    "manualFollowCost": manualFollowCost,
    "strInitialCatalogOld": strInitialCatalogOld,
    "strDataSourceOld": strDataSourceOld,
    "strUserIDOld": strUserIdOld,
    "strPasswordOld": strPasswordOld,
    "authenticationTypeOld": authenticationTypeOld,
    "financialYearOld": financialYearOld,
    "companyIdOld": companyIdOld,
    "programVersion": programVersion,
    "importFromExcel": importFromExcel,
    "exportToExcel": exportToExcel,
    "computerName": computerName,
  };
}
