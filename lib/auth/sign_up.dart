// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_project/auth/accounts.dart';
import 'package:shop_project/auth/sign_in.dart';
import 'package:shop_project/shopping_home/shopping_home_screen.dart';
import 'package:shop_project/widgets/language_toggle_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool checkData = true;
  bool hiddenPassword = true;
  bool hiddenConfirmPassword = true;

  void toggleHiddenPassword() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }

  void toggleHiddenConfirmPassword() {
    setState(() {
      hiddenConfirmPassword = !hiddenConfirmPassword;
    });
  }

  void _checkData({required BuildContext contex}) async {
    bool clictrue = true;

    setState(() {
      checkData = !checkData;
    });
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      checkData = !checkData;
    });
    if (!mounted) return;
    await AwesomeDialog(
      context: contex,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      headerAnimationLoop: false,
      btnOkText: tr("home"),
      title: tr('title_dialog'),
      desc: tr('description_dialog'),

      customHeader: Container(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(Icons.check_circle, color: Colors.green, size: 90),
      ),

      btnOkOnPress: () {
        clictrue = false;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ShoppingHomeScreen()),
          (route) => false,
        );
      },
    ).show();
    if (clictrue) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ShoppingHomeScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF745AF2),
      body: Column(
        children: [
          SizedBox(height: 80),
          buildButtomTranslation(context: context),
          Center(
            child: Text(
              tr('sign_up'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                ),
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    //------- Back to login -------
                    ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      ),
                      leading: Icon(Icons.arrow_back, color: Color(0xFF745AF2)),
                      title: Text(
                        tr('back_sign_in'),
                        style: const TextStyle(
                          color: Color(0xFF745AF2),
                          fontSize: 16,
                        ),
                      ),
                    ),

                    // --------- Full Name Field ---------
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        autofocus: true,
                        controller: fullNameController,
                        validator: (value) {
                          String name = value!;
                          if (name.isEmpty) {
                            return tr('empty');
                          } else if (name[0] != name[0].toUpperCase()) {
                            return tr('not_capitalized');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: tr('full_name_labelText'),
                          hintText: tr('full_name_hint'),
                          prefixIcon: const Icon(
                            Icons.person_2_outlined,
                            color: Color(0xFF745AF2),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    // --------- Email Field ---------
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: emailController,
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
                          labelText: tr('email_labelText'),
                          hintText: tr('email_hint'),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color(0xFF745AF2),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    // --------- Password Field ---------
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        obscureText: hiddenPassword,
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
                        decoration: InputDecoration(
                          labelText: tr('password_labelText'),
                          hintText: tr('password_hint'),
                          prefixIcon: const Icon(
                            CupertinoIcons.lock,
                            color: Color(0xFF745AF2),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              toggleHiddenPassword();
                            },
                            icon: hiddenPassword
                                ? const Icon(
                                    Icons.visibility,
                                    color: Color(0xFF745AF2),
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Color(0xFF745AF2),
                                  ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    // --------- Confirm Password Field ---------
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        obscureText: hiddenConfirmPassword,
                        validator: (value) {
                          String password = value!;
                          if (password.isEmpty) {
                            return tr('empty');
                          } else if (password != passwordController.text) {
                            return tr('confirm_password');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: tr('confirm_password_labelText'),
                          hintText: tr('confirm_password_hint'),
                          prefixIcon: const Icon(
                            CupertinoIcons.lock,
                            color: Color(0xFF745AF2),
                          ),

                          suffixIcon: IconButton(
                            onPressed: () {
                              toggleHiddenConfirmPassword();
                            },
                            icon: hiddenConfirmPassword
                                ? const Icon(
                                    Icons.visibility,
                                    color: Color(0xFF745AF2),
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Color(0xFF745AF2),
                                  ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    // --------- Sign Up Button ---------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF745AF2),
                        ),

                        onPressed: !checkData
                            ? null
                            : () {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                if (_formKey.currentState!.validate()) {
                                  //---- Storing registration data---
                                  String name = fullNameController.text;
                                  String email = emailController.text;
                                  String password = passwordController.text;
                                  AuthManager.registerUsers.add(
                                    UserModel(
                                      name: name,
                                      email: email,
                                      password: password,
                                    ),
                                  );
                                  SaveRecord.email = emailController.text;
                                  SaveRecord.name = fullNameController.text;
                                  SaveRecord.photo =
                                      'https://i.pinimg.com/736x/50/88/12/50881235e972feea21d85fc46bb5e301.jpg';
                                  _checkData(contex: context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Color(0xFF745AF2),
                                      content: Text(
                                        tr('snak_bar'),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      duration: Duration(seconds: 2),
                                      action: SnackBarAction(
                                        label: tr('snak_bar_action'),
                                        textColor: Colors.white,
                                        onPressed: () {},
                                      ),
                                    ),
                                  );
                                }
                              },
                        child: checkData
                            ? Text(
                                tr('sign_up'),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : CircularProgressIndicator(color: Colors.white),
                      ),
                    ),
                    //
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
