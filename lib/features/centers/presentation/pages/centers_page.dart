import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/features/centers/domain/models/medical_center.dart';

class CentersPage extends StatelessWidget {
  const CentersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.centers ?? ''),
        backgroundColor: theme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCenterCard(
            context,
            MedicalCenter(
              name: 'Doğal Hayat Tıp Merkezi',
              address: 'Pendik, İstanbul',
              rating: 4.8,
              imageUrl: 'assets/images/centers/dogal.jpg',
              services: [
                'Sülük Tedavisi',
                'Hacamat',
                'Akupunktur',
                'Mezoterapi',
                'Ozon Terapi',
              ],
            ),
            theme,
            l10n,
          ),
          const SizedBox(height: 16),
          _buildCenterCard(
            context,
            MedicalCenter(
              name: 'Hayat Tıp Merkezi',
              address: 'Kartal, İstanbul',
              rating: 4.7,
              imageUrl: 'assets/images/centers/hayat.jpg',
              services: [
                'Hacamat',
                'Akupunktur',
                'Kupa Terapi',
                'Fitoterapi',
                'PRP Tedavisi',
              ],
            ),
            theme,
            l10n,
          ),
          const SizedBox(height: 16),
          _buildCenterCard(
            context,
            MedicalCenter(
              name: 'Pendik Tıp Merkezi',
              address: 'Pendik, İstanbul',
              rating: 4.6,
              imageUrl: 'assets/images/centers/pendik.jpg',
              services: [
                'Sülük Tedavisi',
                'Hacamat',
                'Mezoterapi',
                'Proloterapi',
                'Ozon Terapi',
              ],
            ),
            theme,
            l10n,
          ),
        ],
      ),
    );
  }

  Widget _buildCenterCard(
    BuildContext context,
    MedicalCenter center,
    ThemeData theme,
    AppLocalizations? l10n,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(12),
              ),
              child: Container(
                color: Colors.grey[100],
                width: 200,
                child: Center(
                  child: Image.asset(
                    center.imageUrl,
                    width: 180,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            center.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                center.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          center.address,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Sunulan Hizmetler',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: center.services.map((service) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: theme.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            service,
                            style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.phone),
                            label: Text(l10n?.call ?? ''),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.blue.shade700,
                              side: BorderSide(color: Colors.blue.shade700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}