import 'package:ecommerce/features/cart/presentation/screens/cart_manager.dart';
import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
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
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.home_outlined, color: Color(0xFF009688)),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                onTap: () => Navigator.pop(context),
              ),

              ListTile(
                leading: Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xFF009688),
                ),
                title: Text(
                  'Cart',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, CartManager.routeName);
                },
              ),
            ],
          ),
        ),
      )
;
  }
}