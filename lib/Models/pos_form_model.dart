// To parse this JSON data, do
//
//     final posFormModel = posFormModelFromJson(jsonString);

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

PosFormModel posFormModelFromJson(String str) => PosFormModel.fromJson(json.decode(str));

String posFormModelToJson(PosFormModel data) => json.encode(data.toJson());

class PosFormModel {
  List<PosFormData> data;
  int status;
  String message;
  bool isSuccess;
  dynamic token;

  PosFormModel({
    required this.data,
    required this.status,
    required this.message,
    required this.isSuccess,
    required this.token,
  });

  factory PosFormModel.fromJson(Map<String, dynamic> json) => PosFormModel(
    data: List<PosFormData>.from(json["data"].map((x) => PosFormData.fromJson(x))),
    status: json["status"],
    message: json["message"],
    isSuccess: json["isSuccess"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
    "isSuccess": isSuccess,
    "token": token,
  };
}

class PosFormData {
  int posInvoiceTypeId;
  double posReportNo;
  bool posPintAfterSave;
  bool printFromFrontEnd;
  String employeeName;
  String posName;
  bool modifyQuantity;
  bool modifyPrice;
  bool modifyDiscount;
  bool modifyItem;
  bool modifyItemUnit;
  bool deleteAddedRow;
  bool returned;
  bool returnedWithoutInvoice;
  bool credit;
  bool sellingBank;
  bool changeAccount;
  bool invoiceHold;
  bool openPos;
  bool cancelCheque;
  bool modifyADiscount;
  bool itemInquiring;
  int storeId;
  String storeName;
  List<PaymentTypeList> paymentTypeList;
  List<dynamic> itemsGroupMainList;
  List<dynamic> itemsGroupChildList;
  List<ItemsList> itemsList;
  List<CustomerList> customerList;
  List<Salesmen> salesmen;
  List<AccountsList> accountsList;
  List<StoresList> storesList;
  List<InvoiceHodeList> invoiceHodeList;
  List<CompanyList> companyList;
  List<CompanyInfoList> companyInfoList;
  List<dynamic> warrantyList;
  List<dynamic> posInvoiceTypeList;
  List<dynamic> rTablesList;

  PosFormData({
    required this.posInvoiceTypeId,
    required this.posReportNo,
    required this.posPintAfterSave,
    required this.printFromFrontEnd,
    required this.employeeName,
    required this.posName,
    required this.modifyQuantity,
    required this.modifyPrice,
    required this.modifyDiscount,
    required this.modifyItem,
    required this.modifyItemUnit,
    required this.deleteAddedRow,
    required this.returned,
    required this.returnedWithoutInvoice,
    required this.credit,
    required this.sellingBank,
    required this.changeAccount,
    required this.invoiceHold,
    required this.openPos,
    required this.cancelCheque,
    required this.modifyADiscount,
    required this.itemInquiring,
    required this.storeId,
    required this.storeName,
    required this.paymentTypeList,
    required this.itemsGroupMainList,
    required this.itemsGroupChildList,
    required this.itemsList,
    required this.customerList,
    required this.salesmen,
    required this.accountsList,
    required this.storesList,
    required this.invoiceHodeList,
    required this.companyList,
    required this.companyInfoList,
    required this.warrantyList,
    required this.posInvoiceTypeList,
    required this.rTablesList,
  });

