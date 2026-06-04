import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/motion_tokens.dart';
import '../tokens/spacing_tokens.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    // Semantic
    required this.semanticSuccess,
    required this.semanticSuccessSubtle,
    required this.semanticWarning,
    required this.semanticWarningSubtle,
    required this.semanticError,
    required this.semanticErrorSubtle,
    required this.semanticInfo,
    required this.semanticInfoSubtle,
    required this.onSemanticSuccess,
    required this.onSemanticWarning,
    required this.onSemanticError,
    required this.onSemanticInfo,
    // Surface
    required this.surfaceCard,
    required this.surfaceModal,
    required this.surfaceInput,
    required this.surfaceHover,
    required this.surfacePressed,
    required this.surfaceDisabled,
    // Content
    required this.contentPrimary,
    required this.contentSecondary,
    required this.contentTertiary,
    required this.contentDisabled,
    required this.contentLink,
    // Border
    required this.borderDefault,
    required this.borderStrong,
    required this.borderFocus,
    required this.borderError,
    // Tag
    required this.tagDefaultBackground,
    required this.tagDefaultForeground,
    required this.tagSuccessBackground,
    required this.tagSuccessForeground,
    required this.tagWarningBackground,
    required this.tagWarningForeground,
    required this.tagErrorBackground,
    required this.tagErrorForeground,
    // Tokens
    required this.spacing,
    required this.motion,
  });

  // ── Semantic ────────────────────────────────────────────────
  final Color semanticSuccess;
  final Color semanticSuccessSubtle;
  final Color semanticWarning;
  final Color semanticWarningSubtle;
  final Color semanticError;
  final Color semanticErrorSubtle;
  final Color semanticInfo;
  final Color semanticInfoSubtle;
  final Color onSemanticSuccess;
  final Color onSemanticWarning;
  final Color onSemanticError;
  final Color onSemanticInfo;

  // ── Surface ─────────────────────────────────────────────────
  final Color surfaceCard;
  final Color surfaceModal;
  final Color surfaceInput;
  final Color surfaceHover;
  final Color surfacePressed;
  final Color surfaceDisabled;

  // ── Content ─────────────────────────────────────────────────
  final Color contentPrimary;
  final Color contentSecondary;
  final Color contentTertiary;
  final Color contentDisabled;
  final Color contentLink;

  // ── Border ──────────────────────────────────────────────────
  final Color borderDefault;
  final Color borderStrong;
  final Color borderFocus;
  final Color borderError;

  // ── Tag / Badge ─────────────────────────────────────────────
  final Color tagDefaultBackground;
  final Color tagDefaultForeground;
  final Color tagSuccessBackground;
  final Color tagSuccessForeground;
  final Color tagWarningBackground;
  final Color tagWarningForeground;
  final Color tagErrorBackground;
  final Color tagErrorForeground;

  // ── Non-color tokens ────────────────────────────────────────
  final SpacingTokens spacing;
  final MotionTokens motion;

  // ── Helpers ─────────────────────────────────────────────────

  static AppThemeExtension of(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>();
    assert(ext != null, 'koking');
    return ext!;
  }

  factory AppThemeExtension.fromTokens(
    ColorTokens c,
    SpacingTokens s,
    MotionTokens m,
  ) =>
      AppThemeExtension(
        // Semantic
        semanticSuccess: c.semanticSuccess,
        semanticSuccessSubtle: c.semanticSuccessSubtle,
        semanticWarning: c.semanticWarning,
        semanticWarningSubtle: c.semanticWarningSubtle,
        semanticError: c.semanticError,
        semanticErrorSubtle: c.semanticErrorSubtle,
        semanticInfo: c.semanticInfo,
        semanticInfoSubtle: c.semanticInfoSubtle,
        onSemanticSuccess: c.onSemanticSuccess,
        onSemanticWarning: c.onSemanticWarning,
        onSemanticError: c.onSemanticError,
        onSemanticInfo: c.onSemanticInfo,
        // Surface
        surfaceCard: c.surfaceCard,
        surfaceModal: c.surfaceModal,
        surfaceInput: c.surfaceInput,
        surfaceHover: c.surfaceHover,
        surfacePressed: c.surfacePressed,
        surfaceDisabled: c.surfaceDisabled,
        // Content
        contentPrimary: c.contentPrimary,
        contentSecondary: c.contentSecondary,
        contentTertiary: c.contentTertiary,
        contentDisabled: c.contentDisabled,
        contentLink: c.contentLink,
        // Border
        borderDefault: c.borderDefault,
        borderStrong: c.borderStrong,
        borderFocus: c.borderFocus,
        borderError: c.borderError,
        // Tag
        tagDefaultBackground: c.tagDefaultBackground,
        tagDefaultForeground: c.tagDefaultForeground,
        tagSuccessBackground: c.tagSuccessBackground,
        tagSuccessForeground: c.tagSuccessForeground,
        tagWarningBackground: c.tagWarningBackground,
        tagWarningForeground: c.tagWarningForeground,
        tagErrorBackground: c.tagErrorBackground,
        tagErrorForeground: c.tagErrorForeground,
        // Tokens
        spacing: s,
        motion: m,
      );

  // ── copyWith ────────────────────────────────────────────────

  @override
  AppThemeExtension copyWith({
    // Semantic
    Color? semanticSuccess,
    Color? semanticSuccessSubtle,
    Color? semanticWarning,
    Color? semanticWarningSubtle,
    Color? semanticError,
    Color? semanticErrorSubtle,
    Color? semanticInfo,
    Color? semanticInfoSubtle,
    Color? onSemanticSuccess,
    Color? onSemanticWarning,
    Color? onSemanticError,
    Color? onSemanticInfo,
    // Surface
    Color? surfaceCard,
    Color? surfaceModal,
    Color? surfaceInput,
    Color? surfaceHover,
    Color? surfacePressed,
    Color? surfaceDisabled,
    // Content
    Color? contentPrimary,
    Color? contentSecondary,
    Color? contentTertiary,
    Color? contentDisabled,
    Color? contentLink,
    // Border
    Color? borderDefault,
    Color? borderStrong,
    Color? borderFocus,
    Color? borderError,
    // Tag
    Color? tagDefaultBackground,
    Color? tagDefaultForeground,
    Color? tagSuccessBackground,
    Color? tagSuccessForeground,
    Color? tagWarningBackground,
    Color? tagWarningForeground,
    Color? tagErrorBackground,
    Color? tagErrorForeground,
    // Tokens
    SpacingTokens? spacing,
    MotionTokens? motion,
  }) =>
      AppThemeExtension(
        // Semantic
        semanticSuccess: semanticSuccess ?? this.semanticSuccess,
        semanticSuccessSubtle: semanticSuccessSubtle ?? this.semanticSuccessSubtle,
        semanticWarning: semanticWarning ?? this.semanticWarning,
        semanticWarningSubtle: semanticWarningSubtle ?? this.semanticWarningSubtle,
        semanticError: semanticError ?? this.semanticError,
        semanticErrorSubtle: semanticErrorSubtle ?? this.semanticErrorSubtle,
        semanticInfo: semanticInfo ?? this.semanticInfo,
        semanticInfoSubtle: semanticInfoSubtle ?? this.semanticInfoSubtle,
        onSemanticSuccess: onSemanticSuccess ?? this.onSemanticSuccess,
        onSemanticWarning: onSemanticWarning ?? this.onSemanticWarning,
        onSemanticError: onSemanticError ?? this.onSemanticError,
        onSemanticInfo: onSemanticInfo ?? this.onSemanticInfo,
        // Surface
        surfaceCard: surfaceCard ?? this.surfaceCard,
        surfaceModal: surfaceModal ?? this.surfaceModal,
        surfaceInput: surfaceInput ?? this.surfaceInput,
        surfaceHover: surfaceHover ?? this.surfaceHover,
        surfacePressed: surfacePressed ?? this.surfacePressed,
        surfaceDisabled: surfaceDisabled ?? this.surfaceDisabled,
        // Content
        contentPrimary: contentPrimary ?? this.contentPrimary,
        contentSecondary: contentSecondary ?? this.contentSecondary,
        contentTertiary: contentTertiary ?? this.contentTertiary,
        contentDisabled: contentDisabled ?? this.contentDisabled,
        contentLink: contentLink ?? this.contentLink,
        // Border
        borderDefault: borderDefault ?? this.borderDefault,
        borderStrong: borderStrong ?? this.borderStrong,
        borderFocus: borderFocus ?? this.borderFocus,
        borderError: borderError ?? this.borderError,
        // Tag
        tagDefaultBackground: tagDefaultBackground ?? this.tagDefaultBackground,
        tagDefaultForeground: tagDefaultForeground ?? this.tagDefaultForeground,
        tagSuccessBackground: tagSuccessBackground ?? this.tagSuccessBackground,
        tagSuccessForeground: tagSuccessForeground ?? this.tagSuccessForeground,
        tagWarningBackground: tagWarningBackground ?? this.tagWarningBackground,
        tagWarningForeground: tagWarningForeground ?? this.tagWarningForeground,
        tagErrorBackground: tagErrorBackground ?? this.tagErrorBackground,
        tagErrorForeground: tagErrorForeground ?? this.tagErrorForeground,
        // Tokens
        spacing: spacing ?? this.spacing,
        motion: motion ?? this.motion,
      );

  // ── lerp ────────────────────────────────────────────────────

  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    if (other is! AppThemeExtension) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppThemeExtension(
      // Semantic
      semanticSuccess: c(semanticSuccess, other.semanticSuccess),
      semanticSuccessSubtle: c(semanticSuccessSubtle, other.semanticSuccessSubtle),
      semanticWarning: c(semanticWarning, other.semanticWarning),
      semanticWarningSubtle: c(semanticWarningSubtle, other.semanticWarningSubtle),
      semanticError: c(semanticError, other.semanticError),
      semanticErrorSubtle: c(semanticErrorSubtle, other.semanticErrorSubtle),
      semanticInfo: c(semanticInfo, other.semanticInfo),
      semanticInfoSubtle: c(semanticInfoSubtle, other.semanticInfoSubtle),
      onSemanticSuccess: c(onSemanticSuccess, other.onSemanticSuccess),
      onSemanticWarning: c(onSemanticWarning, other.onSemanticWarning),
      onSemanticError: c(onSemanticError, other.onSemanticError),
      onSemanticInfo: c(onSemanticInfo, other.onSemanticInfo),
      // Surface
      surfaceCard: c(surfaceCard, other.surfaceCard),
      surfaceModal: c(surfaceModal, other.surfaceModal),
      surfaceInput: c(surfaceInput, other.surfaceInput),
      surfaceHover: c(surfaceHover, other.surfaceHover),
      surfacePressed: c(surfacePressed, other.surfacePressed),
      surfaceDisabled: c(surfaceDisabled, other.surfaceDisabled),
      // Content
      contentPrimary: c(contentPrimary, other.contentPrimary),
      contentSecondary: c(contentSecondary, other.contentSecondary),
      contentTertiary: c(contentTertiary, other.contentTertiary),
      contentDisabled: c(contentDisabled, other.contentDisabled),
      contentLink: c(contentLink, other.contentLink),
      // Border
      borderDefault: c(borderDefault, other.borderDefault),
      borderStrong: c(borderStrong, other.borderStrong),
      borderFocus: c(borderFocus, other.borderFocus),
      borderError: c(borderError, other.borderError),
      // Tag
      tagDefaultBackground: c(tagDefaultBackground, other.tagDefaultBackground),
      tagDefaultForeground: c(tagDefaultForeground, other.tagDefaultForeground),
      tagSuccessBackground: c(tagSuccessBackground, other.tagSuccessBackground),
      tagSuccessForeground: c(tagSuccessForeground, other.tagSuccessForeground),
      tagWarningBackground: c(tagWarningBackground, other.tagWarningBackground),
      tagWarningForeground: c(tagWarningForeground, other.tagWarningForeground),
      tagErrorBackground: c(tagErrorBackground, other.tagErrorBackground),
      tagErrorForeground: c(tagErrorForeground, other.tagErrorForeground),

      spacing: t < 0.5 ? spacing : other.spacing,
      motion: t < 0.5 ? motion : other.motion,
    );
  }
}
