import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../widgets/product_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.favorites.isEmpty) {
            return const Center(
              child: Text('No favorites yet', style: TextStyle(fontSize: 18)),
            );
          }

          return ListView.builder(
            itemCount: productProvider.favorites.length,
            itemBuilder: (context, index) {
              final product = productProvider.favorites[index];
              return ProductCard(product: product);
            },
          );
        },
      ),
    );
  }
}
