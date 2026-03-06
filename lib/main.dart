import 'package:ecommerce/core/app_theme.dart';
import 'package:ecommerce/core/provider/products_provider.dart';
import 'package:ecommerce/features/cart/presentation/screens/cart_empty_screen.dart';
import 'package:ecommerce/features/cart/presentation/screens/cart_full_screen.dart';
import 'package:ecommerce/features/cart/presentation/screens/cart_manager.dart';
import 'package:ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    
    create: (context)=>ProductsProvider(),
    child: EcommerceApp()));
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        CartEmptyScreen.routeName: (_) => CartEmptyScreen(),
        CartFullScreen.routeName: (_) => CartFullScreen(),
        CartManager.routeName:(_)=>CartManager()
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
    );
  }
}
