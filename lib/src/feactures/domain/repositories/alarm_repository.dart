import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';

abstract class AlarmRepository {
  Future<String> create({required AlarmEntity data});
  Future<Map<String, dynamic>> update(
      {required AlarmEntity data, required String id});
  Future<String> delete({required String id});
  Future<AlarmEntity> get({required String id});
  Future<List<AlarmEntity>> list();
}
