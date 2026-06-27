import 'package:flutter/material.dart';
import 'package:shop_project/loding_screen/widgets/loding_screen_bar.dart';
import 'package:shop_project/welcome_Screen.dart';

class LodingScreen extends StatefulWidget {
  const LodingScreen({super.key});

  @override
  State<LodingScreen> createState() => _LodingScreenState();
}

class _LodingScreenState extends State<LodingScreen> {

  @override
  void initState() {
    super.initState();
    _lodingScreen();
  }

  void _lodingScreen() async {
    await Future.delayed(Duration(seconds: 3));

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildLodingScreen());
  }
}
