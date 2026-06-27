// ---------- Build Produts List ----------
import 'package:flutter/cupertino.dart';
import 'package:shop_project/shopping_home/widgets/product_card.dart';


Widget buildProdutsList({
  required BuildContext context,
  required List<Map<String, Object>> products,
}) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.65,
    ),
    shrinkWrap: true, //Used to stop scrolling.
    physics: const NeverScrollableScrollPhysics(), //Used to stop scrolling.
    itemCount: products.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildCardProduct(
            context: context,
            img: products[index]['image'] as String,
            title: products[index]['title'] as String,
          ),
        ),
      );
    },
  );
}