import 'package:flutter/material.dart';
import '../../domain/models/appointment.dart';

class AppointmentState extends ChangeNotifier {
  final List<Appointment> _appointments = [
    Appointment(
      id: '1',
      centerName: 'Şifa Merkezi',
      doctorName: 'Dr. Ayşe Yılmaz',
      treatmentName: 'Masaj Terapisi',
      dateTime: DateTime.now().add(const Duration(days: 2)),
      status: 'upcoming',
    ),
    Appointment(
      id: '2',
      centerName: 'Sağlık Merkezi',
      doctorName: 'Dr. Mehmet Demir',
      treatmentName: 'Fizik Tedavi',
      dateTime: DateTime.now().subtract(const Duration(days: 5)),
      status: 'completed',
    ),
  ];

  List<Appointment> get activeAppointments => _appointments.where((a) => a.status == 'upcoming').toList();
  List<Appointment> get pastAppointments => _appointments.where((a) => a.status == 'completed').toList();

  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
    notifyListeners();
  }

  void cancelAppointment(String id) {
    final idx = _appointments.indexWhere((a) => a.id == id);
    if (idx != -1) {
      _appointments[idx] = _appointments[idx].copyWith(status: 'cancelled');
      notifyListeners();
    }
  }
}
