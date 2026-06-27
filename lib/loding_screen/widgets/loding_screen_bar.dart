import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget buildLodingScreen({required bool lodingScreen}) {
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
