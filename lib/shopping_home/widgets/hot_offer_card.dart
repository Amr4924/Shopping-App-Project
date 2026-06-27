// ---------- Build Card Host Offers ----------
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget buildCardHostOffers({
  required BuildContext context,
  required String img,
  required String descripition,
}) {
  return SizedBox(
    width: double.infinity,
    height: 300,
    child: Card(
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
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              tr(descripition),
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}