import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';

class AlarmMapper {
  AlarmEntity fromJson(Map<String, dynamic> json) {
    return AlarmEntity(
      id: json['id'],
      title: json['title'],
      active: json['active'],
      dateTime: json['dateTime'],
      createAt: json['createAt'],
    );
  }

  Map<String, dynamic> toJson(AlarmEntity data) {
    return {
      'id': data.id,
      'title': data.title,
      'active': data.active,
      'dateTime': data.dateTime,
      'createAt': data.createAt,
    };
  }
}
