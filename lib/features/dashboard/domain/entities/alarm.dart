import 'package:equatable/equatable.dart';
import 'package:neuroloop/features/dashboard/domain/enums/alarm_schedule_type.dart';

final class Alarm extends Equatable {
  const Alarm({
    required this.id,
    required this.type,
    required this.scheduledAt,
    required this.title,
    required this.body,
  });

  final int id;
  final AlarmScheduleType type;
  final DateTime scheduledAt;
  final String title;
  final String body;

  @override
  List<Object?> get props => [id, type, scheduledAt, title, body];
}