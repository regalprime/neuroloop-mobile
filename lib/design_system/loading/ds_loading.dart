import 'package:flutter/material.dart';
import 'package:neuroloop/design_system/loading/ds_loading_theme.dart';

import 'internal/app_loading_button.dart';
import 'internal/app_loading_indicator.dart';
import 'internal/app_loading_inline.dart';
import 'internal/app_loading_overlay.dart';

enum AppLoadingType {
  indicator,
  inline,
  button,
  overlay,
}

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
    this.type = AppLoadingType.indicator,
    this.message,
    this.size,
    this.strokeWidth,
    this.dismissible = false,
    this.theme,
  });

  final AppLoadingType type;

  final String? message;

  final double? size;

  final double? strokeWidth;

  final bool dismissible;

  final AppLoadingTheme? theme;

  @override
  Widget build(BuildContext context) {
    final loadingTheme = theme ?? AppLoadingTheme.of(context);

    final child = switch (type) {
      AppLoadingType.indicator => AppLoadingIndicator(
          theme: loadingTheme,
          size: size,
          strokeWidth: strokeWidth,
        ),
      AppLoadingType.inline => AppLoadingInline(
          theme: loadingTheme,
          message: message,
          size: size,
          strokeWidth: strokeWidth,
        ),
      AppLoadingType.button => AppLoadingButton(
          theme: loadingTheme,
          size: size ?? 20,
          strokeWidth: strokeWidth ?? 2,
        ),
      AppLoadingType.overlay => AppLoadingOverlay(
          theme: loadingTheme,
          message: message,
          size: size,
          strokeWidth: strokeWidth,
          dismissible: dismissible,
        ),
    };

    if (type == AppLoadingType.overlay || type == AppLoadingType.button) {
      return child;
    }

    return Center(
      child: child,
    );
  }
}
