import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../domain/models/product.dart';
import '../state/cart_state.dart';
import '../widgets/cart_icon.dart';
import 'cart_page.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProductsPageContent();
  }
}

class _ProductsPageContent extends StatelessWidget {
  const _ProductsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFD2E6D1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 8),
            child: CartIcon(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CartPage()),
                );
              },
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 60,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(16),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.7,
                children: [
                  _ProductCard(
                    product: Product(
                      id: '1',
                      name: l10n.almondOil,
                      description: l10n.almondOilDesc,
                      price: 120,
                      imageUrl: 'assets/images/products/badem.jpg',
                      category: 'Yağ',
                    ),
                  ),
                  _ProductCard(
                    product: Product(
                      id: '2',
                      name: l10n.vitaminC,
                      description: l10n.vitaminCDesc,
                      price: 90,
                      imageUrl: 'assets/images/products/c.jpg',
                      category: 'Vitamin',
                    ),
                  ),
                  _ProductCard(
                    product: Product(
                      id: '3',
                      name: l10n.roseWater,
                      description: l10n.roseWaterDesc,
                      price: 80,
                      imageUrl: 'assets/images/products/gul.jpg',
                      category: 'Su',
                    ),
                  ),
                  _ProductCard(
                    product: Product(
                      id: '4',
                      name: l10n.vitaminECream,
                      description: l10n.vitaminECreamDesc,
                      price: 150,
                      imageUrl: 'assets/images/products/krem.jpg',
                      category: 'Krem',
                    ),
                  ),
                  _ProductCard(
                    product: Product(
                      id: '5',
                      name: l10n.lavenderOil,
                      description: l10n.lavenderOilDesc,
                      price: 130,
                      imageUrl: 'assets/images/products/lavanta.jpg',
                      category: 'Yağ',
                    ),
                  ),
                  _ProductCard(
                    product: Product(
                      id: '6',
                      name: l10n.aloeVeraCream,
                      description: l10n.aloeVeraCreamDesc,
                      price: 140,
                      imageUrl: 'assets/images/products/alo.jpg',
                      category: 'Krem',
                    ),
                  ),
                  _ProductCard(
                    product: Product(
                      id: '7',
                      name: l10n.saltSoap,
                      description: l10n.saltSoapDesc,
                      price: 60,
                      imageUrl: 'assets/images/products/tuzs.jpg',
                      category: 'Sabun',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  const _ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              product.imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<CartState>(context, listen: false).addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.name} sepete eklendi')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(l10n.addToCart),
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
