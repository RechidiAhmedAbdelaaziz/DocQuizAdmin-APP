extension ToTime on num {
  // String get toTimeHourMinuteSecond {

  //   //this num is in seconds i want to convert it to hour:minute:second

  //   final int hours = this ~/ 3600;

  //   return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  // }

  Duration get toDuration {
    final int hours = this ~/ 3600;
    final int minutes = (this - (hours * 3600)) ~/ 60;

    final int seconds =
        (this - (hours * 3600) - (minutes * 60)).toInt();

    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  String get toTimeHourMinuteSecond {
    final duration = toDuration;

    final int hours = duration.inHours;
    final int minutes = duration.inMinutes.remainder(60);
    final int seconds = duration.inSeconds.remainder(60);

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String toHours() {
    final int hours = this ~/ 3600;
    return hours.toString();
  }

  String toMinutes() {
    final int minutes = (this ~/ 60).remainder(60);
    return minutes.toString();
  }
}
