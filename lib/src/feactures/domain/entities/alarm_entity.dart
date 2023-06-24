class AlarmEntity {
  String id;
  final String title;
  final String active;
  final List<DateTime> dateTime;

  AlarmEntity({
    required this.id,
    required this.title,
    required this.active,
    required this.dateTime,
  });
}
