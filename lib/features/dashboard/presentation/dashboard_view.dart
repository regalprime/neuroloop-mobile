import 'package:flutter/material.dart';
import 'package:neuroloop/domain/extension/app_extension.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final userProfile = Text(context.l10n.hello);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Dashboard'),
          ),
          userProfile,
          Container(
            /// koking
            color: Colors.red,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
          )
        ],
      ),
    );
  }
}
