import 'package:flutter/material.dart';

enum AppLanguage {
  vietnamese(
    code: 'vi',
    locale: Locale('vi'),
  ),
  english(
    code: 'en',
    locale: Locale('en'),
  );

  const AppLanguage({
    required this.code,
    required this.locale,
  });

  final String code;
  final Locale locale;
}
