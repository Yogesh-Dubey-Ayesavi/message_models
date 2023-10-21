
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
  started,
  brk,
  review,
  pending,
  completed,
  ended,
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
