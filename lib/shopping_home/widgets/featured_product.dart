// ---------- Build Featured Product ----------
import 'package:flutter/material.dart';

Widget buildFeaturedProduct({required String img}) {
  return Container(
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(40),
    ),
    child: Image.network(
      img,
      fit: BoxFit.cover,
      width: double.infinity,
      alignment: Alignment.topCenter,
    ),
  );
}