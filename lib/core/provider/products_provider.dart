import 'package:ecommerce/core/provider/models/product.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  List _productsBought = [];
  final List<Product> _allProducts = [
    Product(
      id: "1",
      category: "Electronics",
      imageUrl:
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&q=80",
      name: "Wireless Headphones",
      price: "79.99",
    ),
    Product(
      id: "2",
      category: "Electronics",
      imageUrl:
          "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&q=80",
      name: "Smart Watch",
      price: "199.99",
    ),
    Product(
      id: "3",
      category: "Accessories",
      imageUrl:
          "https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=500&q=80",
      name: "Leather Backpack",
      price: "120.00",
    ),
    Product(
      id: "4",
      category: "Electronics",
      imageUrl:
          "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=500&q=80",
      name: "Laptop Computer",
      price: "999.99",
    ),
    Product(
      id: "5",
      category: "Fashion",
      imageUrl:
          "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500&q=80",
      name: "Cotton T-Shirt",
      price: "19.99",
    ),
    Product(
      id: "6",
      category: "Footwear",
      imageUrl:
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&q=80",
      name: "Running Shoes",
      price: "89.99",
    ),
  ];
  List get productsBought => _productsBought;
  List get products => _allProducts;
  String selectedCategory = "All";
  String searchQuery = "";
  void addProductToCart(String id) {
    final existingProduct = _productsBought.firstWhere(
      (element) => element.id == id,
      orElse: () => null,
    );

    if (existingProduct != null) {
      existingProduct.quantity++;
    } else {
      final productToAdd = _allProducts.firstWhere(
        (element) => element.id == id,
      );
      productToAdd.quantity = 1;
      _productsBought.add(productToAdd);
    }

    notifyListeners();
  }

  void deleteProduct(String id) {
    _productsBought.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  List<Product> get filteredProducts {
    return _allProducts.where((product) {
      final matchesCategory =
          selectedCategory == "All" || product.category == selectedCategory;
      final matchesSearch = product.name.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void increaseQuantity(String id) {
    final product = _productsBought.firstWhere((p) => p.id == id);
    product.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(String id) {
    final product = _productsBought.firstWhere((p) => p.id == id);
    if (product.quantity >= 1) {
      product.quantity--;
          if (product.quantity == 0) {
      deleteProduct(product.id);
    }
     
    }

     notifyListeners();
  }
}
