import 'package:flutter/material.dart';

class AppLoadingTheme {
  const AppLoadingTheme({
    required this.color,
    required this.trackColor,
    required this.size,
    required this.strokeWidth,
    required this.animationDuration,
    required this.overlayColor,
    required this.messageSpacing,
  });

  final Color color;
  final Color trackColor;

  final double size;
  final double strokeWidth;

  final Duration animationDuration;

  final Color overlayColor;

  final double messageSpacing;

  factory AppLoadingTheme.light(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppLoadingTheme(
      color: colorScheme.primary,
      trackColor: colorScheme.primary.withValues(alpha: 0.15),
      size: 40,
      strokeWidth: 3,
      animationDuration: const Duration(milliseconds: 1200),
      overlayColor: Colors.black.withValues(alpha: 0.35),
      messageSpacing: 16,
    );
  }

  factory AppLoadingTheme.dark(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppLoadingTheme(
      color: colorScheme.primary,
      trackColor: colorScheme.primary.withValues(alpha: 0.15),
      size: 40,
      strokeWidth: 3,
      animationDuration: const Duration(milliseconds: 1200),
      overlayColor: Colors.black.withValues(alpha: 0.55),
      messageSpacing: 16,
    );
  }

  factory AppLoadingTheme.of(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return brightness == Brightness.dark ? AppLoadingTheme.dark(context) : AppLoadingTheme.light(context);
  }

  AppLoadingTheme copyWith({
    Color? color,
    Color? trackColor,
    double? size,
    double? strokeWidth,
    Duration? animationDuration,
    Color? overlayColor,
    double? messageSpacing,
  }) {
    return AppLoadingTheme(
      color: color ?? this.color,
      trackColor: trackColor ?? this.trackColor,
      size: size ?? this.size,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      animationDuration: animationDuration ?? this.animationDuration,
      overlayColor: overlayColor ?? this.overlayColor,
      messageSpacing: messageSpacing ?? this.messageSpacing,
    );
  }
}
