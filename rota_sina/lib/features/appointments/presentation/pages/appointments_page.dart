import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rota_sina/features/appointments/domain/models/appointment.dart';
import 'package:rota_sina/features/appointments/presentation/bloc/appointments_bloc.dart';
import 'package:rota_sina/features/appointments/presentation/bloc/appointments_event.dart';
import 'package:rota_sina/features/appointments/presentation/bloc/appointments_state.dart';
import 'package:rota_sina/l10n/l10n.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appointments),
      ),
      body: BlocConsumer<AppointmentsBloc, AppointmentsState>(
        listener: (context, state) {
          if (state is AppointmentsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AppointmentsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AppointmentsLoaded) {
            return _buildAppointmentsList(context, state.appointments);
          }
          return const Center(child: Text('No appointments found'));
        },
      ),
    );
  }

  Widget _buildAppointmentsList(BuildContext context, List<Appointment> appointments) {
    if (appointments.isEmpty) {
      return const Center(child: Text('No appointments found'));
    }

    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(appointment.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${appointment.date.toString().split(' ')[0]}'),
                Text('Time: ${appointment.time}'),
                Text('Location: ${appointment.location}'),
              ],
            ),
            trailing: TextButton.icon(
              icon: const Icon(Icons.cancel, color: Colors.red),
              label: const Text('İptal Et', style: TextStyle(color: Colors.red)),
              onPressed: () => context.read<AppointmentsBloc>().add(CancelAppointment(appointment)),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showCancelConfirmation(BuildContext context, Appointment appointment) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Randevu İptali'),
        content: const Text('Bu randevuyu iptal etmek istiyor musunuz?'),
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

    if (confirmed == true && context.mounted) {
      context.read<AppointmentsBloc>().add(CancelAppointment(appointment));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Randevu başarıyla iptal edildi.'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
} 