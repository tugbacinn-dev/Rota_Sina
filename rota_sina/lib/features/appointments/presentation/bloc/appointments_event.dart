import 'package:equatable/equatable.dart';
import 'package:rota_sina/features/appointments/domain/models/appointment.dart';

abstract class AppointmentsEvent extends Equatable {
  const AppointmentsEvent();

  @override
  List<Object> get props => [];
}

class LoadAppointments extends AppointmentsEvent {
  const LoadAppointments();
}

class CancelAppointment extends AppointmentsEvent {
  final Appointment appointment;

  const CancelAppointment(this.appointment);

  @override
  List<Object> get props => [appointment];
} 