enum AppThemeId {
  lightDefault,
  darkDefault,
  highContrastLight,
  highContrastDark,
  amoled,
  sepia,
  brandA,
  brandB;

  String get displayName => switch (this) {
        lightDefault => 'Sáng',
        darkDefault => 'Tối',
        highContrastLight => 'Tương phản cao (sáng)',
        highContrastDark => 'Tương phản cao (tối)',
        amoled => 'AMOLED đen',
        sepia => 'Sepia — đọc sách',
        brandA => 'Thương hiệu A',
        brandB => 'Thương hiệu B',
      };

  bool get isDark => switch (this) {
        darkDefault || highContrastDark || amoled => true,
        _ => false,
      };

  bool get isHighContrast => this == highContrastLight || this == highContrastDark;
}
