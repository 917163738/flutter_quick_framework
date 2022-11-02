import 'package:intl/intl.dart';

/// 格式化时间
String duTimeLineFormat(DateTime dt) {
  var now = DateTime.now();
  var difference = now.difference(dt);

  // 1天内
  if (difference.inHours < 24) {
    return "${difference.inHours} hours ago";
  }
  // 30天内
  else if (difference.inDays < 30) {
    return "${difference.inDays} days ago";
  }
  // MM-dd
  else if (difference.inDays < 365) {
    final dtFormat = new DateFormat('MM-dd');
    return dtFormat.format(dt);
  }
  // yyyy-MM-dd
  else {
    final dtFormat = new DateFormat('yyyy-MM-dd');
    var str = dtFormat.format(dt);
    return str;
  }
}

/// "00:01:12"格式转秒
int formatDuration(String? duration) {
  if (duration == null || duration.isEmpty) {
    return 100;
  }
  final durationArr = duration.split(":");
  if (durationArr.isEmpty || durationArr.length == 1) {
    return 100;
  }
  final int hour = durationArr[0].isEmpty ? 0 : int.parse(durationArr[0]);
  final int minute = durationArr[1].isEmpty ? 0 : int.parse(durationArr[1]);
  final int second = durationArr[2].isEmpty ? 0 : int.parse(durationArr[2]);
  return hour * 60 * 60 + minute * 60 + second;
}

/**
 * 秒转"00:01:12"格式
 */
String formatProgress(int progress) {
  if (progress <= 0) {
    return '00:00:00';
  } else if (progress < 59) {
    return '00:00:${handleUnitsTime(progress)}';
  } else if (progress < 3599) {
    return "00:${handleUnitsTime(progress ~/ 60)}:${handleUnitsTime(progress % 60)}";
  } else {
    return "${handleUnitsTime(progress ~/ 3600)}:${handleUnitsTime(progress % 3600 ~/ 60)}:${handleUnitsTime(progress % 3600 % 60)}";
  }
}

String handleUnitsTime(int time) {
  if (time < 10) {
    return "0$time";
  }
  return "$time";
}