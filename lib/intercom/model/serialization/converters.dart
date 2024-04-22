DateTime secondsToDateTime(int json) {
  return DateTime.fromMillisecondsSinceEpoch(json * 1000);
}

int dateTimeToSeconds(DateTime value) {
  return value.millisecondsSinceEpoch ~/ 1000;
}
