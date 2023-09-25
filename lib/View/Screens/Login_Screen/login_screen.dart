import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Logic/controllers/auth_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_images.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/snackbar.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_circle_progress.dart';
import '../../Widgets/custom_textField_widget.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: AppConstants.mediaHeight(context),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      AppImages.background_image
                  ),
                  fit: BoxFit.cover
              )
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(color: AppColors.MAIN_COLOR, fontSize: 30),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: AppConstants.mediaHeight(context)/4),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColors.WHITE_COLOR,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppConstants.widgetsCurve),
                      topLeft: Radius.circular(AppConstants.widgetsCurve),
                    )
                ),
                child: Column(
                  children: [
                    CustomTextFieldWidget(
                      controller: authController.userNameController.value,
                      hintText: "ادخل اسم المستخدم",
                    ),
                    CustomTextFieldWidget(
                      controller: authController.passwordController.value,
                      hintText: "ادخل كلمة المرور",
                    ),
                    SizedBox(height: 20),

                    Obx(
                          () => ConditionalBuilder(
                        condition: !authController.isLogInLoading.value,
                        builder: (context) =>  CustomButton(
                          title: "تسجيل دخول",
                          backgroundColor: AppColors.MAIN_COLOR,
                          borderSideColor: AppColors.MAIN_COLOR,
                          foregroundColor: AppColors.WHITE_COLOR,
                          overlayColor: AppColors.WHITE_COLOR,
                          onPress: () {
                            if(authController.userNameController.value.text.isEmpty||authController.userNameController.value.text.isEmpty){
                              showSnackbar(
                                  title: "*note",
                                  message: AppStrings.EMPTY_FIELDS,
                                  backgroundColor: AppColors.RED_COLOR,
                                  icon: Icons.error_outline
                              );
                            }
                            else{
                              authController.login(
                                  authController.userNameController.value.text,
                                  authController.passwordController.value.text,
                                  context
                              );
                            }
                          },
                        ),
                        fallback: (context) => const CustomCircleProgress(),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
