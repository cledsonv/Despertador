// ignore_for_file: public_member_api_docs, sort_constructors_first
class AlarmEntity {
  String? id;
  final String title;
  final String description;
  bool active;
  final List<String> dayWeek;
  final int dateTime;
  final int createAt;
  final int updateAt;

  AlarmEntity({
    this.id,
    required this.title,
    required this.description,
    required this.active,
    required this.dayWeek,
    required this.dateTime,
    required this.createAt,
    required this.updateAt,
  });

  AlarmEntity copyWith({
    String? id,
    String? title,
    String? description,
    bool? active,
    List<String>? dayWeek,
    int? dateTime,
    int? createAt,
    int? updateAt,
  }) {
    return AlarmEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      active: active ?? this.active,
      dayWeek: dayWeek ?? this.dayWeek,
      dateTime: dateTime ?? this.dateTime,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
