import 'package:intl/intl.dart';

String formatTimeAgo(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp);
  Duration difference = DateTime.now().difference(dateTime);
  if (difference.inDays > 0) {
    return "${DateFormat('yMMMMd').format(DateTime.now().subtract(difference))} ago";
  } else if (difference.inHours > 0) {
    return "${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago";
  } else if (difference.inMinutes > 0) {
    return "${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago";
  } else {
    return "Just now";
  }
}
