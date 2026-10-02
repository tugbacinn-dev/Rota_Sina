import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/models/product.dart';
import '../state/cart_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartState>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetim'),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFD2E6D1),
      body: cart.isEmpty
          ? const Center(child: Text('Sepetiniz boş'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: cart.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final product = cart[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(product.imageUrl, width: 48, height: 48),
                    title: Text(product.name),
                    subtitle: Text(product.description),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        Provider.of<CartState>(context, listen: false).removeFromCart(product);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
