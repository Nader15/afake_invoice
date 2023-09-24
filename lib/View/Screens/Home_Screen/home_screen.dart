import 'package:afake_invoice/View/Widgets/custom_circle_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Logic/controllers/home_controller.dart';
import '../../../Routes/routes.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/snackbar.dart';
import '../../Widgets/custom_button.dart';
import 'Widgets/items_list_widget.dart';
import 'Widgets/payment_list_widget.dart';
import 'Widgets/pos_data_list_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.MAIN_COLOR,
        title: const Text("بيانات الفاتورة"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      "تسجيل خروج",
                      style: TextStyle(color: AppColors.RED_COLOR),
                    ),
                    content: const Text("هل أنت متأكد من أنك تريد تسجيل الخروج؟"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("الغاء"),
                      ),
                      TextButton(
                        onPressed: () {
                          GetStorage().remove("AccessToken");
                          Get.offAllNamed(Routes.loginScreen);
                          showSnackbar(
                              title: AppStrings.LOG_OUT,
                              message: AppStrings.LOGGED_OUT,
                              backgroundColor: AppColors.MAIN_COLOR,
                              icon: Icons.verified_user_rounded);
                        },
                        child: const Text(
                          "تسجيل خروج",
                          style: TextStyle(color: AppColors.RED_COLOR),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.WHITE_COLOR,
            ),
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ItemsListWidget(),
                  if (homeController.isLoadingItemsListPagination.value)
                    const CustomCircleProgress(),
                  PaymentListWidget(),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 50),
                child: CustomButton(
                  title: "الفاتورة",
                  backgroundColor: AppColors.MAIN_COLOR,
                  borderSideColor: AppColors.MAIN_COLOR,
                  foregroundColor: AppColors.WHITE_COLOR,
                  overlayColor: AppColors.WHITE_COLOR,
                  onPress: () {
                    Get.toNamed(Routes.invoiceScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
