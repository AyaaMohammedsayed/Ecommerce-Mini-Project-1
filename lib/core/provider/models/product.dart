class Product {
  String id;
  String name;
  String imageUrl;
  String price;
  String category;
  int quantity = 1;
  Product({
    required this.id,
    required this.category,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.quantity=1
  });
}
