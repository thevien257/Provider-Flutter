import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import 'product_card.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Consumer - Chỉ rebuild khi ProductProvider thay đổi
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        return ListView.builder(
          itemCount: productProvider.products.length,
          itemBuilder: (context, index) {
            final product = productProvider.products[index];
            return ProductCard(product: product);
          },
        );
      },
    );
  }
}
