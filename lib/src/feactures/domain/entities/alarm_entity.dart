// ignore_for_file: public_member_api_docs, sort_constructors_first
class AlarmEntity {
  String? id;
  final String title;
  bool active;
  final int dateTime;
  final int createAt;
  final int updateAt;

  AlarmEntity({
    this.id,
    required this.title,
    required this.active,
    required this.dateTime,
    required this.createAt,
    required this.updateAt,
  });
}
