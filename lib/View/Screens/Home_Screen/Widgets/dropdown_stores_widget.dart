import 'dart:developer';

import 'package:afake_invoice/Utils/app_colors.dart';
import 'package:afake_invoice/Utils/app_constants.dart';
import 'package:afake_invoice/View/Widgets/custom_circle_progress.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Logic/controllers/home_controller.dart';
import '../../../../Models/pos_form_model.dart';

class DropDownStoresWidget extends StatelessWidget {
  DropDownStoresWidget({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {

    return Obx(() {
          if (homeController.posFormDataList.isEmpty) {
            return const SizedBox();
          }
          if (homeController.posFormDataList[0].storesList.isEmpty) {
            return const Text('لايوجد مخازن متاحة'); // Handle the case when itemsList is empty
          }
          return Expanded(child: SizedBox(
            // height: 40,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.GREY_COLOR)

              ),
              child:  DropdownButtonHideUnderline(
                child: DropdownButton2<StoresList>(
                  itemHighlightColor: Colors.white,
                  value: homeController.selectStore,
                  hint:  Text(
                    'المخازن',
                    style: TextStyle(
                      color: AppColors.BLACK_COLOR,
                    ),
                  ),
                  icon:  SizedBox(),
                  buttonHeight: 40,
                  style: TextStyle(fontSize: 12),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: Colors.grey.shade200,
                  ),
                  onChanged: (StoresList? newValue) {
                    homeController.selectStore = newValue;

                  },
                  items: homeController.posFormDataList[0].storesList.map<DropdownMenuItem<StoresList>>((StoresList value) {
                    return DropdownMenuItem<StoresList>(
                      value: value,
                      child: SizedBox(
                        width: 50,
                        child: Text(
                          '${value.storeName}',
                          style:  TextStyle(
                              color: AppColors.BLACK_COLOR,
                              fontSize: 10
                            // backgroundColor: whiteColor,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ));
        });
  }
}
