import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFD2E6D1),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 60,
              ),
            ),
            const SizedBox(height: 24),
            _buildProfileHeader(theme),
            const SizedBox(height: 24),

            _buildMenuItem(
              theme,
              Icons.info,
              'Hakkında',
              'Uygulama bilgilerini görüntüleyin',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('RotaSina Hakkında'),
                    content: const SingleChildScrollView(
                      child: Text(
                        'RotaSina uygulaması, geleneksel ve tamamlayıcı tıp (GETAT) alanında Türkiye’nin sahip olduğu zengin mirası, sağlık turizmi ile birleştirerek kullanıcılar için keşfedilebilir hale getiriyor. Uygulama, yerli ve yabancı turistlerin güvenilir GETAT merkezlerine kolayca ulaşmasını sağlarken, kullanıcıların yorum yapmasını, puanlar almasını ve çevrelerindeki turistik mekanları keşfetmesini mümkün kılıyor. Çok dilli destek ve harita yönlendirme özellikleriyle, kullanıcılar için pratik ve verimli bir deneyim sunuyor. RotaSina, sağlık turizmini destekleyerek geleneksel tıbbın uluslararası alanda tanıtımına katkı sağlıyor.'
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Kapat'),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Divider(),
            _buildMenuItem(
              theme,
              Icons.logout,
              'Çıkış Yap',
              'Hesabınızdan çıkış yapın',
              onTap: () => context.go('/'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(ThemeData theme) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.surfaceVariant,
            border: Border.all(
              color: theme.primaryColor,
              width: 3,
            ),
          ),
          child: Icon(
            Icons.person,
            size: 60,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Kullanıcı Adı',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'kullanici@email.com',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    ThemeData theme,
    IconData icon,
    String title,
    String subtitle, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: theme.primaryColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}