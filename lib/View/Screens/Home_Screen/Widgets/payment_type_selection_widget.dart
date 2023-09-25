import 'dart:developer';

import 'package:afake_invoice/Utils/app_colors.dart';
import 'package:afake_invoice/View/Widgets/custom_circle_progress.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Logic/controllers/home_controller.dart';
import '../../../../Models/pos_form_model.dart';
import '../../../../Utils/app_constants.dart';

class PaymentTypeSelectionWidget extends StatelessWidget {
  PaymentTypeSelectionWidget({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {

    return Obx(
          () {
            if (homeController.posFormDataList.isEmpty) {
              return const SizedBox();
            }
            if (homeController.posFormDataList[0].paymentTypeList.isEmpty) {
              return const Text('لايوجد طريقة دفع متاحة'); // Handle the case when itemsList is empty
            }
            return Row(
              children: [
                Text("طريقة الدفع"),
                Obx((){
                  if (homeController.posFormDataList.isEmpty) {
                    return const SizedBox();
                  }
                  if (homeController.posFormDataList[0].itemsList.isEmpty) {
                    return const Text('لايوجد منتجات متاحة'); // Handle the case when itemsList is empty
                  }
                  return Expanded(child: SizedBox(
                    height: 30,
                    // height: MediaQuery.sizeOf(context).height * 0.04,
                    child: ListView.builder(
                      itemCount: homeController
                          .posFormDataList[0].paymentTypeList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        /// set total count page
                        // initCategory.setTotalCountPage(categoryBox.data!.last.id);
                        return selection(
                          homeController.posFormDataList[0]
                              .paymentTypeList[index].bptId,
                          title: homeController.posFormDataList[0]
                              .paymentTypeList[index].paymentTypeName,
                          onPress: () {
                            homeController.paymentIndex.value = homeController.posFormDataList[0].paymentTypeList[index].bptId;
                            homeController.selectedPaymentMethod = homeController.posFormDataList[0].paymentTypeList[index];
                          },
                        );
                      },
                    ),
                  ),);
                })
              ],
            );
          } ,
    );
  }
  Widget selection(index,
      {required String title, required VoidCallback onPress}) {
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: onPress,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border:
            Border.all(color: AppColors.MAIN_COLOR.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(5),
            color: index == homeController.paymentIndex.value
                ? AppColors.MAIN_COLOR
                : AppColors.WHITE_COLOR,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            style: TextStyle(
              color: index == homeController.paymentIndex.value
                  ? AppColors.WHITE_COLOR
                  : AppColors.BLACK_COLOR,
            ),
          ),
        ),
      ),
    ));
  }
}
