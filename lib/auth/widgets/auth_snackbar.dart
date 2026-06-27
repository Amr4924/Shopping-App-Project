// -------- Build Show Snak Bar -------//
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

SnackBar buildShowSnakBar({
  required BuildContext context,
  required String message,
  required String actionText,
  VoidCallback? action,
}) {
  return SnackBar(
    backgroundColor: Color(0xFF745AF2),
    content: Text(tr(message), style: const TextStyle(color: Colors.white)),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: tr(actionText),
      textColor: Colors.white,
      onPressed: action ?? () {},
    ),
  );
}
