// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_project/auth/sign_up.dart';
import 'package:shop_project/auth/widgets/create_account_row.dart';
import 'package:shop_project/auth/widgets/sign_in_button.dart';
import 'package:shop_project/shopping_home/shopping_home_screen.dart';
import 'package:shop_project/widgets/language_toggle_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidenPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool checkData = true;

  void _checkData({required BuildContext context}) async {
    bool click = true;
    setState(() {
      checkData = false;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      checkData = true;
    });
    if (!mounted) return;

    await AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      headerAnimationLoop: false,
      btnOkText: tr("done"),
      title: tr('title_dialog'),
      desc: tr('Successful_login'),

      customHeader: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check_circle, color: Colors.green, size: 90),
      ),

      btnOkOnPress: () {
        click = false;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ShoppingHomeScreen()),
          (route) => false,
        );
      },
    ).show();
    if (click) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ShoppingHomeScreen()),
        (route) => false,
      );
    }
  }

  void toggleHidenPassword() {
    setState(() {
      hidenPassword = !hidenPassword;
    });
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF745AF2),
      body: Column(
        children: [
          SizedBox(height: 70),
          buildButtomTranslation(context: context),
          Center(
            child: Text(
              tr('sign_in'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(135),
                ),
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        tr("welcome"),
                        style: const TextStyle(
                          color: Color(0xFF745AF2),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),

                    // --------- Email Field ---------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        autofocus: true,
                        validator: (value) {
                          String email = value!;
                          if (email.isEmpty) {
                            return tr('empty');
                          } else if (!email.contains('@')) {
                            return tr('correct_email');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: tr("email"),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: tr("email"),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color(0xFF745AF2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),

                    // --------- Password Field ---------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          String password = value!;
                          if (password.isEmpty) {
                            return tr('empty');
                          } else if (password.length < 6) {
                            return tr('password_length');
                          }
                          return null;
                        },
                        obscureText: hidenPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: tr("password"),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: tr("password"),
                          prefixIcon: const Icon(
                            CupertinoIcons.lock,
                            color: Color(0xFF745AF2),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              toggleHidenPassword();
                            },
                            icon: hidenPassword
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // --------- Sign In Buttom ---------
                    buildSignInButtom(
                      check: () => _checkData(context: context),
                      checkData: checkData,
                      context: context,
                      emailController: emailController,
                      formKey: _formKey,
                      passwordController: passwordController,
                      navigateToSignUp: () => navigateToSignUp(context),
                    ),
                    SizedBox(height: 20),
                    buildCreateAcction(context: context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

