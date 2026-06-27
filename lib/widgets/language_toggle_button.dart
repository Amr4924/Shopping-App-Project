// -------- Build Buttom Translation -------//
import 'package:flutter/material.dart';
import 'package:shop_project/featur.dart';

Widget buildButtomTranslation({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      IconButton(
        onPressed: () {
          toggleTranslation(context);
        },
        icon: const Icon(Icons.language, color: Colors.white),
      ),
    ],
  );
}