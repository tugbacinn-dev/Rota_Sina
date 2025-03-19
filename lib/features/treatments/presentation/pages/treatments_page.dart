import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../data/treatments_data.dart';

class TreatmentsPage extends StatelessWidget {
  const TreatmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.treatments),
        backgroundColor: theme.primaryColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: treatments.length,
        itemBuilder: (context, index) {
          final treatment = treatments[index];

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
                      width: 160,
                      child: Center(
                        child: Image.asset(
                          _getImagePath(treatment.id),
                          width: 140,
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
                            treatment.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            treatment.description,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: FilledButton.icon(
                                  onPressed: () => context.go('/centers'),
                                  icon: const Icon(Icons.local_hospital),
                                  label: Text(l10n.centers),
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Colors.blue.shade700,
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
        },
      ),
    );
  }

  String _getImagePath(String id) {
    switch (id) {
      case '1':
        return 'assets/images/treatments/suluk.jpeg';
      case '2':
        return 'assets/images/treatments/hacamat.jpg';
      case '3':
        return 'assets/images/treatments/ak.jpg';
      case '4':
        return 'assets/images/treatments/mezo.jpg';
      default:
        return '';
    }
  }
}
