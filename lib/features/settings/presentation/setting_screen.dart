import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neuroloop/core/router/app_routes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.push(AppRoutes.theme);
              },
              child: Text('Settings content goes here'),
            ),
          ],
        ),
      ),
    );
  }
}
