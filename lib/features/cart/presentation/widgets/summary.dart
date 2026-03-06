import 'dart:ui';

import 'package:ecommerce/core/app_theme.dart';
import 'package:ecommerce/features/cart/logic/price_calculations.dart';
import 'package:flutter/material.dart';

class CartSummaryUI extends StatelessWidget {
  PriceCalculations price;
  final VoidCallback onCheckout;

   CartSummaryUI({
 required this .price,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _row("Subtotal", "\$${price.subtotal.toStringAsFixed(2)}"),
            const SizedBox(height: 8),
            _row("Shipping", "\$${price.shipping.toStringAsFixed(2)}"),
            const SizedBox(height: 12),
            Divider(height: 1, color: Colors.grey.shade200),
            const SizedBox(height: 12),
            _row("Total", "\$${price.total.toStringAsFixed(2)}", bold: true),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: onCheckout,
                child: const Text("Proceed to Checkout"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String left, String right, {bool bold = false}) {
    return Row(
      children: [
        Text(left, style: const TextStyle(color: Colors.black54, fontSize: 13)),
        const Spacer(),
        Text(
          right,
          style: TextStyle(
            fontSize: 13,
            fontWeight: bold ? FontWeight.w900 : FontWeight.w700,
            color: bold ? AppTheme.tealAccent : Colors.black87,
          ),
        ),
      ],
    );
  }
}
