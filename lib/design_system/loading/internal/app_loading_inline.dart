import 'package:flutter/material.dart';
import 'package:neuroloop/design_system/loading/ds_loading_theme.dart';

import 'app_loading_indicator.dart';

class AppLoadingInline extends StatelessWidget {
  const AppLoadingInline({
    super.key,
    required this.theme,
    this.message,
    this.size,
    this.strokeWidth,
  });

  final AppLoadingTheme theme;

  final String? message;

  final double? size;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppLoadingIndicator(
          theme: theme,
          size: size,
          strokeWidth: strokeWidth,
        ),
        if (message != null) ...[
          SizedBox(height: theme.messageSpacing),
          Text(
            message!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ],
    );
  }
}
