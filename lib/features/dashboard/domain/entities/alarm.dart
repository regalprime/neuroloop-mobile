class Alarm {
  final int id;
  final DateTime scheduleAt;
  final String title;
  final String body;
  final bool enable;

  const Alarm({
    required this.id,
    required this.scheduleAt,
    required this.title,
    required this.body,
    required this.enable,
  });
}
