import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Models/login_model.dart';
import '../../Routes/routes.dart';
import '../../Services/auth_services.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/app_strings.dart';
import '../../Utils/snackbar.dart';

class AuthController extends GetxController {



  @override
  void onInit() async {
    super.onInit();

  }

  @override
  void onClose() {
    super.onClose();
  }

  final authBox = GetStorage();
  var isLogInLoading = false.obs;

  var userNameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  Future login(
    String Email,
    String Password,
    BuildContext context,
  ) async {
    try {
      isLogInLoading(true);
      LoginModel loginModel = await AuthServices().loginAPI(
        Email,
        Password,
        context,
      );
      log("isSuccess --> ${loginModel.message}");
      if (loginModel.isSuccess) {
        log(
          loginModel.message,
        );
        authBox.write('AccessToken', "Bearer ${loginModel.token}");
        GetStorage().read<String>('AccessToken')!;
        showSnackbar(
          title: AppStrings.API_RESPONSE,
          message: loginModel.message,
          backgroundColor: AppColors.MAIN_COLOR,
          icon: Icons.verified_user_rounded
        );
        Get.offAllNamed(Routes.homeScreen);
      } else {
        showSnackbar(
          title: AppStrings.API_RESPONSE,
          message: loginModel.message,
          backgroundColor: AppColors.RED_COLOR,
          icon: Icons.error_outline
        );
      }
    } finally {
      isLogInLoading(false);
    }
  }
}
