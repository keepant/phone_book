import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customDialog({
  String? title,
  Widget? content,
  GestureTapCallback? onPressed,
  String? continueText,
}) async {
  Widget cancelButton = TextButton(
    child: Text('Cancel'),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    child: Text('${continueText ?? 'Yes'}'),
    onPressed: onPressed,
  );
  AlertDialog alert = AlertDialog(
    title: Text(title ?? 'Info'),
    content: content,
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  Get.dialog(alert);
}
