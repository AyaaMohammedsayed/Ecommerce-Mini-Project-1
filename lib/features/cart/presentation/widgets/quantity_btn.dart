import 'package:ecommerce/core/app_theme.dart';
import 'package:flutter/material.dart';

class QuantityBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
   QuantityBtn({required this.icon, required this.onTap});

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
