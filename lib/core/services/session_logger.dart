import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SessionLogger {
  final List<String> _log = [];

  List<String> get getLog => _log;

  void log(String message) {
    final date = DateFormat('yyyy-MM-dd H:mm:ss').format(DateTime.now());
    final item = '$date $message';
    _log.add(item);
  }
}
