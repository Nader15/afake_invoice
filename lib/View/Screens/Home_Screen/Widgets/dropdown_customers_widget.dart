import 'dart:developer';

import 'package:afake_invoice/Utils/app_colors.dart';
import 'package:afake_invoice/Utils/app_constants.dart';
import 'package:afake_invoice/View/Widgets/custom_circle_progress.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Logic/controllers/home_controller.dart';
import '../../../../Models/pos_form_model.dart';

class DropDownCustomersWidget extends StatelessWidget {
  DropDownCustomersWidget({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {

    return Obx(() {
          if (homeController.posFormDataList.isEmpty) {
            return const SizedBox();
          }
          if (homeController.posFormDataList[0].customerList.isEmpty) {
            return const Text('لايوجد عملاء متاحين'); // Handle the case when itemsList is empty
          }
          return SizedBox(
            // height: 40,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.GREY_COLOR)

              ),
              child:  DropdownButtonHideUnderline(
                child: DropdownButton2<CustomerList>(
                  itemHighlightColor: Colors.white,
                  value: homeController.selectCustomer.value,
                  hint:  Text(
                    'العملاء',
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
                  onChanged: (CustomerList? newValue) {
                    homeController.selectCustomer.value = newValue;
                  },
                  items: homeController.posFormDataList[0].customerList.map<DropdownMenuItem<CustomerList>>((CustomerList value) {
                    return DropdownMenuItem<CustomerList>(
                      value: value,
                      child: SizedBox(
                        width: 50,
                        child: Text(
                          '${value.customerName}',
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
          );
        });
  }
}
