// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get map => 'Map';

  @override
  String get centers => 'Centers';

  @override
  String get profile => 'Profile';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get loginButton => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get appointments => 'Appointments';

  @override
  String get cancelAppointment => 'Cancel Appointment';

  @override
  String get cancelAppointmentConfirmation => 'Do you want to cancel this appointment?';

  @override
  String get appointmentCancelled => 'Appointment cancelled successfully';

  @override
  String get noAppointments => 'No appointments found';
}
