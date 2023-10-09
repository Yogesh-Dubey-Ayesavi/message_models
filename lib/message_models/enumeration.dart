
enum DeliveryStatus {
  error,
  sending,
  sent,
  read,
  delivered,
  undelivered,
  pending,
  custom,
}

enum ShiftStatus {
  ongoing,
  upcoming,
  late,
  shiftbreak,
  review,
  pending,
  completed,
  paid
}

enum MessageType {
  custom,
  image,
  text,
  unsupported,
  system,
  voice,
  shift,
}
