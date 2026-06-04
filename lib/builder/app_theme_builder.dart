import 'package:flutter/material.dart';

import '../domain/app_theme.dart';
import '../domain/app_theme_id.dart';
import '../domain/extension/app_theme_extension.dart';
import '../domain/tokens/color_tokens.dart';
import '../domain/tokens/motion_tokens.dart';
import '../domain/tokens/spacing_tokens.dart';
import '../domain/tokens/typography_tokens.dart';

class AppThemeBuilder {
  AppThemeBuilder._();

  static AppTheme build({
    required AppThemeId id,
    required ColorTokens colors,
    required TypographyTokens typography,
    required SpacingTokens spacing,
    required MotionTokens motion,
  }) {
    final brightness = id.isDark ? Brightness.dark : Brightness.light;
    final colorScheme = colors.toColorScheme(brightness);
    final textTheme = typography.buildTextTheme(
      colors.contentPrimary,
      colors.contentSecondary,
    );
    final s = spacing;

    final themeData = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,

      // ── App Bar ────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surfaceCard,
        foregroundColor: colors.contentPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
      ),

      // ── Card ───────────────────────────────────────────────
      cardTheme: CardTheme(
        color: colors.surfaceCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(s.radiusLg),
          side: BorderSide(color: colors.borderDefault),
        ),
        margin: EdgeInsets.all(s.sm),
      ),

      // ── ElevatedButton ─────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.interactivePrimary,
          foregroundColor: colors.onBrandPrimary,
          disabledBackgroundColor: colors.interactivePrimaryDisabled,
          elevation: 0,
          minimumSize: const Size(0, 48),
          padding: EdgeInsets.symmetric(
            horizontal: s.lg,
            vertical: s.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(s.radiusMd),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),

      // ── OutlinedButton ─────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.interactivePrimary,
          side: BorderSide(color: colors.interactivePrimary),
          minimumSize: const Size(0, 48),
          padding: EdgeInsets.symmetric(horizontal: s.lg, vertical: s.sm),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(s.radiusMd),
          ),
        ),
      ),

      // ── TextButton ─────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.interactivePrimary,
          minimumSize: const Size(0, 48),
          padding: EdgeInsets.symmetric(horizontal: s.md, vertical: s.sm),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(s.radiusMd),
          ),
        ),
      ),

      // ── Input / TextField ──────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceInput,
        contentPadding: EdgeInsets.symmetric(
          horizontal: s.md,
          vertical: s.sm + 2,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(s.radiusMd),
          borderSide: BorderSide(color: colors.borderDefault),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(s.radiusMd),
          borderSide: BorderSide(color: colors.borderDefault),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(s.radiusMd),
          borderSide: BorderSide(color: colors.borderFocus, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(s.radiusMd),
          borderSide: BorderSide(color: colors.borderError),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(s.radiusMd),
          borderSide: BorderSide(color: colors.borderError, width: 2),
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: colors.contentTertiary,
        ),
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: colors.contentSecondary,
        ),
        errorStyle: textTheme.labelSmall?.copyWith(
          color: colors.semanticError,
        ),
      ),

      // ── Chip ───────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: colors.tagDefaultBackground,
        labelStyle: textTheme.labelMedium?.copyWith(
          color: colors.tagDefaultForeground,
        ),
        side: BorderSide.none,
        padding: EdgeInsets.symmetric(horizontal: s.sm, vertical: s.xs),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(s.radiusFull),
        ),
      ),

      // ── BottomNavigationBar ───────────────────────────────
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.surfaceCard,
        selectedItemColor: colors.brandPrimary,
        unselectedItemColor: colors.contentTertiary,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),

      // ── NavigationBar (Material 3) ─────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.surfaceCard,
        indicatorColor: colors.brandPrimary.withValues(alpha: 0.12),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: colors.brandPrimary);
          }
          return IconThemeData(color: colors.contentTertiary);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return textTheme.labelSmall?.copyWith(color: colors.brandPrimary);
          }
          return textTheme.labelSmall?.copyWith(color: colors.contentTertiary);
        }),
      ),

      // ── Dialog ─────────────────────────────────────────────
      dialogTheme: DialogTheme(
        backgroundColor: colors.surfaceModal,
        elevation: s.elevationModal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(s.radiusXl),
        ),
        titleTextStyle: textTheme.headlineSmall?.copyWith(
          color: colors.contentPrimary,
        ),
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colors.contentSecondary,
        ),
      ),

      // ── SnackBar ───────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.contentPrimary,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colors.contentInverse,
        ),
        actionTextColor: colors.brandSecondary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(s.radiusMd),
        ),
      ),

      // ── Divider ────────────────────────────────────────────
      dividerTheme: DividerThemeData(
        color: colors.borderDefault,
        thickness: 1,
        space: 1,
      ),

      // ── Switch ─────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return colors.onBrandPrimary;
          return colors.contentTertiary;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return colors.brandPrimary;
          return colors.borderDefault;
        }),
      ),

      // ── Checkbox ───────────────────────────────────────────
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return colors.brandPrimary;
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(colors.onBrandPrimary),
        side: BorderSide(color: colors.borderStrong, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(s.radiusSm),
        ),
      ),

      // ── ListTile ───────────────────────────────────────────
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: s.md,
          vertical: s.xs,
        ),
        titleTextStyle: textTheme.bodyLarge?.copyWith(
          color: colors.contentPrimary,
        ),
        subtitleTextStyle: textTheme.bodyMedium?.copyWith(
          color: colors.contentSecondary,
        ),
        iconColor: colors.contentSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(s.radiusMd),
        ),
      ),

      // ── PageTransitions ────────────────────────────────────
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        },
      ),

      // ── Extensions (token custom) ──────────────────────────
      extensions: [
        AppThemeExtension.fromTokens(colors, spacing, motion),
      ],
    );

    return AppTheme(
      id: id,
      themeData: themeData,
      extension: AppThemeExtension.fromTokens(colors, spacing, motion),
    );
  }
}
