
class PriceCalculations {
  List products;
  PriceCalculations({required this.products});
  double  shipping = 10.00;
  double get subtotal => products.fold<double>(0, (s, i) => s + (double.parse(i.price) * i.quantity));
  double get total => subtotal + shipping;
}
