import 'package:intl/intl.dart';

abstract class DateUtil {
  // Calculate relative time
  static String timeAgo(String createdAt) {
    final createdTime = DateTime.parse(createdAt);
    final now = DateTime.now();
    final difference = now.difference(createdTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return DateFormat('dd MMM yyyy').format(createdTime);
    }
  }
}
