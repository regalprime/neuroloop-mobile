import 'package:flutter/material.dart';
import 'package:neuroloop/domain/extension/app_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  TimeOfDay? _selectedTime;

  Widget _button() {
    return ElevatedButton(
      onPressed: () {
        final time = DateTime.now().add(const Duration(minutes: 1));
      },
      child: const Text('Bao thuc'),
    );
  }

  Future<void> scheduleAfterMinutes(int minutes) async {
    final scheduleAt = DateTime.now().add(Duration(minutes: minutes));
  }

  Widget _buildMinutesButton(int minutes) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('$minutes phut'),
    );
  }

  Widget _item({required int minutes, required bool isEnable}) {
    return Row(
      children: [
        Expanded(child: Text('$minutes ${context.l10n.minute}')),
        Switch(value: isEnable, onChanged: (newValue) {}),
      ],
    );
  }

  Future<void> _pickTime() async {
    final now = TimeOfDay.now();

    final selectedTime = await showTimePicker(context: context, initialTime: _selectedTime ?? now);
  }

  Widget _items() {
    return Column(
      children: [
        _item(minutes: 5, isEnable: true),
        _item(minutes: 10, isEnable: false),
        _item(minutes: 15, isEnable: true),
        _item(minutes: 30, isEnable: false),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              children: [
                _buildMinutesButton(5),
                _buildMinutesButton(10),
                _buildMinutesButton(15),
                _buildMinutesButton(30),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _items(),
            ),
            ElevatedButton(
                onPressed: () {
                  _pickTime();
                },
                child: Text(context.l10n.selectTime)),
          ],
        ),
      ),
    );
  }
}
