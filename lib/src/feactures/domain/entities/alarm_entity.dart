class AlarmEntity {
  String? id;
  final String title;
  final bool active;
  final int dateTime;
  final int createAt;

  AlarmEntity({
    this.id,
    required this.title,
    required this.active,
    required this.dateTime,
    required this.createAt
  });
}
