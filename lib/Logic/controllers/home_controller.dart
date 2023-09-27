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
      selectCustomer.value = result.data[0].customerList.first;
      selectStore.value = result.data[0].storesList.first;
        selectPayment(0);
      }
    } finally {
      isLoadingPosForm(false);
    }
  }

  int nextId = 1;  // Initial ID

  addProduct(ItemsList newValue)async{
    nextId++;
    selectedItems.add(
      InvoiceDetails(
        id: nextId,
        itemId: newValue.itemId.toInt(),
        unitId: newValue.unitId.toInt(),
        total: double.parse(newValue.salesValue.toString()),
        netPrice: double.parse(newValue.salesValue.toString()),
        storeId: selectStore.value?.storeId !=null ?selectStore.value?.storeId?.toInt():0,
        itemName: newValue.itemName,
        itemCode: newValue.itemCode,
        unitName: newValue.unitName,
        quantity: 1,
        price: double.parse(newValue.salesValue.toString()),
      ),
    );
    getTotal();
    selectedItems.forEach((element) {
      log("selectedItems --> ${element.toJson()}");
    });
    log("getTotal() --> ${getTotal()}");
    selectedPayment.forEach((element) {
      log("selectedItems --> ${element["paymentValue"]=getTotal()}");
    });
    log("selectedPayment --> ${selectedPayment.toJson()}");
  }

  ItemsList? selectItem;
  Rx<CustomerList?> selectCustomer = CustomerList().obs;
  Rx<StoresList?> selectStore=StoresList().obs;
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


 selectPayment(int index){
   Map<String, dynamic> updatedMap = {};
   paymentIndex.value = index;
   selectedPaymentMethod = posFormDataList[0].paymentTypeList[index];
   updatedMap = {
     "paymentId": selectedPaymentMethod!.toJson()["bptId"],
     "paymentType": selectedPaymentMethod!.toJson()["bptId"],
     "paymentValue": getTotal(),
   };
   selectedPayment.clear();
   selectedPayment.add(updatedMap);
   log("selectedPayment --> ${selectedPayment.toJson()}");
 }

  var isLoadingAddInvoice = false.obs;

  addInvoice() async {
    try {
      isLoadingAddInvoice(true);
      // if(selectedItems.isEmpty){
      //   showSnackbar(
      //       title: "*note",
      //       message: "من فضلك حدد المنتجات",
      //       backgroundColor: AppColors.RED_COLOR,
      //       icon: Icons.error_outline
      //   );
      // }else if(selectCustomer==null){
      //   showSnackbar(
      //       title: "*note",
      //       message: "من فضلك حدد العملاء",
      //       backgroundColor: AppColors.RED_COLOR,
      //       icon: Icons.error_outline
      //   );
      // }else if(selectStore==null){
      //   showSnackbar(
      //       title: "*note",
      //       message: "من فضلك حدد المخازن",
      //       backgroundColor: AppColors.RED_COLOR,
      //       icon: Icons.error_outline
      //   );
      // }else if(selectedPaymentMethod==null){
      //   showSnackbar(
      //       title: "*note",
      //       message: "من فضلك حدد طريقة الدفع",
      //       backgroundColor: AppColors.RED_COLOR,
      //       icon: Icons.error_outline
      //   );
      // }
      // else{
        var result = await PosServices.addInvoice(
          customerId: selectCustomer.value!.id !=null ?"${selectCustomer.value!.id}":"0",
          total: getTotal().toString(),
          invoiceDetailsList: selectedItems,
          invoicePaymentList: selectedPayment,
        );
        if (!result.isSuccess) {
          showSnackbar(
              title: AppStrings.API_RESPONSE,
              message: result.message,
              backgroundColor: AppColors.RED_COLOR,
              icon: Icons.error_outline
          );
        }
      // }
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
  int? id;
  int? invoiceType;
  int? itemId;
  int? unitId;
  int? quantity;
  double? price;
  double? total;
  double? netPrice;
  int? storeId;

  String? itemName;
  String? itemCode;
  String? unitName;


  InvoiceDetails({
    this.id,
    this.invoiceType =10,
    this.total,
    this.netPrice,
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
    id: json["id"],
    invoiceType: json["invoiceType"],
    itemId: json["itemId"],
    total: json["total"],
    netPrice: json["netPrice"],
    unitId: json["unitId"],
    quantity: json["quantity"],
    storeId: json["storeId"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "itemId": itemId,
    "invoiceType": invoiceType,
    "total": total,
    "netPrice": netPrice,
    "unitId": unitId,
    "quantity": quantity,
    "storeId": storeId,
    "price": price,
  };
}
