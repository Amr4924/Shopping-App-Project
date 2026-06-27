// ---------- Build Title Section ----------
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

Widget buildTitleSection({required String title}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      tr(title),
      style: const TextStyle(color: Color.fromARGB(158, 0, 0, 0), fontSize: 18),
    ),
  );
}
