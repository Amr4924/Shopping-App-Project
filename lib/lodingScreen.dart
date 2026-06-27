import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_project/welcome_Screen.dart';

class LodingScreen extends StatefulWidget {
  const LodingScreen({super.key});

  @override
  State<LodingScreen> createState() => _LodingScreenState();
}

class _LodingScreenState extends State<LodingScreen> {
  bool lodingScreen = true;
  @override
  void initState() {
    super.initState();
    _lodingScreen();
  }

  void _lodingScreen() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      lodingScreen = !lodingScreen;

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildLodingScreen(lodingScreen: lodingScreen));
  }
}

Widget _buildLodingScreen({required bool lodingScreen}) {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              tr('welcome_app'),
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: !lodingScreen ? 0.0 : 0.99),

              duration: Duration(seconds: 3),

              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                  minHeight: 8,
                  color: Color(0xFF745AF2),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TweenAnimationBuilder<int>(
              tween: IntTween(begin: 0, end: !lodingScreen ? 0 : 100),
              duration: Duration(seconds: 3),
              builder: (context, value, child) {
                return Text(
                  "$value%",
                  style: const TextStyle(
                    fontFamily: 'Suwannaphum', // الخط المطلوب في التكليف
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF745AF2),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
