// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'NeuroLoop';

  @override
  String get startFocus => 'Start Focus';

  @override
  String get stopFocus => 'Stop';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get todayFocus => 'Today Focus Time';

  @override
  String get recentSessions => 'Recent Sessions';

  @override
  String get hello => 'Hello';

  @override
  String get import => 'Import';

  @override
  String get noBooksAvailable => 'No books available.';

  @override
  String get selectTime => 'Select time';

  @override
  String get minute => 'minute';
}
