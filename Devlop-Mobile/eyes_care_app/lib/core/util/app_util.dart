import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtil {
  
  static void showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(
        message.tr,
        style: Get.textTheme.bodyMedium!.copyWith(
          color: Colors.white,
        ),
      ),
      backgroundColor: isError ? Get.theme.colorScheme.error : Colors.green,
      duration: const Duration(seconds: 4),
      behavior: SnackBarBehavior.fixed,
    ));
  }
}
