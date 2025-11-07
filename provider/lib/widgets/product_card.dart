import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(product.image, style: const TextStyle(fontSize: 24)),
        ),
        title: Text(product.name),
        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Favorite Button
            Consumer<ProductProvider>(
              builder: (context, productProvider, child) {
                final isFav = productProvider.isFavorite(product);
                return IconButton(
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? Colors.red : null,
                  ),
                  onPressed: () {
                    productProvider.toggleFavorite(product);
                  },
                );
              },
            ),
            // Add to Cart Button
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Sử dụng Provider.of với listen: false khi không cần rebuild
                Provider.of<CartProvider>(
                  context,
                  listen: false,
                ).addItem(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} added to cart!'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
