import 'package:flutter/material.dart';
import 'package:neuroloop/design_system/loading/ds_loading_theme.dart';

import 'app_loading_inline.dart';

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    super.key,
    required this.theme,
    this.message,
    this.size,
    this.strokeWidth,
    this.dismissible = false,
  });

  final AppLoadingTheme theme;

  final String? message;

  final double? size;
  final double? strokeWidth;

  final bool dismissible;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ModalBarrier(
            color: theme.overlayColor,
            dismissible: dismissible,
          ),
        ),
        Positioned.fill(
          child: Center(
            child: AppLoadingInline(
              theme: theme,
              message: message,
              size: size,
              strokeWidth: strokeWidth,
            ),
          ),
        ),
      ],
    );
  }
}
