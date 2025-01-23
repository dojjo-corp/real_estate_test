import 'package:flutter/material.dart';
import 'package:real_estate_test/global/constants.dart';

void showSnackBar(
  BuildContext context, {
  required String message,
  AlertType? alertType,
}) {
  final typeMap = {
    AlertType.error: Colors.red.withValues(alpha: 0.8),
    AlertType.alert: Theme.of(context).primaryColor,
  };

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      backgroundColor: typeMap[alertType ?? AlertType.alert],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withValues(alpha: 0.5),
    builder: (context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              CircularProgressIndicator(),
              Text("Loading..."),
            ],
          ),
        ),
      );
    },
  );
}
