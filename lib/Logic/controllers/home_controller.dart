import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Models/login_model.dart';
import '../../Models/pos_form_model.dart';
import '../../Services/pos_services.dart';

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

  var selectedItems = <ItemDetails>[].obs;

  var selectedPayment = [].obs;

 double getTotal(){
   double result =0.0;
    for(int i =0; i<selectedItems.length;i++){
      result+=double.parse(selectedItems[i].amount.toString()) * double.parse(selectedItems[i].price.toString()) ;
    }
    return result;
  }

  final paymentIndex = 0.obs;

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
