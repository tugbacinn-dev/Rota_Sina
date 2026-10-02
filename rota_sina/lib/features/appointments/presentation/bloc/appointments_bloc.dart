import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rota_sina/features/appointments/domain/models/appointment.dart';
import 'package:rota_sina/features/appointments/presentation/bloc/appointments_event.dart';
import 'package:rota_sina/features/appointments/presentation/bloc/appointments_state.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  List<Appointment> _appointments = [];

  AppointmentsBloc() : super(const AppointmentsInitial()) {
    on<LoadAppointments>(_onLoadAppointments);
    on<CancelAppointment>(_onCancelAppointment);
  }

  Future<void> _onLoadAppointments(
    LoadAppointments event,
    Emitter<AppointmentsState> emit,
  ) async {
    emit(const AppointmentsLoading());
    try {
      // Örnek randevular
      _appointments = [
        const Appointment(
          id: '1',
          title: 'Doktor Randevusu',
          date: DateTime(2024, 3, 15),
          time: '10:00',
          location: 'A Hastanesi',
        ),
        const Appointment(
          id: '2',
          title: 'Diş Kontrolü',
          date: DateTime(2024, 3, 16),
          time: '14:30',
          location: 'B Diş Kliniği',
        ),
      ];
      emit(AppointmentsLoaded(_appointments));
    } catch (e) {
      emit(AppointmentsError(e.toString()));
    }
  }

  Future<void> _onCancelAppointment(
    CancelAppointment event,
    Emitter<AppointmentsState> emit,
  ) async {
    try {
      _appointments.removeWhere((appointment) => appointment.id == event.appointment.id);
      emit(AppointmentsLoaded(_appointments));
    } catch (e) {
      emit(AppointmentsError(e.toString()));
    }
  }
} 