import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/features/centers/domain/models/medical_center.dart';
import 'package:url_launcher/url_launcher.dart';

class CentersPage extends StatelessWidget {
  const CentersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final centers = [
      MedicalCenter(
        name: 'Doğal Hayat Tıp Merkezi',
        address: 'Çankaya, Ankara',
        rating: 4.8,
        imageUrl: 'assets/images/centers/dogal.jpg',
        mapsUrl: 'https://maps.google.com/?q=Doğal+Hayat+Polikliniği+Oğuzlar+Mahallesi+Ceyhun+Atuf+Kansu+Cad+1370+Sk+No:12+06520+Balgat+Çankaya+Ankara',
        services: [
          'Sülük Tedavisi',
          'Hacamat',
          'Akupunktur',
          'Mezoterapi',
          'Ozon Terapi',
        ],
      ),
      MedicalCenter(
        name: 'Hayat Tıp Merkezi',
        address: 'Osmangazi, Bursa',
        rating: 4.7,
        imageUrl: 'assets/images/centers/hayat.jpg',
        mapsUrl: 'https://maps.google.com/?q=Hayat+Fizik+Tedavi+ve+Rehabilitasyon+Tıp+Merkezi+Yeni+Karaman+Mah+Sanayi+Cad+No:105+H+Mudanya+Yolu+Üzeri+Umi+Plaza+Giriş+Katı+16160+Osmangazi+Bursa',
        services: [
          'Hacamat',
          'Akupunktur',
          'Kupa Terapi',
          'Fitoterapi',
          'PRP Tedavisi',
        ],
      ),
      MedicalCenter(
        name: 'Pendik Tıp Merkezi',
        address: 'Pendik, İstanbul',
        rating: 4.6,
        imageUrl: 'assets/images/centers/pendik.jpg',
        mapsUrl: 'https://maps.google.com/?q=Özel+Pendik+Tıp+Merkezi+Doğu+Altındal+Sok+No:3+34890+Pendik+İstanbul',
        services: [
          'Sülük Tedavisi',
          'Hacamat',
          'Mezoterapi',
          'Proloterapi',
          'Ozon Terapi',
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFD2E6D1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 32),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 120,
              height: 120,
            ),
          ),
          const SizedBox(height: 32),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: centers.length,
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              final center = centers[index];
              return _buildCenterCard(
                context,
                center,
                theme,
                l10n,
              );
            },
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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFECE9E9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.green.shade800,
          width: 1,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(12),
              ),
              child: SizedBox(
                width: 200,
                child: Center(
                  child: Image.asset(
                    center.imageUrl,
                    width: 160,
                    height: 160,
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
                    Text(
                      center.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 4),
                        Expanded(child: Text(center.address)),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(center.rating.toString()),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Hizmetler:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: center.services
                          .map(
                            (service) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFECE9E9),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                service,
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () => _launchMaps(center.mapsUrl),
                        icon: const Icon(Icons.map),
                        label: const Text('Haritada Göster'),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
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

  void _launchMaps(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}