// -------- Build Sign In Buttom -------//
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_project/auth/accounts.dart';
import 'package:shop_project/auth/widgets/auth_snackbar.dart';

Widget buildSignInButtom({
  required BuildContext context,
  required bool checkData,
  required GlobalKey<FormState> formKey,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required VoidCallback check,
  required VoidCallback navigateToSignUp,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF745AF2)),
      onPressed: !checkData
          ? null
          : () {
              ScaffoldMessenger.of(context).clearSnackBars();
              if (formKey.currentState!.validate()) {
                if (AuthManager.registerUsers.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    buildShowSnakBar(
                      context: context,
                      message: 'snak_bar_not_account',
                      actionText: 'snak_bar_action_not_account',
                      action: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        navigateToSignUp();
                      },
                    ),
                  );
                  return;
                }
                try {
                  var loggedInUser = AuthManager.registerUsers.firstWhere(
                    (element) =>
                        element.email == emailController.text.trim() &&
                        element.password == passwordController.text,
                  );

                  SaveRecord.email = loggedInUser.email;
                  SaveRecord.name = loggedInUser.name;
                  SaveRecord.photo =
                      'https://i.pinimg.com/736x/50/88/12/50881235e972feea21d85fc46bb5e301.jpg';
                  check();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    buildShowSnakBar(
                      context: context,
                      message: 'snak_bar_Incorrect_data',
                      actionText: 'snak_bar_action',
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  buildShowSnakBar(
                    context: context,
                    message: 'snak_bar',
                    actionText: 'snak_bar_action',
                  ),
                );
              }
            },
      child: checkData
          ? Text(
              tr('sign_in'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          : CircularProgressIndicator(color: Colors.white),
    ),
  );
}