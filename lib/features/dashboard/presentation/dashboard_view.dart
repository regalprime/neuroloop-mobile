import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroloop/domain/extension/app_extension.dart';
import 'package:neuroloop/features/dashboard/domain/enums/alarm_schedule_type.dart';
import 'package:neuroloop/features/dashboard/presentation/bloc/alarm_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NeuroLoop'),
      ),
      body: SafeArea(
        child: BlocConsumer<AlarmBloc, AlarmState>(
          listener: (context, state) {
            if (state.status == AlarmStatus.scheduled) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Đã đặt báo thức'),
                ),
              );
            }

            if (state.hasPermissionError) {
              _showExactAlarmPermissionDialog(context);
            }

            if (state.status == AlarmStatus.failure && state.errorMessage != null && !state.hasPermissionError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  SizedBox(height: 24.h),
                  _buildScheduleTypeSelector(
                    context,
                    state,
                  ),
                  SizedBox(height: 24.h),
                  if (state.scheduleType == AlarmScheduleType.afterDuration)
                    _buildDurationSection(
                      context,
                      state,
                    ),
                  if (state.scheduleType == AlarmScheduleType.specificTime)
                    _buildTimeSection(
                      context,
                      state,
                    ),
                  SizedBox(height: 32.h),
                  _buildQuickAlarmSection(
                    context,
                    state,
                  ),
                  SizedBox(height: 32.h),
                  _buildScheduleButton(
                    context,
                    state,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Builder(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alarm',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 4.h),
            Text(
              'Nhắc bạn quay lại tập trung',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        );
      },
    );
  }

  Widget _buildScheduleTypeSelector(
    BuildContext context,
    AlarmState state,
  ) {
    return SegmentedButton<AlarmScheduleType>(
      segments: const [
        ButtonSegment(
          value: AlarmScheduleType.afterDuration,
          label: Text('Sau bao lâu'),
          icon: Icon(Icons.timer_outlined),
        ),
        ButtonSegment(
          value: AlarmScheduleType.specificTime,
          label: Text('Giờ cụ thể'),
          icon: Icon(Icons.alarm_outlined),
        ),
      ],
      selected: {
        state.scheduleType,
      },
      onSelectionChanged: (selection) {
        context.read<AlarmBloc>().add(
              AlarmScheduleTypeChanged(
                selection.first,
              ),
            );
      },
    );
  }

  Widget _buildDurationSection(
    BuildContext context,
    AlarmState state,
  ) {
    final minutes = state.duration.inMinutes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thời gian',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: [
            _buildDurationButton(
              context,
              state,
              5,
            ),
            _buildDurationButton(
              context,
              state,
              10,
            ),
            _buildDurationButton(
              context,
              state,
              15,
            ),
            _buildDurationButton(
              context,
              state,
              30,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          '$minutes ${context.l10n.minute}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Slider(
          min: 5,
          max: 180,
          divisions: 35,
          value: minutes.toDouble(),
          label: '$minutes phút',
          onChanged: (value) {
            context.read<AlarmBloc>().add(
                  AlarmDurationChanged(
                    Duration(
                      minutes: value.round(),
                    ),
                  ),
                );
          },
        ),
      ],
    );
  }

  Widget _buildDurationButton(
    BuildContext context,
    AlarmState state,
    int minutes,
  ) {
    final isSelected = state.duration.inMinutes == minutes;

    return ChoiceChip(
      label: Text(
        '$minutes ${context.l10n.minute}',
      ),
      selected: isSelected,
      onSelected: (_) {
        context.read<AlarmBloc>().add(
              AlarmDurationChanged(
                Duration(minutes: minutes),
              ),
            );
      },
    );
  }

  Widget _buildTimeSection(
    BuildContext context,
    AlarmState state,
  ) {
    final selectedTime = state.selectedTime;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Giờ báo thức',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 12.h),
        InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: () => _pickTime(context),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time,
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    selectedTime == null
                        ? context.l10n.selectTime
                        : selectedTime.format(
                            context,
                          ),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAlarmSection(
    BuildContext context,
    AlarmState state,
  ) {
    const quickAlarmMinutes = [
      5,
      10,
      15,
      30,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Báo thức nhanh',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8.h),
        ...quickAlarmMinutes.map(
          (minutes) => _buildQuickAlarmItem(
            context,
            state,
            minutes,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAlarmItem(
    BuildContext context,
    AlarmState state,
    int minutes,
  ) {
    final isEnabled = state.isQuickAlarmEnabled(minutes);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        child: Text(
          '$minutes',
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
      ),
      title: Text(
        '$minutes ${context.l10n.minute}',
      ),
      subtitle: Text(
        isEnabled ? 'Đang bật' : 'Nhắc nhở quay lại tập trung',
      ),
      trailing: Switch(
        value: isEnabled,
        onChanged: state.isScheduling || state.isCanceling
            ? null
            : (_) {
                context.read<AlarmBloc>().add(
                      AlarmQuickAlarmToggled(
                        minutes,
                      ),
                    );
              },
      ),
    );
  }

  Widget _buildScheduleButton(
    BuildContext context,
    AlarmState state,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: state.isScheduling
            ? null
            : () {
                context.read<AlarmBloc>().add(
                      const AlarmScheduleRequested(),
                    );
              },
        child: state.isScheduling
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(),
              )
            : const Text(
                'Đặt báo thức',
              ),
      ),
    );
  }

  Future<void> _pickTime(
    BuildContext context,
  ) async {
    final bloc = context.read<AlarmBloc>();
    final currentTime = bloc.state.selectedTime;

    final selectedTime = await showTimePicker(
      context: context,
      initialTime: currentTime ?? TimeOfDay.now(),
    );

    if (selectedTime == null || !context.mounted) {
      return;
    }

    bloc.add(
      AlarmTimeChanged(
        selectedTime,
      ),
    );
  }

  Future<void> _showExactAlarmPermissionDialog(
    BuildContext context,
  ) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Cần quyền báo thức chính xác',
          ),
          content: const Text(
            'NeuroLoop cần quyền đặt báo thức chính xác '
            'để thông báo đúng thời gian bạn đã chọn.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Để sau'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();

                context.read<AlarmBloc>().add(
                      const AlarmExactPermissionSettingsRequested(),
                    );
              },
              child: const Text(
                'Mở cài đặt',
              ),
            ),
          ],
        );
      },
    );
  }
}