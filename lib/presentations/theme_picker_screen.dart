import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme/theme_bloc.dart';
import '../domain/app_theme.dart';
import '../domain/extension/app_theme_extension.dart';
import '../registry/theme_registry.dart';

class ThemePickerScreen extends StatelessWidget {
  const ThemePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = AppThemeExtension.of(context);
    final state = context.watch<ThemeBloc>().state;
    final themes = ThemeRegistry.instance.all;

    return Scaffold(
      appBar: AppBar(title: const Text('Giao diện')),
      body: ListView(
        padding: EdgeInsets.all(ext.spacing.md),
        children: [
          SwitchListTile(
            title: const Text('Theo hệ thống'),
            subtitle: const Text('Tự động đổi sáng/tối'),
            value: state.followSystem,
            onChanged: (_) => context.read<ThemeBloc>().add(ThemeSystemToggled()),
          ),
          Divider(color: ext.borderDefault, height: ext.spacing.lg),
          Text('Chọn theme', style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: ext.spacing.md),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              mainAxisExtent: 100,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: themes.length,
            itemBuilder: (_, i) => _ThemeCard(
              theme: themes[i],
              selected: themes[i].id == state.selectedId,
              onTap: () => context.read<ThemeBloc>().add(ThemeSelected(themes[i].id)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeCard extends StatelessWidget {
  const _ThemeCard({
    required this.theme,
    required this.selected,
    required this.onTap,
  });

  final AppTheme theme;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = AppThemeExtension.of(context);
    final td = theme.themeData;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: ext.motion.durationFast,
        curve: ext.motion.curveStandard,
        decoration: BoxDecoration(
          color: td.colorScheme.surface,
          borderRadius: BorderRadius.circular(ext.spacing.radiusLg),
          border: Border.all(
            color: selected ? td.colorScheme.primary : ext.borderDefault,
            width: selected ? 2 : 1,
          ),
        ),
        padding: EdgeInsets.all(ext.spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Preview màu
            Row(children: [
              _ColorDot(td.colorScheme.primary),
              _ColorDot(td.colorScheme.secondary),
              _ColorDot(td.colorScheme.tertiary),
              if (selected) ...[
                const Spacer(),
                Icon(
                  Icons.check_circle,
                  size: 16,
                  color: td.colorScheme.primary,
                ),
              ],
            ]),
            const Spacer(),
            Text(
              theme.displayName,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ext.contentPrimary,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  const _ColorDot(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        width: 16,
        height: 16,
        margin: const EdgeInsets.only(right: 4),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}
