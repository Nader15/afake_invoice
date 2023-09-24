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
      backgroundColor: AppColors.MAIN_COLOR,
      appBar: AppBar(
        title: const Text("الفاتورة"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
