import 'dart:developer';

import 'package:afake_invoice/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Logic/controllers/home_controller.dart';
import '../../../Widgets/custom_circle_progress.dart';
import 'custom_checkBox.dart';

class PaymentListWidget extends StatelessWidget {
  PaymentListWidget({
    Key? key,
  }) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.isLoadingPosForm.value) {
        return const CustomCircleProgress();
      }
      if (homeController.posFormDataList[0].paymentTypeList.isEmpty) {
        return const SizedBox();
      } else {
        return Column(
          children: [
            ExpansionTile(
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              // expandedAlignment: Alignment.centerLeft,
              title: Text(
                "طريقة الدفع",
              ),
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: homeController.posFormDataList[0].paymentTypeList.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final item = homeController.posFormDataList[0].paymentTypeList[index];
                      return CustomCheckBox(
                        trailing: item.bptId.toString(),
                        title: item.paymentTypeName,
                        selectBox: homeController.selectedPayment.contains(item.bptId),
                        onChanged: (bool value) {
                          if (value) {
                            homeController.selectedPayment.add(item.bptId);
                          } else {
                            homeController.selectedPayment.remove(item.bptId);
                          }
                          log("selectedPayment --> ${homeController.selectedPayment.toString()}");
                        },
                      );
                    });
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
                )
              ],
            )
          ],
        );
      }
    });
  }
}
