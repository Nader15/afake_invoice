import 'dart:developer';

import 'package:afake_invoice/Utils/app_colors.dart';
import 'package:afake_invoice/View/Widgets/custom_circle_progress.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Logic/controllers/home_controller.dart';
import '../../../../Models/pos_form_model.dart';
import '../../../../Utils/app_constants.dart';

class DropDownProductsWidget extends StatelessWidget {
  DropDownProductsWidget({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {

    return Obx(() {
          if (homeController.posFormDataList.isEmpty) {
            return const SizedBox();
          }
          if (homeController.posFormDataList[0].itemsList.isEmpty) {
            return const Text('لايوجد منتجات متاحة'); // Handle the case when itemsList is empty
          }
          return Expanded(child: SizedBox(
            // height: 40,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.GREY_COLOR)

              ),
              child:  DropdownButtonHideUnderline(
                child: DropdownButton2<ItemsList>(
                  itemHighlightColor: Colors.white,
                  value: homeController.selectItem,
                  hint:  Text(
                    'المنتجات',
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
                  onChanged: (ItemsList? newValue) async{
                    log("newValue --> ${newValue!.itemId}");
                    homeController.selectedItems.add(
                      ItemDetails(
                        name: newValue!.itemName,
                        code: newValue.itemCode,
                        unit: newValue.unitName,
                        amount: 1,
                        price: double.parse(newValue.salesValue.toString()),
                      ),
                    );
                    await    homeController.getTotal();
                  },
                  items: homeController.posFormDataList[0].itemsList.map<DropdownMenuItem<ItemsList>>((ItemsList value) {
                    return DropdownMenuItem<ItemsList>(
                      value: value,
                      child: SizedBox(
                        width: 50,
                        child: Text(
                          '${value.itemName}',
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
          ),);
        });
  }
}
