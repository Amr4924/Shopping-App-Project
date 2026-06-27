import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_project/auth/accounts.dart';

import 'package:shop_project/shopping_home/widgets/app_drawer.dart';
import 'package:shop_project/shopping_home/widgets/featured_product.dart';
import 'package:shop_project/shopping_home/widgets/hot_offer_card.dart';
import 'package:shop_project/shopping_home/widgets/section_title.dart';
import 'package:shop_project/shopping_home/widgets/view%20products.dart';
import 'package:shop_project/widgets/language_toggle_button.dart';

class ShoppingHomeScreen extends StatefulWidget {
  const ShoppingHomeScreen({super.key});

  @override
  State<ShoppingHomeScreen> createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen> {
  List<Map<String, Object>> products = [
    {
      'image':
          'https://i.pinimg.com/736x/d1/b5/1e/d1b51edd263cd399c0bda8ca4c9346b1.jpg',
      'title': 'Amiri Style White Tee',
    },
    {
      'image':
          'https://i.pinimg.com/1200x/63/3d/30/633d303d26aac1b973919a97b1a518f8.jpg',
      'title': 'Emerald Green Hoodie Set',
    },
    {
      'image':
          'https://i.pinimg.com/1200x/47/99/99/4799996ef7c0340144c8847e67cab325.jpg',
      'title': 'Bagu Graphic Black Tee',
    },
    {
      'image':
          'https://i.pinimg.com/1200x/59/66/b2/5966b27c9b5743b0149658904617ab5e.jpg',
      'title': 'Frend Green Tee',
    },
    {
      'image':
          'https://i.pinimg.com/736x/5f/f8/d9/5ff8d97347a89db688049b4a1c8c8768.jpg',
      'title': 'Anime Naruto Brown Tee',
    },
    {
      'image':
          'https://i.pinimg.com/webp/1200x/7d/9b/cb/7d9bcb37fcfc256663eabf7337c80547.webp',
      'title': 'Black Graphic Streetwear Set',
    },
    {
      'image':
          'https://i.pinimg.com/webp/1200x/82/e1/01/82e10123dab62352f7167d270ab5a9a1.webp',
      'title': 'Classic Plain Black Tracksuit',
    },
    {
      'image':
          'https://i.pinimg.com/webp/1200x/0e/da/f9/0edaf921a665944b02b9be0000cb6fbe.webp',
      'title': 'Beige Cozy Tracksuit',
    },
    {
      'image':
          'https://i.pinimg.com/736x/3f/41/0a/3f410a02f9514729bf0edf28c9c1e8ef.jpg',
      'title': 'Beige Hoodie Set',
    },
    {
      'image':
          'https://i.pinimg.com/736x/30/5f/a0/305fa0a7cc25bcbea479074c7811d128.jpg',
      'title': 'Charcoal Grey Hoodie Set',
    },
  ];

  List<Map<String, Object>> offers = [
    {
      "imag":
          'https://i.pinimg.com/736x/fa/37/92/fa37922b950ce3ce94d2c82cc81621d6.jpg',
      "dec":
          'Exclusive Deal: Get up to 50% OFF on selected sets for a limited time!',
    },
    {
      "imag":
          'https://i.pinimg.com/736x/e3/32/4b/e3324be6d7fcd42620f05374a8f22d47.jpg',
      "dec":
          'Premium Fabric: Made from ultra-soft, heavy-blend premium cotton to keep you warm and cozy.',
    },
    {
      "imag":
          'https://i.pinimg.com/736x/8b/b5/b9/8bb5b97226bd993ed94f0ef4c774b3de.jpg',
      "dec":
          'Streetwear Aesthetic: Features an oversized unisex hoodie and matching sweatpants for a clean, modern look.',
    },
    {
      "imag":
          'https://i.pinimg.com/736x/cc/2d/6a/cc2d6ad4d8bc7e4418b9bc2b0e6ed2e1.jpg',
      "dec":
          'Limited-Time Deal: Unlocked! Grab our signature anime graphic tee with an exclusive discount today.',
    },
    {
      "imag":
          'https://i.pinimg.com/736x/3e/b1/3b/3eb13bbbfca3f045e725be853983c346.jpg',
      "dec":
          'Weekend Deal: Upgrade your street style with an exclusive discount on this trending matching set!',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 230, 230),
      drawer: buildDrawer(
        context: context,
        img: SaveRecord.photo!,
        email: SaveRecord.email!,
        name: SaveRecord.name!,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF745AF2),
        title: Text(
          tr('title_shopping_home'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [buildButtomTranslation(context: context)],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: Center(
                child: PageView(
                  children: [
                    buildFeaturedProduct(
                      img:
                          'https://i.pinimg.com/webp/1200x/0e/da/f9/0edaf921a665944b02b9be0000cb6fbe.webp',
                    ),
                    buildFeaturedProduct(
                      img:
                          'https://i.pinimg.com/736x/3f/41/0a/3f410a02f9514729bf0edf28c9c1e8ef.jpg',
                    ),
                    buildFeaturedProduct(
                      img:
                          'https://i.pinimg.com/736x/30/5f/a0/305fa0a7cc25bcbea479074c7811d128.jpg',
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildTitleSection(title: 'products'),

          //------- Product display container -------//
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(201, 255, 255, 255),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
            ),
            child: buildProdutsList(context: context, products: products),
          ),
          const SizedBox(height: 30),

          buildTitleSection(title: 'hot_offers'),

          //------- Hot Offers Display Bin -------//
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(201, 255, 255, 255),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: offers.length,
              itemBuilder: (context, index) {
                return buildCardHostOffers(
                  context: context,
                  img: offers[index]['imag'] as String,
                  descripition: offers[index]['dec'] as String,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}