// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'NeuroLoop';

  @override
  String get startFocus => 'Bắt đầu tập trung';

  @override
  String get stopFocus => 'Dừng';

  @override
  String get dashboard => 'Bảng điều khiển';

  @override
  String get todayFocus => 'Thời gian tập trung hôm nay';

  @override
  String get recentSessions => 'Phiên gần đây';

  @override
  String get hello => 'Xin chào';

  @override
  String get import => 'Nhập';

  @override
  String get noBooksAvailable => 'Không có sách nào.';

  @override
  String get selectTime => 'Chọn giờ';

  @override
  String get deleteBook => 'Xóa sách';

  @override
  String get confirmDeleteBook => 'Bạn có chắc chắn muốn xóa sách này không?';

  @override
  String get cancel => 'Hủy';

  @override
  String get delete => 'Xóa';

  @override
  String get gotIt => 'Đã hiểu';

  @override
  String get minute => 'phút';
}
