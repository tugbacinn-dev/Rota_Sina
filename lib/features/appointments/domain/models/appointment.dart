class Appointment {
  final String id;
  final String centerName;
  final String doctorName;
  final String treatmentName;
  final DateTime dateTime;
  final String status; // 'upcoming', 'completed', 'cancelled'

  const Appointment({
    required this.id,
    required this.centerName,
    required this.doctorName,
    required this.treatmentName,
    required this.dateTime,
    required this.status,
  });

  Appointment copyWith({
    String? id,
    String? centerName,
    String? doctorName,
    String? treatmentName,
    DateTime? dateTime,
    String? status,
  }) {
    return Appointment(
      id: id ?? this.id,
      centerName: centerName ?? this.centerName,
      doctorName: doctorName ?? this.doctorName,
      treatmentName: treatmentName ?? this.treatmentName,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
    );
  }
}
