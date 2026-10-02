import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../domain/models/appointment.dart';
import '../state/appointment_state.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppointmentState(),
      child: const _AppointmentsPageContent(),
    );
  }
}

class _AppointmentsPageContent extends StatefulWidget {
  const _AppointmentsPageContent({super.key});

  @override
  State<_AppointmentsPageContent> createState() => _AppointmentsPageContentState();
}

class _AppointmentsPageContentState extends State<_AppointmentsPageContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFD2E6D1),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 60,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    bottom: BorderSide(
                      color: theme.primaryColor,
                      width: 3,
                    ),
                  ),
                ),
                tabs: [
                  Tab(
                    child: Text(
                      'Aktif Randevular',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Geçmiş Randevular',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildAppointmentsList(true),
                  _buildAppointmentsList(false),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final hospitals = [
            'Doğal Hayat Tıp Merkezi',
            'Hayat Tıp Merkezi',
            'Pendik Tıp Merkezi',
          ];
          final selected = await showModalBottomSheet<String>(
            context: context,
            builder: (ctx) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                const Text('Hastane Seçin', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ...hospitals.map((h) => ListTile(
                  title: Text(h),
                  onTap: () => Navigator.pop(ctx, h),
                )),
                const SizedBox(height: 16),
              ],
            ),
          );
          if (selected != null) {
            final doctors = {
              'Doğal Hayat Tıp Merkezi': 'Dr. Ali Kaya',
              'Hayat Tıp Merkezi': 'Dr. Elif Demir',
              'Pendik Tıp Merkezi': 'Dr. Zeynep Koç',
            };
            final treatments = ['Sülük Tedavisi', 'Hacamat', 'Akupunktur'];
            final now = DateTime.now();
            final appointment = Appointment(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              centerName: selected,
              doctorName: doctors[selected] ?? 'Dr. Bilinmiyor',
              treatmentName: (treatments..shuffle()).first,
              dateTime: DateTime(now.year, now.month, now.day + 1, 10 + (now.second % 6), 30),
              status: 'upcoming',
            );
            Provider.of<AppointmentState>(context, listen: false).addAppointment(appointment);
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Randevu başarıyla oluşturuldu!')),
              );
            }
          }
        },
        backgroundColor: theme.primaryColor,
        label: Text('Randevu Al'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildAppointmentsList(bool isActive) {
    final appointmentState = Provider.of<AppointmentState>(context);
    final appointments = isActive ? appointmentState.activeAppointments : appointmentState.pastAppointments;
    if (appointments.isEmpty) {
      return Center(child: Text(isActive ? 'Aktif randevu yok' : 'Geçmiş randevu yok'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isActive ? Colors.green.shade100 : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isActive ? 'Aktif' : 'Tamamlandı',
                        style: TextStyle(
                          color: isActive ? Colors.green.shade700 : Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${appointment.dateTime.day}/${appointment.dateTime.month}/${appointment.dateTime.year}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _InfoRow(
                  icon: Icons.local_hospital,
                  label: 'Merkez',
                  value: appointment.centerName,
                ),
                const SizedBox(height: 8),
                _InfoRow(
                  icon: Icons.person,
                  label: 'Doktor',
                  value: appointment.doctorName,
                ),
                const SizedBox(height: 8),
                _InfoRow(
                  icon: Icons.medical_services,
                  label: 'Tedavi',
                  value: appointment.treatmentName,
                ),
                const SizedBox(height: 8),
                _InfoRow(
                  icon: Icons.access_time,
                  label: 'Saat',
                  value: '${appointment.dateTime.hour}:${appointment.dateTime.minute.toString().padLeft(2, '0')}',
                ),
                if (isActive) ...[
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Randevuyu İptal Et'),
      content: const Text('İptal etmek istediğinizden emin misiniz?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Hayır'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Evet'),
        ),
      ],
    ),
  );
  if (result == true) {
    Provider.of<AppointmentState>(context, listen: false).cancelAppointment(appointment.id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Randevu iptal edildi.')),
    );
  }
},
                        icon: const Icon(Icons.close, color: Colors.red),
                        label: const Text(
                          'İptal Et',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 8),
        Text(
          '$label:',
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
