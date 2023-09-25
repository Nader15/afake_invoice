import 'package:afake_invoice/View/Widgets/custom_circle_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Logic/controllers/home_controller.dart';
import '../../../Routes/routes.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/snackbar.dart';
import '../../Widgets/custom_button.dart';
import 'Widgets/dropdown_customers_widget.dart';
import 'Widgets/dropdown_products_widget.dart';
import 'Widgets/dropdown_stores_widget.dart';
import 'Widgets/invoice_widget.dart';
import 'Widgets/payment_type_selection_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            DropDownProductsWidget(),
                            const SizedBox(width: 10),
                            DropDownCustomersWidget(),
                            const SizedBox(width: 10),
                            DropDownStoresWidget(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      PaymentTypeSelectionWidget(),

                      const SizedBox(height: 10),

                      InvoiceWidget(),

                      // ItemsListWidget(),
                      // if (homeController.isLoadingItemsListPagination.value)
                      //   const CustomCircleProgress(),
                      // PaymentListWidget(),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            homeController.selectedItems.clear();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            color: AppColors.RED_COLOR,
                            child: Text(
                              "الغاء",
                              style: TextStyle(color: AppColors.WHITE_COLOR),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            color: AppColors.MAIN_COLOR,
                            child: Text(
                              "دفع",
                              style: TextStyle(color: AppColors.WHITE_COLOR),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          color: AppColors.SECOND_COLOR,
                          child: GetBuilder(
                            init: HomeController(),
                            builder: (_) => Obx(() => Text(
                              homeController.getTotal().toString(),
                              style: TextStyle(color: AppColors.WHITE_COLOR),
                            )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Obx(
              () => homeController.isLoadingPosForm.value
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCircleProgress(),
                        SizedBox(
                          height: 10,
                        ),
                        Text("جاري تحميل البيانات ...")
                      ],
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }

}
