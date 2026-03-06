import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import 'cart_manager.dart';
class CartFullScreen extends StatefulWidget {
  static const routeName = '/cart-full';

  const CartFullScreen({super.key});

  @override
  State<CartFullScreen> createState() => _CartFullScreenState();
}

class _CartFullScreenState extends State<CartFullScreen> {
  @override
  Widget build(BuildContext context) {
    final items = CartManager.selectedItems;
    

    const shipping = 10.00;
    final subtotal = items.fold<double>(0, (s, i) => s + (i.price * i.qty));
    final total = subtotal + shipping;

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
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _CartItemCardUI(item: items[index], onChanged: () {
                setState(() {}); // This tells the whole screen to redraw when a button is clicked
                },);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: _CartSummaryUI(
              subtotal: subtotal,
              shipping: shipping,
              total: total,
              onCheckout: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Proceed to Checkout ✅")),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



class _CartItemCardUI extends StatelessWidget {
  final CartItem item;
  final VoidCallback onChanged; //
  const _CartItemCardUI({required this.item, required this.onChanged});


  @override
  Widget build(BuildContext context) {
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
                  item.image,
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
                    "\$${item.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.tealAccent,
                    ),
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
                        _QtyBtnUI(icon: Icons.remove, onTap: () {if (item.qty > 1) {
                            item.qty--;
                            onChanged(); // Refresh the screen
                          }}),
                        const SizedBox(width: 14),
                        Text(
                          "${item.qty}",
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(width: 14),
                        _QtyBtnUI(icon: Icons.add, onTap: () {item.qty++;
                          onChanged();}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {CartManager.selectedItems.remove(item);
                onChanged(); },
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              tooltip: "Remove",
            ),
          ],
        ),
      ),
    );
  }
}

class _QtyBtnUI extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyBtnUI({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppTheme.tealAccent.withOpacity(0.35)),
        ),
        child: Icon(icon, size: 18, color: AppTheme.tealAccent),
      ),
    );
  }
}

class _CartSummaryUI extends StatelessWidget {
  final double subtotal;
  final double shipping;
  final double total;
  final VoidCallback onCheckout;

  const _CartSummaryUI({
    required this.subtotal,
    required this.shipping,
    required this.total,
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
            _row("Subtotal", "\$${subtotal.toStringAsFixed(2)}"),
            const SizedBox(height: 8),
            _row("Shipping", "\$${shipping.toStringAsFixed(2)}"),
            const SizedBox(height: 12),
            Divider(height: 1, color: Colors.grey.shade200),
            const SizedBox(height: 12),
            _row("Total", "\$${total.toStringAsFixed(2)}", bold: true),
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