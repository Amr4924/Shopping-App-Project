// ---------- Build Card Product ----------
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget buildCardProduct({
  required BuildContext context,
  required String img,
  required String title,
}) {
  return Card(
    color: Colors.white,
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Center(
            child: Image.network(
              img,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    tr('snak_bar_cart'),
                    style: const TextStyle(color: Colors.white),
                  ),
                  duration: const Duration(milliseconds: 1500),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF745AF2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}