unixToYMDH(int unixtime) {
  int seconds = -DateTime.fromMillisecondsSinceEpoch(unixtime * 1000)
      .difference(DateTime.now())
      .inSeconds;
  int minute = -DateTime.fromMillisecondsSinceEpoch(unixtime * 1000)
      .difference(DateTime.now())
      .inMinutes;
  int hours = -DateTime.fromMillisecondsSinceEpoch(unixtime * 1000)
      .difference(DateTime.now())
      .inHours;
  int days = -DateTime.fromMillisecondsSinceEpoch(unixtime * 1000)
      .difference(DateTime.now())
      .inDays;
  int months = (days / 30).truncate();
  int years = (days / 365).truncate();

  if (minute == 0) {
    return '$seconds second${seconds == 1 ? '' : 's'} ago';
  }
  if (minute >= 1 && minute < 60) {
    String posted = '$minute minute${minute == 1 ? '' : "s"} ago';
    return posted;
  }
  if (minute >= 60 && minute < 24 * 60) {
    String rim;
    int rminute = (minute % 60).truncate();
    rminute == 0
        ? rim = ""
        : rim = rminute.toString() + ' minute${rminute == 1 ? "" : "s "}';

    String posted = '$hours hour${hours == 1 ? ' ' : "s "}' + rim + " ago";
    return posted;
  }
  if (minute >= 24 * 60 && minute < 24 * 60 * 30) {
    String rim;
    int rhour = (hours % 24).truncate();
    rhour == 0
        ? rim = ""
        : rim = rhour.toString() + ' hour${rhour == 1 ? "" : "s "}';
    String posted = '$days day${days == 1 ? ' ' : "s "}' + rim + " ago";
    return posted;
  }
  if (minute >= 24 * 60 * 30 && minute < 24 * 60 * 365) {
    String rim;
    int rday = (days % 30).truncate();
    rday == 0
        ? rim = ""
        : rim = rday.toString() + ' day${rday == 1 ? "" : "s "}';
    String posted = '$months month${months == 1 ? ' ' : "s "}' + rim + " ago";
    return posted;
  }
  if (minute >= 24 * 60 * 365 && minute < 24 * 60 * 365 * 5) {
    String rim;
    int rmonth = (months % 12).truncate();
    rmonth == 0
        ? rim = ""
        : rim = rmonth.toString() + ' month${rmonth == 1 ? "" : "s "}';
    String posted = '$years year${years == 1 ? ' ' : "s "}' + rim + " ago";
    return posted;
  }
  return "$years years ago";
}
