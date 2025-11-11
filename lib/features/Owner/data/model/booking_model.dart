class Booking {
  final String teamName;
  final DateTime date;
  final String time;
  final String playerFormat; // e.g., 11v11
  final double totalAmount;
  final String status; // Pending, Confirmed

  Booking({
    required this.teamName,
    required this.date,
    required this.time,
    required this.playerFormat,
    required this.totalAmount,
    required this.status,
  });
}
