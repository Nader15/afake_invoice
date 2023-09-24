import 'dart:developer';

import 'package:afake_invoice/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Logic/controllers/home_controller.dart';
import '../../../../Utils/app_colors.dart';
import '../../../Widgets/custom_circle_progress.dart';
import 'custom_checkBox.dart';

class ItemsListWidget extends StatelessWidget {
  ItemsListWidget({
    Key? key,
  }) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.isLoadingPosForm.value) {
        return const CustomCircleProgress();
      }
      if (homeController.paginatedItemsList.isEmpty) {
        return const SizedBox();
      } else {
        return Column(
          children: [
            ExpansionTile(
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              // expandedAlignment: Alignment.centerLeft,
              title: const Text(
                "الأصناف",
              ),
              children: [
                SizedBox(
                  height: AppConstants.mediaHeight(context) / 2,
                  child: ListView.separated(
                    shrinkWrap: true,
                    controller: homeController.scrollController.value,
                    physics: const BouncingScrollPhysics(),
                    itemCount: homeController.paginatedItemsList.length + 1,
                    itemBuilder: (context, index) {
                      final GlobalKey<FormState> formKey =
                          GlobalKey<FormState>();
                      return Obx(() {
                        if (index == homeController.paginatedItemsList.length) {
                          return Container(); // Empty container when not loading
                        } else {
                          final item = homeController.paginatedItemsList[index];
                          return CustomCheckBox(
                            title: homeController
                                .paginatedItemsList[index].itemName,
                            subtitle: homeController
                                .paginatedItemsList[index].itemCode,
                            trailing: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "الكمية",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.MAIN_COLOR),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.GREY_COLOR
                                            .withOpacity(0.3),
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.MAIN_COLOR,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Icon(
                                            Icons.keyboard_arrow_up_outlined,
                                            color: AppColors.WHITE_COLOR,
                                            // size: 20,
                                          ),
                                        ),
                                        onTap: () {
                                          homeController
                                              .paginatedItemsList[index]
                                              .amount
                                              .value += 1;
                                          homeController.selectedItems.removeWhere((element) => item.itemCode == element.code);
                                          homeController.selectedItems.add(
                                            ItemDetails(
                                              name: item.itemName,
                                              code: item.itemCode,
                                              unit: item.unitName,
                                              amount: homeController
                                                  .paginatedItemsList[index]
                                                  .amount
                                                  .value,
                                              price: double.parse(item.salesValue.toString()),
                                            ),
                                          );
                                        },
                                      ),
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        height: 20,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                              "${homeController.paginatedItemsList[index].amount.value}"),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.MAIN_COLOR,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: AppColors.WHITE_COLOR,
                                            // size: 20,
                                          ),
                                        ),
                                        onTap: () {
                                          if (homeController
                                                  .paginatedItemsList[index]
                                                  .amount
                                                  .value >
                                              0) {
                                            homeController
                                                .paginatedItemsList[index]
                                                .amount
                                                .value -= 1;
                                            homeController.selectedItems.removeWhere((element) => item.itemCode == element.code);
                                            homeController.selectedItems.add(
                                              ItemDetails(
                                                name: item.itemName,
                                                code: item.itemCode,
                                                unit: item.unitName,
                                                amount: homeController
                                                    .paginatedItemsList[index]
                                                    .amount
                                                    .value,
                                                price:double.parse(item.salesValue.toString()),
                                              ),
                                            );
                                          }
                                          if (homeController
                                                  .paginatedItemsList[index]
                                                  .amount
                                                  .value ==
                                              0) {
                                            homeController.selectedItems
                                                .removeWhere((element) =>
                                                    item.itemCode ==
                                                    element.code);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            selectBox: homeController.selectedItems.any(
                                (element) => item.itemCode == element.code),
                            onChanged: (bool value) {
                              if (value) {
                                homeController.selectedItems.removeWhere((element) => item.itemCode == element.code);
                                homeController.selectedItems.add(
                                  ItemDetails(
                                    name: item.itemName,
                                    code: item.itemCode,
                                    unit: item.unitName,
                                    amount: homeController.paginatedItemsList[index].amount.value,
                                    price: double.parse(item.salesValue.toString()),
                                  ),
                                );
                              } else {
                                homeController.selectedItems.removeWhere(
                                    (element) => item.itemCode == element.code);
                              }
                            },
                          );
                        }
                      });
                    },
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColors.MAIN_COLOR,
                    ),
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
