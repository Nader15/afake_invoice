import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/login_model.dart';
import '../Utils/app_constants.dart';

class AuthServices {
  Future<LoginModel> loginAPI(String userName, String password, context) async {
    var data = await http.post(
      Uri.parse(AppConstants.apiUrl + '/API/User/' + 'Login'),
      body: jsonEncode(
        {
          "userName": userName,
          "password": password,
          "langId": "1",
          "computerName": "Nader Salah"
        },
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var jsonData = json.decode(data.body);
    var decodedData = jsonDecode(data.body);
    log("API RESPONSE --> ${decodedData.toString()}");
    if (decodedData['isSuccess']) {
      return LoginModel.fromJson(jsonData);
    } else {
      return LoginModel.fromJson(jsonData);
    }
  }
}
