import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

snackBar({String title = 'Info', @required message}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.black,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(bottom: 50),
  );
}
