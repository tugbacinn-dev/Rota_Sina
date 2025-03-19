import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.profile ?? ''),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.language, color: Colors.white),
              style: IconButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                padding: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileHeader(theme),
          const SizedBox(height: 24),
          _buildMenuItem(
            theme,
            Icons.calendar_today,
            'Randevularım',
            'Randevu geçmişinizi görüntüleyin',
          ),
          const Divider(),
          _buildMenuItem(
            theme,
            Icons.shopping_bag,
            'Siparişlerim',
            'Sipariş geçmişinizi görüntüleyin',
          ),
          const Divider(),
          _buildMenuItem(
            theme,
            Icons.favorite,
            'Favorilerim',
            'Favori merkezlerinizi görüntüleyin',
          ),
          const Divider(),
          _buildMenuItem(
            theme,
            Icons.settings,
            'Ayarlar',
            'Uygulama ayarlarını düzenleyin',
          ),
          const Divider(),
          _buildMenuItem(
            theme,
            Icons.help,
            'Yardım',
            'Sıkça sorulan sorular ve destek',
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.logout),
            label: const Text(
              'Çıkış Yap',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
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
    String subtitle,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: theme.primaryColor,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(
        Icons.chevron_right,
        color: theme.primaryColor,
      ),
      onTap: () {},
    );
  }
}