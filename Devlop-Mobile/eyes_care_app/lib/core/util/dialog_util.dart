import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../localization/app_localization.dart';
import '../../widgets/animation_widgets/scale_down_transition.dart';

class DialogUtil {
  static confirmDialog({
    String? title,
    String? message,
    void Function()? onSubmit,
    Widget? content,
    bool isShowCancelButton = true,
    String? cancelButtonText,
    String? submitText,
  }) {
    return Get.defaultDialog(
      backgroundColor: Get.theme.dialogBackgroundColor,
      title: title ?? "",
      titlePadding: title == null ? EdgeInsets.zero : null,
      titleStyle:
          TextStyle(color: Get.theme.primaryColor, fontWeight: FontWeight.bold),
      middleText: message ?? "",
      content: content,
      actions: [
        Container(
          width: !isShowCancelButton ? Get.width : null,
          padding: !isShowCancelButton
              ? const EdgeInsets.symmetric(horizontal: 20)
              : null,
          child: ScaleDownTransitionWidget(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Get.theme.primaryColor,
              ),
              onPressed: onSubmit,
              child: Text(
                submitText ?? AppLocalization.submit.tr,
                style: Get.theme.primaryTextTheme.labelSmall,
              ),
            ),
          ),
        ),
        if (isShowCancelButton)
          ScaleDownTransitionWidget(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Get.theme.primaryColor,
              ),
              onPressed: () => Get.back(),
              child: Text(
                cancelButtonText ?? AppLocalization.cancel.tr,
                style: Get.theme.primaryTextTheme.labelSmall,
              ),
            ),
          )
      ],
    );
  }
}
