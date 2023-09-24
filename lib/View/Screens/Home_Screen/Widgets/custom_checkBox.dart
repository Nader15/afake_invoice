import 'package:afake_invoice/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({Key? key, required this.title,  this.subtitle,  this.trailing, required this.onChanged, required this.selectBox}) : super(key: key);
  final String title;
  final String? subtitle;
  final String? trailing;
  final ValueChanged<bool> onChanged;

  final bool selectBox;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: selectBox,
        onChanged: (val) => onChanged(val ?? false),
        activeColor: AppColors.MAIN_COLOR,
        fillColor: MaterialStateProperty.all(AppColors.MAIN_COLOR),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 12),
      ),
      subtitle: Text(
        subtitle??"",
        style: const TextStyle(fontSize: 12),
      ),
      trailing: Text(
        trailing??"",
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
