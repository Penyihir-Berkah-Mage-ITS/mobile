String formatTimeAgo(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp);
  Duration difference = DateTime.now().difference(dateTime);

  if (difference.inDays >= 365) {
    int years = (difference.inDays / 365).floor();
    return "$years ${years == 1 ? 'year' : 'years'} ago";
  } else if (difference.inDays >= 30) {
    int months = (difference.inDays / 30).floor();
    return "$months ${months == 1 ? 'month' : 'months'} ago";
  } else if (difference.inDays >= 7) {
    int weeks = (difference.inDays / 7).floor();
    return "$weeks ${weeks == 1 ? 'week' : 'weeks'} ago";
  } else if (difference.inDays > 0) {
    return "${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago";
  } else if (difference.inHours > 0) {
    return "${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago";
  } else if (difference.inMinutes > 0) {
    return "${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago";
  } else {
    return "Just now";
  }
}
