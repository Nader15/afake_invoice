import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Logic/controllers/home_controller.dart';
import 'items_list_widget.dart';

class ItemsDataListWidget extends StatelessWidget {
  ItemsDataListWidget({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.posFormDataList.isEmpty) {
        return const SizedBox();
      } else {
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, dataIndex) {
            return ItemsListWidget();
          },
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemCount: homeController.posFormDataList.length,
        );
      }
    });
  }
}
