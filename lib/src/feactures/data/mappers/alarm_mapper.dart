import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';

class AlarmMapper {
  AlarmEntity fromJson(Map<String, dynamic> json) {
    return AlarmEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      active: json['active'],
      dayWeek: List<String>.from(json['dayWeek']),
      dateTime: json['dateTime'],
      createAt: json['createAt'],
      updateAt: json['updateAt'],
    );
  }

  Map<String, dynamic> toJson(AlarmEntity data) {
    return {
      'id': data.id,
      'title': data.title,
      'description': data.description,
      'active': data.active,
      'dayWeek': data.dayWeek,
      'dateTime': data.dateTime,
      'createAt': data.createAt,
      'updateAt': data.updateAt,
    };
  }
}
