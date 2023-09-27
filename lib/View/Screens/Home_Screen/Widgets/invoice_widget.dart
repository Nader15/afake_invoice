import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Logic/controllers/home_controller.dart';
import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_constants.dart';

class InvoiceWidget extends StatelessWidget {
  InvoiceWidget({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: AppColors.SECOND_COLOR,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              invoiceHeader("أسم الصنف",
                  width: AppConstants.mediaWidth(context) / 5,
                  color: AppColors.WHITE_COLOR,
                  alignment: Alignment.centerRight),
              invoiceHeader(
                "كود الصنف",
                color: AppColors.WHITE_COLOR,
                width: 50,
              ),
              invoiceHeader(
                "الوحدة",
                color: AppColors.WHITE_COLOR,
              ),
              invoiceHeader(
                "الكمية",
                color: AppColors.WHITE_COLOR,
              ),
              invoiceHeader(
                "السعر",
                color: AppColors.WHITE_COLOR,
                width: 50,
              ),
              invoiceHeader(
                "الاعدادات",
                width: AppConstants.mediaWidth(context) / 4,
                color: AppColors.WHITE_COLOR,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: AppConstants.mediaHeight(context)/1.5,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: homeController.selectedItems.length,
            itemBuilder: (context, index) {
              return GetBuilder(
                  init: HomeController(),
                  builder:      (_) {
                    final item = homeController.selectedItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              invoiceHeader(item.itemName ?? "",
                                  width: AppConstants.mediaWidth(context) / 5,
                                  alignment: Alignment.centerRight),
                              invoiceHeader(
                                item.itemCode ?? "",
                                width: 50,
                              ),
                              invoiceHeader(item.unitName ?? ""),
                              invoiceHeader(item.quantity.toString()),
                              invoiceHeader(item.price.toString(), width: 50),
                              increaseAmountWidget(
                                index,
                                context,
                              ),
                            ],
                          ),
                          const Divider(
                            color: AppColors.BLACK_COLOR,
                          ),
                        ],
                      ),
                    );
                  });
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
          ),
        )
      ],
    ),);
  }

  Widget invoiceHeader(
    String title, {
    double? width = 30,
    AlignmentGeometry? alignment = Alignment.center,
    Color? color,
  }) {
    return SizedBox(
      width: width,
      child: Container(
        alignment: alignment,
        child: Text(
          title,
          style: TextStyle(color: color, fontSize: 10),
        ),
      ),
    );
  }

  Widget increaseAmountWidget(
    int index,
    context,
  ) {
    return Obx(() => Container(
      width: AppConstants.mediaWidth(context) / 4,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.GREY_COLOR.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.MAIN_COLOR,
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.keyboard_arrow_up_outlined,
                color: AppColors.WHITE_COLOR,
                // size: 20,
              ),
            ),
            onTap: () {
              homeController.selectedItems[index].quantity = homeController.selectedItems[index].quantity! + 1;
              homeController.selectedItems[index].total = homeController.selectedItems[index].quantity! * homeController.selectedItems[index].price!;
              homeController.selectedItems[index].netPrice = homeController.selectedItems[index].quantity! * homeController.selectedItems[index].price!;
              homeController.selectedPayment.forEach((element) => element["paymentValue"] =homeController.getTotal(),);
              homeController.update();

            },
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 20,
            child: Container(
              alignment: Alignment.center,
              child: Text(homeController.selectedItems[index].quantity.toString()),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.MAIN_COLOR,
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.WHITE_COLOR,
                // size: 20,
              ),
            ),
            onTap: () {
              homeController.selectedItems[index].quantity = homeController.selectedItems[index].quantity! - 1;
              homeController.selectedItems[index].total = homeController.selectedItems[index].quantity! * homeController.selectedItems[index].price!;
              homeController.selectedItems[index].netPrice = homeController.selectedItems[index].quantity! * homeController.selectedItems[index].price!;
              homeController.selectedPayment.forEach((element) => element["paymentValue"] =homeController.getTotal(),);
              homeController.update();
              if (homeController.selectedItems[index].quantity== 0) {
                homeController.selectedItems.removeWhere((element) =>
                homeController.selectedItems[index].itemCode == element.itemCode);
              }
            },
          ),
        ],
      ),
    ),);
  }
}
