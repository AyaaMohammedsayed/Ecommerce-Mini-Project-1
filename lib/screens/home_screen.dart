import 'package:flutter/material.dart';
import 'package:ecommerce/screens/cart_empty_screen.dart';
class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  final List<Map<String, String>> products = const [
    {
      "name": "Wireless Headphones",
      "price": "79.99",
      "category": "Electronics",
      "image": "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&q=80",
    },
    {
      "name": "Smart Watch",
      "price": "199.99",
      "category": "Electronics",
      "image": "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&q=80",
    },
    {
      "name": "Leather Backpack",
      "price": "120.00",
      "category": "Accessories",
      "image": "https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=500&q=80",
    },
    {
      "name": "Laptop Computer",
      "price": "999.99",
      "category": "Electronics",
      "image": "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=500&q=80",
    },
    {
      "name": "Cotton T-Shirt",
      "price": "19.99",
      "category": "Fashion",
      "image": "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500&q=80",
    },
    {
      "name": "Running Shoes",
      "price": "89.99",
      "category": "Footwear",
      "image": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&q=80",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ShopHub", style: TextStyle(color: Colors.black),), 
            Text(
              "Fresh picks daily", 
              style: TextStyle(color: Color(0xFF009688), fontSize: 10)
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home, color: primaryColor),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, CartEmptyScreen.routeName), 
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.grey),
          ),
          const SizedBox(width: 10),
        ],
      ),
      
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 90,
                color: const Color(0xFF009688),
                padding: const EdgeInsets.only(left: 20, bottom: 25),
                alignment: Alignment.bottomLeft,
                child: Text('Menu', style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.home_outlined, color: Color(0xFF009688),),
                title: Text('Home', style: TextStyle(color: Colors.black, fontSize: 16),),
                onTap: () => Navigator.pop(context),
              ),
              
              ListTile(
                leading: Icon(Icons.shopping_cart_outlined, color: Color(0xFF009688),),
                title: Text('Cart', style: TextStyle(color: Colors.black, fontSize: 16),),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, CartEmptyScreen.routeName);
                  
                }
                )
              
          ],) ,
        ),
      ),
      
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: "Search products...",
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip("All", isSelected: true),
                    _buildCategoryChip("Electronics"),
                    _buildCategoryChip("Fashion"),
                    _buildCategoryChip("Accessories"),
                    _buildCategoryChip("Footwear"),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              const Text("Our Products", style: TextStyle(color: Colors.grey, fontSize: 14)),
              const Text(
                "Special For You",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),


              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return _buildProductCard(products[index], primaryColor, context);
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF0F0F0) : Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product, Color themeColor, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(product['image']!, fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product['name']!, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1),
                Text("\$${product['price']}", style: TextStyle(color: themeColor, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${product['name']} added!"),
                          backgroundColor: themeColor.withOpacity(0.9),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.all(15),
                        ),
                      );
                    },
                    child: const Text("Add", style: TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}