  factory PosFormData.fromJson(Map<String, dynamic> json) => PosFormData(
    posInvoiceTypeId: json["posInvoiceTypeId"],
    posReportNo: json["posReportNo"],
    posPintAfterSave: json["posPintAfterSave"],
    printFromFrontEnd: json["printFromFrontEnd"],
    employeeName: json["employeeName"],
    posName: json["posName"],
    modifyQuantity: json["modifyQuantity"],
    modifyPrice: json["modifyPrice"],
    modifyDiscount: json["modifyDiscount"],
    modifyItem: json["modifyItem"],
    modifyItemUnit: json["modifyItemUnit"],
    deleteAddedRow: json["deleteAddedRow"],
    returned: json["returned"],
    returnedWithoutInvoice: json["returnedWithoutInvoice"],
    credit: json["credit"],
    sellingBank: json["sellingBank"],
    changeAccount: json["changeAccount"],
    invoiceHold: json["invoiceHold"],
    openPos: json["openPOS"],
    cancelCheque: json["cancelCheque"],
    modifyADiscount: json["modifyADiscount"],
    itemInquiring: json["itemInquiring"],
    storeId: json["storeId"],
    storeName: json["storeName"],
    paymentTypeList: List<PaymentTypeList>.from(json["paymentTypeList"].map((x) => PaymentTypeList.fromJson(x))),
    itemsGroupMainList: List<dynamic>.from(json["itemsGroupMainList"].map((x) => x)),
    itemsGroupChildList: List<dynamic>.from(json["itemsGroupChildList"].map((x) => x)),
    itemsList: List<ItemsList>.from(json["itemsList"].map((x) => ItemsList.fromJson(x))),
    customerList: List<CustomerList>.from(json["customerList"].map((x) => CustomerList.fromJson(x))),
    salesmen: List<Salesmen>.from(json["salesmen"].map((x) => Salesmen.fromJson(x))),
    accountsList: List<AccountsList>.from(json["accountsList"].map((x) => AccountsList.fromJson(x))),
    storesList: List<StoresList>.from(json["storesList"].map((x) => StoresList.fromJson(x))),
    invoiceHodeList: List<InvoiceHodeList>.from(json["invoiceHodeList"].map((x) => InvoiceHodeList.fromJson(x))),
    companyList: List<CompanyList>.from(json["companyList"].map((x) => CompanyList.fromJson(x))),
    companyInfoList: List<CompanyInfoList>.from(json["companyInfoList"].map((x) => CompanyInfoList.fromJson(x))),
    warrantyList: List<dynamic>.from(json["warrantyList"].map((x) => x)),
    posInvoiceTypeList: List<dynamic>.from(json["posInvoiceTypeList"].map((x) => x)),
    rTablesList: List<dynamic>.from(json["rTablesList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "posInvoiceTypeId": posInvoiceTypeId,
    "posReportNo": posReportNo,
    "posPintAfterSave": posPintAfterSave,
    "printFromFrontEnd": printFromFrontEnd,
    "employeeName": employeeName,
    "posName": posName,
    "modifyQuantity": modifyQuantity,
    "modifyPrice": modifyPrice,
    "modifyDiscount": modifyDiscount,
    "modifyItem": modifyItem,
    "modifyItemUnit": modifyItemUnit,
    "deleteAddedRow": deleteAddedRow,
    "returned": returned,
    "returnedWithoutInvoice": returnedWithoutInvoice,
    "credit": credit,
    "sellingBank": sellingBank,
    "changeAccount": changeAccount,
    "invoiceHold": invoiceHold,
    "openPOS": openPos,
    "cancelCheque": cancelCheque,
    "modifyADiscount": modifyADiscount,
    "itemInquiring": itemInquiring,
    "storeId": storeId,
    "storeName": storeName,
    "paymentTypeList": List<dynamic>.from(paymentTypeList.map((x) => x.toJson())),
    "itemsGroupMainList": List<dynamic>.from(itemsGroupMainList.map((x) => x)),
    "itemsGroupChildList": List<dynamic>.from(itemsGroupChildList.map((x) => x)),
    "itemsList": List<dynamic>.from(itemsList.map((x) => x.toJson())),
    "customerList": List<dynamic>.from(customerList.map((x) => x.toJson())),
    "salesmen": List<dynamic>.from(salesmen.map((x) => x.toJson())),
    "accountsList": List<dynamic>.from(accountsList.map((x) => x.toJson())),
    "storesList": List<dynamic>.from(storesList.map((x) => x.toJson())),
    "invoiceHodeList": List<dynamic>.from(invoiceHodeList.map((x) => x.toJson())),
    "companyList": List<dynamic>.from(companyList.map((x) => x.toJson())),
    "companyInfoList": List<dynamic>.from(companyInfoList.map((x) => x.toJson())),
    "warrantyList": List<dynamic>.from(warrantyList.map((x) => x)),
    "posInvoiceTypeList": List<dynamic>.from(posInvoiceTypeList.map((x) => x)),
    "rTablesList": List<dynamic>.from(rTablesList.map((x) => x)),
  };
}

class AccountsList {
  String accountId;
  String accountName;

  AccountsList({
    required this.accountId,
    required this.accountName,
  });

  factory AccountsList.fromJson(Map<String, dynamic> json) => AccountsList(
    accountId: json["accountId"],
    accountName: json["accountName"],
  );

  Map<String, dynamic> toJson() => {
    "accountId": accountId,
    "accountName": accountName,
  };
}

class CompanyInfoList {
  String companyName;
  String taxNumber;
  String commercialTaxNumber;
  String branchName;
  String address;
  String tel1;
  String tel2;
  String mobile;
  String fax;
  String email;
  String site;
  String branchVatNo;

  CompanyInfoList({
    required this.companyName,
    required this.taxNumber,
    required this.commercialTaxNumber,
    required this.branchName,
    required this.address,
    required this.tel1,
    required this.tel2,
    required this.mobile,
    required this.fax,
    required this.email,
    required this.site,
    required this.branchVatNo,
  });

  factory CompanyInfoList.fromJson(Map<String, dynamic> json) => CompanyInfoList(
    companyName: json["companyName"],
    taxNumber: json["taxNumber"],
    commercialTaxNumber: json["commercialTaxNumber"],
    branchName: json["branchName"],
    address: json["address"],
    tel1: json["tel1"],
    tel2: json["tel2"],
    mobile: json["mobile"],
    fax: json["fax"],
    email: json["email"],
    site: json["site"],
    branchVatNo: json["branchVATNo"],
  );

  Map<String, dynamic> toJson() => {
    "companyName": companyName,
    "taxNumber": taxNumber,
    "commercialTaxNumber": commercialTaxNumber,
    "branchName": branchName,
    "address": address,
    "tel1": tel1,
    "tel2": tel2,
    "mobile": mobile,
    "fax": fax,
    "email": email,
    "site": site,
    "branchVATNo": branchVatNo,
  };
}

class CompanyList {
  bool showTaxSourceValue;
  bool showTaxSourceRate;
  double taxSourceRate;
  bool useTaxSales;
  bool showTaxRate;
  bool showTaxValue;
  bool useTaxSourceSales;
  bool useTableTaxSales;
  bool nTaxTFees;
  double fractions;
  String itemCodeStartWith;
  double itemCodeLength;
  double weightFactorDivision;
  double ignoredNumber;

  CompanyList({
    required this.showTaxSourceValue,
    required this.showTaxSourceRate,
    required this.taxSourceRate,
    required this.useTaxSales,
    required this.showTaxRate,
    required this.showTaxValue,
    required this.useTaxSourceSales,
    required this.useTableTaxSales,
    required this.nTaxTFees,
    required this.fractions,
    required this.itemCodeStartWith,
    required this.itemCodeLength,
    required this.weightFactorDivision,
    required this.ignoredNumber,
  });

  factory CompanyList.fromJson(Map<String, dynamic> json) => CompanyList(
    showTaxSourceValue: json["showTaxSourceValue"],
    showTaxSourceRate: json["showTaxSourceRate"],
    taxSourceRate: json["taxSourceRate"],
    useTaxSales: json["useTaxSales"],
    showTaxRate: json["showTaxRate"],
    showTaxValue: json["showTaxValue"],
    useTaxSourceSales: json["useTaxSourceSales"],
    useTableTaxSales: json["useTableTaxSales"],
    nTaxTFees: json["nTaxTFees"],
    fractions: json["fractions"],
    itemCodeStartWith: json["itemCodeStartWith"],
    itemCodeLength: json["itemCodeLength"],
    weightFactorDivision: json["weightFactorDivision"],
    ignoredNumber: json["ignoredNumber"],
  );

  Map<String, dynamic> toJson() => {
    "showTaxSourceValue": showTaxSourceValue,
    "showTaxSourceRate": showTaxSourceRate,
    "taxSourceRate": taxSourceRate,
    "useTaxSales": useTaxSales,
    "showTaxRate": showTaxRate,
    "showTaxValue": showTaxValue,
    "useTaxSourceSales": useTaxSourceSales,
    "useTableTaxSales": useTableTaxSales,
    "nTaxTFees": nTaxTFees,
    "fractions": fractions,
    "itemCodeStartWith": itemCodeStartWith,
    "itemCodeLength": itemCodeLength,
    "weightFactorDivision": weightFactorDivision,
    "ignoredNumber": ignoredNumber,
  };
}

class CustomerList {
  double id;
  SceType sceType;
  String code;
  String customerName;
  String tel1;
  String tel2;
  String mobile;
  Fax fax;
  EMail eMail;
  Site site;
  String address;
  Notes notes;
  bool posDefaultCusCash;
  String taxRegistrationNo;
  String vatNo;

  CustomerList({
    required this.id,
    required this.sceType,
    required this.code,
    required this.customerName,
    required this.tel1,
    required this.tel2,
    required this.mobile,
    required this.fax,
    required this.eMail,
    required this.site,
    required this.address,
    required this.notes,
    required this.posDefaultCusCash,
    required this.taxRegistrationNo,
    required this.vatNo,
  });

  factory CustomerList.fromJson(Map<String, dynamic> json) => CustomerList(
    id: json["id"],
    sceType: sceTypeValues.map[json["sceType"]]!,
    code: json["code"],
    customerName: json["customerName"],
    tel1: json["tel1"],
    tel2: json["tel2"],
    mobile: json["mobile"],
    fax: faxValues.map[json["fax"]]!,
    eMail: eMailValues.map[json["eMail"]]!,
    site: siteValues.map[json["site"]]!,
    address: json["address"],
    notes: notesValues.map[json["notes"]]!,
    posDefaultCusCash: json["posDefaultCusCash"],
    taxRegistrationNo: json["taxRegistrationNo"],
    vatNo: json["vatNo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sceType": sceTypeValues.reverse[sceType],
    "code": code,
    "customerName": customerName,
    "tel1": tel1,
    "tel2": tel2,
    "mobile": mobile,
    "fax": faxValues.reverse[fax],
    "eMail": eMailValues.reverse[eMail],
    "site": siteValues.reverse[site],
    "address": address,
    "notes": notesValues.reverse[notes],
    "posDefaultCusCash": posDefaultCusCash,
    "taxRegistrationNo": taxRegistrationNo,
    "vatNo": vatNo,
  };
}

enum EMail {
  EMPTY,
  E_MAIL,
  MOHAMEDNAGDY257_GMAIL_COM,
  MOHAMEDNAGDY_GMAIL_COM,
  MOHAMEDNAGDY_INAME_COM,
  SASAS
}

final eMailValues = EnumValues({
  "": EMail.EMPTY,
  "ويةيي": EMail.E_MAIL,
  "mohamednagdy257@gmail.com": EMail.MOHAMEDNAGDY257_GMAIL_COM,
  "mohamednagdy@gmail.com": EMail.MOHAMEDNAGDY_GMAIL_COM,
  "mohamednagdy@iname.com": EMail.MOHAMEDNAGDY_INAME_COM,
  "sasas": EMail.SASAS
});

enum Fax {
  EMPTY,
  FAX,
  SASAS,
  THE_0123214934314,
  THE_01558400064,
  THE_0999333443
}

final faxValues = EnumValues({
  "": Fax.EMPTY,
  "يوب": Fax.FAX,
  "sasas": Fax.SASAS,
  "0123214934314": Fax.THE_0123214934314,
  "01558400064": Fax.THE_01558400064,
  "0999333443": Fax.THE_0999333443
});

enum Notes {
  ANY_NOTE,
  DSADSADSA,
  EMPTY,
  MY_NOTE,
  NOTE,
  NOTES
}

final notesValues = EnumValues({
  "any note": Notes.ANY_NOTE,
  "dsadsadsa": Notes.DSADSADSA,
  "": Notes.EMPTY,
  "my note": Notes.MY_NOTE,
  "note": Notes.NOTE,
  "ؤةيءظ": Notes.NOTES
});

enum SceType {
  CUSTOMER
}

final sceTypeValues = EnumValues({
  "عميل - Customer": SceType.CUSTOMER
});

enum Site {
  EMPTY,
  SASAS,
  SITE,
  WWW,
  WWW_GOOGLE_COM,
  WWW_MOHAMED_COM
}

final siteValues = EnumValues({
  "": Site.EMPTY,
  "sasas": Site.SASAS,
  "وروى": Site.SITE,
  "www": Site.WWW,
  "www.google.com": Site.WWW_GOOGLE_COM,
  "www.Mohamed.com": Site.WWW_MOHAMED_COM
});

class InvoiceHodeList {
  double invoiceId;
  String invoiceCode;

  InvoiceHodeList({
    required this.invoiceId,
    required this.invoiceCode,
  });

  factory InvoiceHodeList.fromJson(Map<String, dynamic> json) => InvoiceHodeList(
    invoiceId: json["invoiceId"],
    invoiceCode: json["invoiceCode"],
  );

  Map<String, dynamic> toJson() => {
    "invoiceId": invoiceId,
    "invoiceCode": invoiceCode,
  };
}

class ItemsList {
  double groupId;
  double itemId;
  String itemCode;
  String itemName;
  bool mainUnit;
  bool defaultUnit;
  bool defaultUnitSales;
  double unitId;
  String unitName;
  String barCode;
  BarcodeSeparator barcodeSeparator;
  bool exempt;
  bool hidePrice;
  int salesValue;
  int minimumSaleValue;
  int taxRate;
  int tableTaxRate;
  int salesDiscountType;
  int salesDiscountValue;
  bool automaticDiscountS;
  bool useTaxOnTableFees;
  var amount = 0.obs;

  ItemsList({
    required this.groupId,
    required this.itemId,
    required this.itemCode,
    required this.itemName,
    required this.mainUnit,
    required this.defaultUnit,
    required this.defaultUnitSales,
    required this.unitId,
    required this.unitName,
    required this.barCode,
    required this.barcodeSeparator,
    required this.exempt,
    required this.hidePrice,
    required this.salesValue,
    required this.minimumSaleValue,
    required this.taxRate,
    required this.tableTaxRate,
    required this.salesDiscountType,
    required this.salesDiscountValue,
    required this.automaticDiscountS,
    required this.useTaxOnTableFees,
  });

  factory ItemsList.fromJson(Map<String, dynamic> json) => ItemsList(
    groupId: json["groupId"],
    itemId: json["itemId"],
    itemCode: json["itemCode"],
    itemName: json["itemName"],
    mainUnit: json["mainUnit"],
    defaultUnit: json["defaultUnit"],
    defaultUnitSales: json["defaultUnitSales"],
    unitId: json["unitId"],
    unitName: json["unitName"],
    barCode: json["barCode"],
    barcodeSeparator: barcodeSeparatorValues.map[json["barcodeSeparator"]]!,
    exempt: json["exempt"],
    hidePrice: json["hidePrice"],
    salesValue: json["salesValue"],
    minimumSaleValue: json["minimumSaleValue"],
    taxRate: json["taxRate"],
    tableTaxRate: json["tableTaxRate"],
    salesDiscountType: json["salesDiscountType"],
    salesDiscountValue: json["salesDiscountValue"],
    automaticDiscountS: json["automaticDiscountS"],
    useTaxOnTableFees: json["useTaxOnTableFees"],
  );

  Map<String, dynamic> toJson() => {
    "groupId": groupId,
    "itemId": itemId,
    "itemCode": itemCode,
    "itemName": itemName,
    "mainUnit": mainUnit,
    "defaultUnit": defaultUnit,
    "defaultUnitSales": defaultUnitSales,
    "unitId": unitId,
    "unitName": unitName,
    "barCode": barCode,
    "barcodeSeparator": barcodeSeparatorValues.reverse[barcodeSeparator],
    "exempt": exempt,
    "hidePrice": hidePrice,
    "salesValue": salesValue,
    "minimumSaleValue": minimumSaleValue,
    "taxRate": taxRate,
    "tableTaxRate": tableTaxRate,
    "salesDiscountType": salesDiscountType,
    "salesDiscountValue": salesDiscountValue,
    "automaticDiscountS": automaticDiscountS,
    "useTaxOnTableFees": useTaxOnTableFees,
  };
}

enum BarcodeSeparator {
  EMPTY
}

final barcodeSeparatorValues = EnumValues({
  "@": BarcodeSeparator.EMPTY
});



class PaymentTypeList {
  int bptId;
  String paymentTypeName;

  PaymentTypeList({
    required this.bptId,
    required this.paymentTypeName,
  });

  factory PaymentTypeList.fromJson(Map<String, dynamic> json) => PaymentTypeList(
    bptId: json["bptId"],
    paymentTypeName: json["paymentTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "bptId": bptId,
    "paymentTypeName": paymentTypeName,
  };
}

class Salesmen {
  double id;
  String code;
  String employeeName;

  Salesmen({
    required this.id,
    required this.code,
    required this.employeeName,
  });

  factory Salesmen.fromJson(Map<String, dynamic> json) => Salesmen(
    id: json["id"],
    code: json["code"],
    employeeName: json["employeeName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "employeeName": employeeName,
  };
}

class StoresList {
  bool defaultStore;
  double storeId;
  String storeCode;
  String storeName;

  StoresList({
    required this.defaultStore,
    required this.storeId,
    required this.storeCode,
    required this.storeName,
  });

  factory StoresList.fromJson(Map<String, dynamic> json) => StoresList(
    defaultStore: json["defaultStore"],
    storeId: json["storeId"],
    storeCode: json["storeCode"],
    storeName: json["storeName"],
  );

  Map<String, dynamic> toJson() => {
    "defaultStore": defaultStore,
    "storeId": storeId,
    "storeCode": storeCode,
    "storeName": storeName,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
