import 'package:blank_photos/commons/theme.dart';
import 'package:flutter/material.dart';

class SnackBarMessage {
  SnackBarMessage({
    required this.status,
    required this.message,
  });

  bool status = true;
  String message = "";

  SnackBar getSnackBar() {
    return SnackBar(
      content: Text(message),
      backgroundColor: status ? ColorsTheme.success : ColorsTheme.danger,
    );
  }
}
