import 'package:flutter/material.dart';

class CartFullScreen extends StatelessWidget {
  const CartFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <_CartUiItem>[
      _CartUiItem(
        name: "Wireless Headphones",
        price: 299.99,
        imageAsset: "assets/wirelessheadphones.jpg",
        qty: 1,
      ),
      _CartUiItem(
        name: "Smart Watch",
        price: 399.99,
        imageAsset: "assets/smartwatch.jpg",
        qty: 4,
      ),
      _CartUiItem(
        name: "Designer Backpack",
        price: 129.99,
        imageAsset: "assets/backbag.jpg",
        qty: 1,
      ),
      _CartUiItem(
        name: "Type C Charger ",
        price: 100,
        imageAsset: "assets/charger.jpg",
        qty: 2,
      ),
    ];

    const shipping = 10.00;
    final subtotal = items.fold<double>(0, (s, i) => s + (i.price * i.qty));
    final total = subtotal + shipping;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("My Cart", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _CartItemCardUI(item: items[index]);
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

class _CartUiItem {
  final String name;
  final double price;
  final String imageAsset;
  final int qty;

  _CartUiItem({
    required this.name,
    required this.price,
    required this.imageAsset,
    required this.qty,
  });
}

class _CartItemCardUI extends StatelessWidget {
  final _CartUiItem item;
  const _CartItemCardUI({required this.item});

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
                color: const Color(0xFFF1F3F6),
                child: Image.asset(
                  item.imageAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stack) {
                    return const Center(child: Icon(Icons.image_not_supported_outlined));
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
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "\$${item.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF16B86B),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F3F6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _QtyBtnUI(icon: Icons.remove, onTap: () {}),
                        const SizedBox(width: 14),
                        Text(
                          "${item.qty}",
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(width: 14),
                        _QtyBtnUI(icon: Icons.add, onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
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
          border: Border.all(color: const Color(0xFFE1E6EE)),
        ),
        child: Icon(icon, size: 18),
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
            const Divider(height: 1),
            const SizedBox(height: 12),
            _row("Total", "\$${total.toStringAsFixed(2)}", bold: true),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: onCheckout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B6FF5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
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
          ),
        ),
      ],
    );
  }
}