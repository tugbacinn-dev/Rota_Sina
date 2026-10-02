import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/cart_state.dart';

class CartIcon extends StatelessWidget {
  final VoidCallback? onTap;
  const CartIcon({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartState>().cart.length;
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: onTap,
        ),
        if (cartCount > 0)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: Text(
                '$cartCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
