import 'dart:developer';

import 'package:afake_invoice/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Logic/controllers/home_controller.dart';
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
              title: Text(
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
                            trailing: homeController
                                .paginatedItemsList[index].itemId
                                .toString()
                                .split(".")[0],
                            selectBox: homeController.selectedItems.contains(item.itemId),
                            onChanged: (bool value) {
                              if (value) {
                                homeController.selectedItems.add(item.itemId);
                              } else {
                                homeController.selectedItems.remove(item.itemId);
                              }
                              log("selectedItems --> ${homeController.selectedItems.toString()}");
                            },
                          );
                        }
                      });
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
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
