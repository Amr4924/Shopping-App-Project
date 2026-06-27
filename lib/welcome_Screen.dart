import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_project/auth/sign_in.dart';
import 'package:shop_project/auth/sign_up.dart';
import 'package:shop_project/featur.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void loginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void signupScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBarr(context: context),

      body: Center(
        child: Column(
          children: [
            _bringPhotos(
              img: Image.asset(
                'assets/img/img_welcom_screen.png',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 1,
              child: _buildWelcomeSection(
                signIn: loginScreen,
                signUp: signupScreen,
                context: context,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _bringPhotos({required Image img}) {
  return Expanded(
    child: Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Center(child: img),
    ),
  );
}

Widget _buildWelcomeSection({
  required VoidCallback signIn,
  required VoidCallback signUp,
  required BuildContext context,
}) {
  return Container(
    width: double.infinity,
    color: Colors.white,
    child: Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              tr("title_apps"),
              style: TextStyle(
                color: Color(0xFF745AF2),
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              tr("description"),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 20),
          _buildButtons(
            action: signIn,
            context: context,
            title: 'sign_in',
            color: Color(0xFF745AF2),
          ),
          _buildButtons(
            action: signUp,
            context: context,
            title: 'sign_up',
            color: Color.fromARGB(142, 86, 67, 181),
          ),
        ],
      ),
    ),
  );
}

PreferredSizeWidget _buildAppBarr({required BuildContext context}) {
  return AppBar(
    backgroundColor: Color(0xFF745AF2),
    iconTheme: IconThemeData(color: Colors.white),
    title: Text(
      tr('title_apps'),
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {
          toggleTranslation(context);
        },
        icon: Icon(Icons.language),
      ),
    ],
  );
}

Widget _buildButtons({
  required BuildContext context,
  required String title,
  required VoidCallback action,
  required Color color,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: const Size(250, 50),
      ),
      onPressed: () {
        action();
      },
      child: Text(
        tr(title),
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
