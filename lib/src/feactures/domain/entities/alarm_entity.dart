// ignore_for_file: public_member_api_docs, sort_constructors_first
class AlarmEntity {
  String? id;
  final int idAlarm;
  final String title;
  final String description;
  bool active;
  final List<String> dayWeek;
  final int dateTime;
  final int createAt;
  final int updateAt;
  final String music;

  AlarmEntity({
    this.id,
    required this.idAlarm,
    required this.title,
    required this.description,
    required this.active,
    required this.dayWeek,
    required this.dateTime,
    required this.createAt,
    required this.updateAt,
    required this.music,
  });

  AlarmEntity copyWith({
    String? id,
    int? idAlarm,
    String? title,
    String? description,
    bool? active,
    List<String>? dayWeek,
    int? dateTime,
    int? createAt,
    int? updateAt,
    String? music,
  }) {
    return AlarmEntity(
      id: id ?? this.id,
      idAlarm: idAlarm ?? this.idAlarm,
      title: title ?? this.title,
      description: description ?? this.description,
      active: active ?? this.active,
      dayWeek: dayWeek ?? this.dayWeek,
      dateTime: dateTime ?? this.dateTime,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
      music: music ?? this.music,
    );
  }
}
