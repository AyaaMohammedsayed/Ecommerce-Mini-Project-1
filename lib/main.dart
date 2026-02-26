import 'package:ecommerce/core/app_theme.dart';
import 'package:ecommerce/screens/cart_empty_screen.dart';
import 'package:ecommerce/screens/cart_full_screen.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(EcommerceApp());
}
class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
       HomeScreen.routeName:(_)=>HomeScreen(),
       CartEmptyScreen.routeName:(_)=>CartEmptyScreen(),
       CartFullScreen.routeName:(_)=>CartFullScreen()

      },
      initialRoute: HomeScreen.routeName,
         theme: AppTheme.lightTheme,
        
    );
  }
}