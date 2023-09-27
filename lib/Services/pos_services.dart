import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:afake_invoice/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Logic/controllers/home_controller.dart';
import '../Models/add_invoice_model.dart';
import '../Models/login_model.dart';
import '../Models/pos_form_model.dart';
import '../Utils/app_colors.dart';
import '../Utils/app_constants.dart';
import '../Utils/app_strings.dart';
import '../Utils/snackbar.dart';

class PosServices {
  static Future<PosFormModel> getPosForm() async {
    var response = await http.get(
      Uri.parse(AppConstants.apiUrl + '/API/PosForm/' + 'GetAll'),
      headers: {HttpHeaders.authorizationHeader: AppConstants().UserTocken},
    );
    var jsonData = response.body;
    if (response.statusCode == 401) {
      log("statusCode --> ${response.statusCode}");
      Get.offAllNamed(Routes.loginScreen);
      showSnackbar(
          title: AppStrings.API_RESPONSE,
          message: "Session Expired",
          backgroundColor: AppColors.RED_COLOR,
          icon: Icons.error_outline);
    } else {
      var decodedData = jsonDecode(jsonData);
      if (decodedData['isSuccess']) {
        return posFormModelFromJson(jsonData);
      }
    }
    return throw Exception(jsonDecode(jsonData)['message']);
  }

  static Future<AddInvoiceModel> addInvoice({
    required String customerId,
    required String total,
    required List<InvoiceDetails> invoiceDetailsList,
    required List invoicePaymentList,
  }) async {
    var response = await http.post(
      Uri.parse(AppConstants.apiUrl + '/API/PosForm/' + 'Add'),
      body: jsonEncode({
        "posPintAfterSave": true,
        "sceId": customerId,
        "invoiceType": 10,
        "description": "string",
        "currencyId": 1,
        "rate": 1,
        "total": total,
        "netTotal": total,
        "amountPaid": total,
        "remainingAmount": 0,
        "type": 1,
        "invoiceDetails": invoiceDetailsList,
        "invoicePayment": invoicePaymentList
      }),
      headers: {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: AppConstants().UserTocken
      },
    );
    var jsonData = response.body;
    var decodedData = jsonDecode(jsonData);
    if (decodedData['isSuccess']) {
      return addInvoiceModelJson(jsonData);
    }
    else{
      return addInvoiceModelJson(jsonData);
    }
  }
}
