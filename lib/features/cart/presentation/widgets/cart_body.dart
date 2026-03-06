import 'package:ecommerce/core/app_theme.dart';
import 'package:ecommerce/core/provider/models/product.dart';
import 'package:ecommerce/core/provider/products_provider.dart';
import 'package:ecommerce/features/cart/presentation/widgets/quantity_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemCardUI extends StatelessWidget {
  final Product item;
  CartItemCardUI({required this.item});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, productProvider, child) {
        return Card(
          margin: const EdgeInsets.only(bottom: 14),
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
         
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: 78,
                    height: 78,
                    color: Colors.grey.shade100,
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stack) {
                        return const Center(
                          child: Icon(Icons.image_not_supported_outlined),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
        
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "\$${item.price}",
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppTheme.tealAccent),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                     QuantityBtn(
  icon: Icons.remove,
  onTap: () {
    productProvider.decreaseQuantity(item.id);
  },
),
                            const SizedBox(width: 14),
                            Text("${item.quantity}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                            const SizedBox(width: 14),
                    QuantityBtn(
  icon: Icons.add,
  onTap: () {
    productProvider.increaseQuantity(item.id);
  },
),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              
                IconButton(
                  onPressed: () {
                    productProvider.deleteProduct(item.id);
                  },
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  tooltip: "Remove",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}