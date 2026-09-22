import 'package:flutter/material.dart';
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

  Future<void> _pickTime() async {
    final now = TimeOfDay.now();

    final selectedTime = await showTimePicker(context: context, initialTime: _selectedTime ?? now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        spacing: 8,
        children: [
          _buildMinutesButton(5),
          _buildMinutesButton(10),
          _buildMinutesButton(15),
          _buildMinutesButton(30),

        ],
      ),
    );
  }
}
