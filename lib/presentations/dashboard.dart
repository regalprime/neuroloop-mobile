import 'package:flutter/material.dart';
import 'package:neuroloop/domain/extension/app_extension.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final _userProfile = Container(
      child: Text(context.l10n.hello),
    );
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _userProfile,
          ],
        ),
      ),
    );
  }
}
