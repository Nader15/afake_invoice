import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Models/login_model.dart';
import '../../Models/pos_form_model.dart';
import '../../Services/pos_services.dart';

class HomeController extends GetxController {

  @override
  void onInit() async {
    super.onInit();
    getPosForm();
    scrollController.value = ScrollController();
    scrollController.value.addListener(scrollListener);
  }

  @override
  void onClose() {
    scrollController.value.removeListener(scrollListener);
    scrollController.value.dispose();
    super.onClose();
  }

  var isLoadingPosForm = false.obs;
  var posFormDataList = <PosFormData>[].obs;

  getPosForm() async {
    try {
      isLoadingPosForm(true);
      var result = await PosServices.getPosForm();
      if (result.isSuccess) {
        posFormDataList.value = result.data;
        getPaginatedItemsList();
      }
    } finally {
      isLoadingPosForm(false);
    }
  }

  Rx<ScrollController> scrollController = ScrollController().obs;
  void scrollListener() async{
    if (scrollController.value.position.pixels ==
        scrollController.value.position.maxScrollExtent) {
      // Reached the end of the list, load more data
      getPaginatedItemsList();
    }
  }

  final int pageSize = 10;
  int pageNumber = 1;
  var paginatedItemsList = <ItemsList>[].obs;
  var isLoadingItemsListPagination = false.obs;

  getPaginatedItemsList() async {
    if (!isLoadingItemsListPagination.value) {
      isLoadingItemsListPagination.value = true;
    }
    final List<ItemsList> itemsList = posFormDataList[0].itemsList;
    final int startIndex = (pageNumber - 1) * pageSize;
    int endIndex = startIndex + pageSize;

    if (startIndex >= itemsList.length) {
      isLoadingItemsListPagination.value = false;
      return ;
    }
    if (endIndex > itemsList.length) {
      endIndex = itemsList.length;
    }
    await Future.delayed(Duration(seconds: 1));
    final List<ItemsList> itemsList1 = itemsList.sublist(startIndex, endIndex);
    paginatedItemsList.addAll(itemsList1);
    pageNumber++;
    isLoadingItemsListPagination.value = false;
  }

  var selectedItems = [].obs;
  var selectedPayment = [].obs;

}
