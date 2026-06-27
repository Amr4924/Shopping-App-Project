// -------- Build Create Acction -------//
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_project/auth/sign_up.dart';

Widget buildCreateAcction({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(tr('directing'), style: const TextStyle(fontSize: 16)),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpScreen()),
          );
        },
        child: Text(
          tr('sign_up'),
          style: const TextStyle(
            color: Color(0xFF745AF2),
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );
}
