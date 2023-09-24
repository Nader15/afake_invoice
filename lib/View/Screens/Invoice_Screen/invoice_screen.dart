import 'package:afake_invoice/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Logic/controllers/home_controller.dart';
import '../../../Utils/app_colors.dart';

class InvoiceScreen extends StatelessWidget {
  InvoiceScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.MAIN_COLOR,
        title: const Text("الفاتورة"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [

                      Text("رقم الفاتورة",style: TextStyle(fontWeight: FontWeight.bold,),),
                      Text("${homeController.posFormDataList[0].posReportNo}"),
                    ],
                  ),Column(
                    children: [
                      Text("العميل",style: TextStyle(fontWeight: FontWeight.bold,),),
                      Text("${homeController.posFormDataList[0].storeName}"),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.BLACK_COLOR,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: AppConstants.mediaWidth(context) / 3.5,
                      child: Text("أسم الصنف"),
                    ),
                    Text("كود الصنف"),
                    Text("الوحدة"),
                    Text("الكمية"),
                    Text("السعر"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (homeController.selectedItems.isEmpty) {
                  return const SizedBox();
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: homeController.selectedItems.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        final item = homeController.selectedItems[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppConstants.mediaWidth(context) / 4,
                                    child: Text(item.name??""),
                                  ),
                                  Text(item.code??""),
                                  Text(item.unit??""),
                                  Text(item.amount.toString()),
                                  Text(item.price.toString()),
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
                  );
                }
              }),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text("الإجمالي: ",style: TextStyle(fontWeight: FontWeight.bold,),),
                  Text("${homeController.getTotal()}"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text("طريقة الدفع: ",style: TextStyle(fontWeight: FontWeight.bold,),),
                  Row(
                    children: homeController.selectedPayment.map((element) => Text("${element},")).toList(),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
