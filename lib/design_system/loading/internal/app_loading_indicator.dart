import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:neuroloop/design_system/loading/ds_loading_theme.dart';

class AppLoadingIndicator extends StatefulWidget {
  const AppLoadingIndicator({
    super.key,
    required this.theme,
    this.size,
    this.strokeWidth,
  });

  final AppLoadingTheme theme;

  final double? size;
  final double? strokeWidth;

  @override
  State<AppLoadingIndicator> createState() => _AppLoadingIndicatorState();
}

class _AppLoadingIndicatorState extends State<AppLoadingIndicator> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.theme.animationDuration,
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant AppLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.theme.animationDuration != widget.theme.animationDuration) {
      _controller
        ..duration = widget.theme.animationDuration
        ..repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size ?? widget.theme.size;
    final strokeWidth = widget.strokeWidth ?? widget.theme.strokeWidth;

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _LoadingPainter(
              progress: _controller.value,
              color: widget.theme.color,
              trackColor: widget.theme.trackColor,
              strokeWidth: strokeWidth,
            ),
          );
        },
      ),
    );
  }
}

class _LoadingPainter extends CustomPainter {
  const _LoadingPainter({
    required this.progress,
    required this.color,
    required this.trackColor,
    required this.strokeWidth,
  });

  final double progress;
  final Color color;
  final Color trackColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = math.min(size.width, size.height) / 2 - strokeWidth / 2;

    final rect = Rect.fromCircle(
      center: center,
      radius: radius,
    );

    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      0,
      math.pi * 2,
      false,
      trackPaint,
    );

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    const startAngle = -math.pi / 2;

    final sweepAngle = math.pi * 1.4 * (0.35 + progress * 0.65);

    final animatedStart = startAngle + progress * math.pi * 2;

    canvas.drawArc(
      rect,
      animatedStart,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _LoadingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
