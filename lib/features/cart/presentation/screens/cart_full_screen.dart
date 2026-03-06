import 'package:ecommerce/core/app_theme.dart';
import 'package:ecommerce/core/provider/models/product.dart';
import 'package:ecommerce/core/provider/products_provider.dart';
import 'package:ecommerce/features/cart/logic/price_calculations.dart';
import 'package:ecommerce/features/cart/presentation/widgets/cart_body.dart';
import 'package:ecommerce/features/cart/presentation/widgets/quantity_btn.dart';
import 'package:ecommerce/features/cart/presentation/widgets/summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_manager.dart';

class CartFullScreen extends StatefulWidget {
  static const routeName = '/cart_full';

  const CartFullScreen({super.key});

  @override
  State<CartFullScreen> createState() => _CartFullScreenState();
}

class _CartFullScreenState extends State<CartFullScreen> {
  @override
  Widget build(BuildContext context) {
   ProductsProvider  productProvider = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("My Cart"),
      ),
      body: Column(
        children: [
Expanded(
  child: ListView.builder(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
    itemCount: productProvider.productsBought.length,
    itemBuilder: (context, index) {
      return CartItemCardUI(item: productProvider.productsBought[index]);
    },
  ),
),
Padding(
  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
  child: Consumer<ProductsProvider>(
    builder: (context, productProvider, child) {
      final price = PriceCalculations(products: productProvider.productsBought);
      return CartSummaryUI(
        price: price,
        onCheckout: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Proceed to Checkout ✅")),
          );
        },
      );
    },
  ),
),
        ],
      ),
    );
  }
}

