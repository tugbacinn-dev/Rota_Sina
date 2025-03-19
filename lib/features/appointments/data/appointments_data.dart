enum AppointmentStatus {
  confirmed,
  pending,
  completed,
  cancelled,
}

class Appointment {
  final String id;
  final String treatment;
  final String center;
  final String doctor;
  final String date;
  final String time;
  final AppointmentStatus status;

  const Appointment({
    required this.id,
    required this.treatment,
    required this.center,
    required this.doctor,
    required this.date,
    required this.time,
    required this.status,
  });
}

// Aktif Randevular
final List<Appointment> activeAppointments = [
  Appointment(
    id: '1',
    treatment: 'Sülük Tedavisi',
    center: 'Doğal Hayat Tıp Merkezi',
    doctor: 'Dr. Ahmet Yılmaz',
    date: '20 Mart 2025',
    time: '10:30',
    status: AppointmentStatus.confirmed,
  ),
  Appointment(
    id: '2',
    treatment: 'Hacamat',
    center: 'Hayat Tıp Merkezi',
    doctor: 'Dr. Mehmet Demir',
    date: '22 Mart 2025',
    time: '14:45',
    status: AppointmentStatus.pending,
  ),
];

// Geçmiş Randevular
final List<Appointment> pastAppointments = [
  Appointment(
    id: '3',
    treatment: 'Akupunktur',
    center: 'Pendik Tıp Merkezi',
    doctor: 'Dr. Ayşe Kaya',
    date: '15 Mart 2025',
    time: '11:15',
    status: AppointmentStatus.completed,
  ),
  Appointment(
    id: '4',
    treatment: 'Mezoterapi',
    center: 'Doğal Hayat Tıp Merkezi',
    doctor: 'Dr. Fatma Yıldız',
    date: '10 Mart 2025',
    time: '09:00',
    status: AppointmentStatus.cancelled,
  ),
];
