// ---------- Build Build Drawer  ----------
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_project/auth/sign_in.dart';

Widget buildDrawer({
  required String img,
  required String name,
  required String email,
  required BuildContext context,
}) {
  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      children: [
        SizedBox(height: 20),
        CircleAvatar(radius: 90, backgroundImage: NetworkImage(img)),
        ListTile(
          title: Text(name),
          leading: const Icon(Icons.person, color: Color(0xFF745AF2)),
        ),
        ListTile(
          title: Text(email),
          leading: const Icon(Icons.email_outlined, color: Color(0xFF745AF2)),
        ),
        Divider(height: 20),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          title: Text(
            tr('log_out'),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: const Icon(Icons.logout_outlined),
        ),
      ],
    ),
  );
}
