import 'package:equatable/equatable.dart';

class Appointment extends Equatable {
  final String id;
  final String title;
  final DateTime date;
  final String time;
  final String location;

  const Appointment({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
  });

  @override
  List<Object> get props => [id, title, date, time, location];
} 