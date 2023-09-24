import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/login_model.dart';
import '../Models/pos_form_model.dart';
import '../Utils/app_constants.dart';

class PosServices {
  static Future<PosFormModel> getPosForm() async {
    var response = await http.get(
      Uri.parse(AppConstants.apiUrl + '/API/PosForm/' + 'GetAll'),
      headers: {
        HttpHeaders.authorizationHeader: AppConstants().UserTocken
      },
    );
    var jsonData = response.body;
    var decodedData = jsonDecode(jsonData);
    if (decodedData['isSuccess']) {
      return posFormModelFromJson(jsonData);
    } else {
      return posFormModelFromJson(jsonData);
    }
  }
}
