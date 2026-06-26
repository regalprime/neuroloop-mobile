import 'package:flutter/material.dart';
import 'package:neuroloop/domain/extension/app_extension.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final userProfile = Text(context.l10n.hello);
    return Scaffold(
      body: Column(
        children: [
          userProfile,
        ],
      ),
    );
  }
}
