import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Logic/controllers/home_controller.dart';

import '../../../Utils/app_constants.dart';
import '../../../Utils/app_images.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: AppConstants.mediaHeight(context),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      AppImages.background_image
                  ),
                  fit: BoxFit.cover
              )
          ),

        ),
      ),
    );
  }
}
