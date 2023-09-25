import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Models/login_model.dart';
import '../../Models/pos_form_model.dart';
import '../../Services/pos_services.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/app_strings.dart';
import '../../Utils/snackbar.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    getPosForm();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var isLoadingPosForm = false.obs;
  var posFormDataList = <PosFormData>[].obs;

  getPosForm() async {
    try {
      isLoadingPosForm(true);
      var result = await PosServices.getPosForm();
      if (result.isSuccess) {
        posFormDataList.value = result.data;
      }
    } finally {
      isLoadingPosForm(false);
    }
  }
  ItemsList? selectItem;
  CustomerList? selectCustomer;
  StoresList? selectStore;
  PaymentTypeList? selectedPaymentMethod;

  var selectedItems = <InvoiceDetails>[].obs;

  var selectedPayment = [].obs;

 double getTotal(){
   double result =0.0;
    for(int i =0; i<selectedItems.length;i++){
      result+=double.parse(selectedItems[i].quantity.toString()) * double.parse(selectedItems[i].price.toString()) ;
    }
    return result;
  }

  final paymentIndex = 0.obs;

  var isLoadingAddInvoice = false.obs;

  addInvoice() async {
    try {
      isLoadingAddInvoice(true);
      if(selectedItems.isEmpty){
        showSnackbar(
            title: "*note",
            message: "من فضلك حدد المنتجات",
            backgroundColor: AppColors.RED_COLOR,
            icon: Icons.error_outline
        );
      }else if(selectCustomer==null){
        showSnackbar(
            title: "*note",
            message: "من فضلك حدد العملاء",
            backgroundColor: AppColors.RED_COLOR,
            icon: Icons.error_outline
        );
      }else if(selectStore==null){
        showSnackbar(
            title: "*note",
            message: "من فضلك حدد المخازن",
            backgroundColor: AppColors.RED_COLOR,
            icon: Icons.error_outline
        );
      }else if(selectedPaymentMethod==null){
        showSnackbar(
            title: "*note",
            message: "من فضلك حدد طريقة الدفع",
            backgroundColor: AppColors.RED_COLOR,
            icon: Icons.error_outline
        );
      }
      else{
        var result = await PosServices.addInvoice(
          customerId: selectCustomer!.id.toString(),
          total: getTotal().toString(),
          amountPaid: getTotal().toString(),
          remainingAmount: "0",
          invoiceType: "10",
          invoiceDetailsList: selectedItems,
          paymentId: selectedPaymentMethod!.bptId.toString(),
          paymentValue: getTotal().toString(),
        );
        if (!result.isSuccess) {
          showSnackbar(
              title: AppStrings.API_RESPONSE,
              message: result.message,
              backgroundColor: AppColors.RED_COLOR,
              icon: Icons.error_outline
          );
        }      }
    } finally {
      isLoadingAddInvoice(false);
    }
  }


}

class ItemDetails {
  String? name;

  String? code;

  String? unit;

  int? amount;

  double? price;


  ItemDetails({
     this.name,
     this.code,
     this.unit,
     this.amount,
     this.price,
  });
}

class InvoiceDetails {
  int? itemId;

  int? unitId;

  int? quantity;

  int? storeId;

  double? price;

  String? itemName;
  String? itemCode;
  String? unitName;


  InvoiceDetails({
    this.itemId,
    this.unitId,
    this.quantity,
    this.storeId,
    this.price,
    this.itemName,
    this.itemCode,
    this.unitName,

  });

  factory InvoiceDetails.fromJson(Map<String, dynamic> json) => InvoiceDetails(
    itemId: json["itemId"],
    unitId: json["unitId"],
    quantity: json["quantity"],
    storeId: json["storeId"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "itemId": itemId,
    "unitId": unitId,
    "quantity": quantity,
    "storeId": storeId,
    "price": price,
  };
}
