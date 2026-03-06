import 'package:ecommerce/core/provider/products_provider.dart';
import 'package:ecommerce/features/cart/presentation/screens/cart_empty_screen.dart';
import 'package:ecommerce/features/cart/presentation/screens/cart_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartManager extends StatelessWidget {
  static const String routeName = '/cart_manager';

  @override
  Widget build(BuildContext context) {
    ProductsProvider productProvider = Provider.of<ProductsProvider>(context);
    return productProvider.productsBought.isEmpty
        ? CartEmptyScreen()
        : CartFullScreen();
  }
}
