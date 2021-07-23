enum WeeksEnum {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday
}

class WeeksEnumName {
  static const String sunday = 'Sunday';
  static const String monday = 'Monday';
  static const String tuesday = 'Tuesday';
  static const String wednesday = 'Wednesday';
  static const String thursday = 'Thursday';
  static const String friday = 'Friday';
  static const String saturday = 'Saturday';
}

extension WeeksExtension on WeeksEnum {
  String getString() {
    switch (this) {
      case WeeksEnum.sunday:
        return WeeksEnumName.sunday;
      case WeeksEnum.monday:
        return WeeksEnumName.monday;
      case WeeksEnum.tuesday:
        return WeeksEnumName.tuesday;
      case WeeksEnum.wednesday:
        return WeeksEnumName.wednesday;
      case WeeksEnum.thursday:
        return WeeksEnumName.thursday;
      case WeeksEnum.friday:
        return WeeksEnumName.friday;
      case WeeksEnum.saturday:
        return WeeksEnumName.saturday;
      default:
        return null;
    }
  }
}