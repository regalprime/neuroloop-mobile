part of 'alarm_bloc.dart';

enum AlarmStatus {
  initial,
  editing,
  scheduling,
  scheduled,
  canceling,
  canceled,
  failure,
}

enum AlarmPermissionStatus {
  unknown,
  required,
}

final class AlarmState extends Equatable {
  const AlarmState({
    this.status = AlarmStatus.initial,
    this.scheduleType = AlarmScheduleType.specificTime,
    this.selectedTime,
    this.duration = const Duration(minutes: 30),
    this.permissionStatus = AlarmPermissionStatus.unknown,
    this.errorMessage,
    this.scheduledAlarmId,
    this.enabledQuickAlarms = const {},
    this.quickAlarmIds = const {},
  });

  final AlarmStatus status;
  final AlarmScheduleType scheduleType;
  final TimeOfDay? selectedTime;
  final Duration duration;
  final AlarmPermissionStatus permissionStatus;
  final String? errorMessage;
  final int? scheduledAlarmId;

  /// Number of minutes for enabled quick alarms.
  ///
  /// Example:
  /// {5, 15}
  ///
  /// means 5-minute and 15-minute alarms are enabled.
  final Set<int> enabledQuickAlarms;

  /// Maps quick alarm minutes to native alarm IDs.
  ///
  /// Example:
  /// {
  ///   5: 100005,
  ///   15: 100015,
  /// }
  final Map<int, int> quickAlarmIds;

  bool get isScheduling => status == AlarmStatus.scheduling;

  bool get isCanceling => status == AlarmStatus.canceling;

  bool get hasSelectedTime => selectedTime != null;

  bool get hasPermissionError => permissionStatus == AlarmPermissionStatus.required;

  bool isQuickAlarmEnabled(int minutes) {
    return enabledQuickAlarms.contains(minutes);
  }

  int? getQuickAlarmId(int minutes) {
    return quickAlarmIds[minutes];
  }

  @override
  List<Object?> get props => [
        status,
        scheduleType,
        selectedTime?.hour,
        selectedTime?.minute,
        duration,
        permissionStatus,
        errorMessage,
        scheduledAlarmId,
        enabledQuickAlarms,
        quickAlarmIds,
      ];

  AlarmState copyWith({
    AlarmStatus? status,
    AlarmScheduleType? scheduleType,
    TimeOfDay? selectedTime,
    Duration? duration,
    AlarmPermissionStatus? permissionStatus,
    String? errorMessage,
    int? scheduledAlarmId,
    Set<int>? enabledQuickAlarms,
    Map<int, int>? quickAlarmIds,
  }) {
    return AlarmState(
      status: status ?? this.status,
      scheduleType: scheduleType ?? this.scheduleType,
      selectedTime: selectedTime ?? this.selectedTime,
      duration: duration ?? this.duration,
      permissionStatus: permissionStatus ?? this.permissionStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      scheduledAlarmId: scheduledAlarmId ?? this.scheduledAlarmId,
      enabledQuickAlarms: enabledQuickAlarms ?? this.enabledQuickAlarms,
      quickAlarmIds: quickAlarmIds ?? this.quickAlarmIds,
    );
  }
}