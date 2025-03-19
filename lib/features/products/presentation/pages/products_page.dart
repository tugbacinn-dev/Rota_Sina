import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.products),
        backgroundColor: theme.primaryColor,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _ProductCard(
            name: l10n.arganOil,
            description: l10n.arganOilDesc,
            image: 'assets/images/products/argan.jpg',
          ),
          _ProductCard(
            name: l10n.almondOil,
            description: l10n.almondOilDesc,
            image: 'assets/images/products/badem.jpg',
          ),
          _ProductCard(
            name: l10n.vitaminC,
            description: l10n.vitaminCDesc,
            image: 'assets/images/products/c.jpg',
          ),
          _ProductCard(
            name: l10n.roseWater,
            description: l10n.roseWaterDesc,
            image: 'assets/images/products/gul.jpg',
          ),
          _ProductCard(
            name: l10n.vitaminECream,
            description: l10n.vitaminECreamDesc,
            image: 'assets/images/products/krem.jpg',
          ),
          _ProductCard(
            name: l10n.lavenderOil,
            description: l10n.lavenderOilDesc,
            image: 'assets/images/products/lavanta.jpg',
          ),
          _ProductCard(
            name: l10n.aloeVeraCream,
            description: l10n.aloeVeraCreamDesc,
            image: 'assets/images/products/alo.jpg',
          ),
          _ProductCard(
            name: l10n.saltSoap,
            description: l10n.saltSoapDesc,
            image: 'assets/images/products/tuzs.jpg',
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String name;
  final String description;
  final String image;

  const _ProductCard({
    required this.name,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
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
