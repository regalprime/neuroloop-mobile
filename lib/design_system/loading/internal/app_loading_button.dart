import 'package:flutter/material.dart';
import 'package:neuroloop/design_system/loading/ds_loading_theme.dart';

import 'app_loading_indicator.dart';

class AppLoadingButton extends StatelessWidget {
  const AppLoadingButton({
    super.key,
    required this.theme,
    this.size = 20,
    this.strokeWidth = 2,
  });

  final AppLoadingTheme theme;

  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return AppLoadingIndicator(
      theme: theme,
      size: size,
      strokeWidth: strokeWidth,
    );
  }
}
