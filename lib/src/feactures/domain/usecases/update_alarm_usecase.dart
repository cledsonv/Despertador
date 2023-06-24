import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';

abstract class UpdateAlarmUsecase {
  Future<Map<String, dynamic>> update(
      {required AlarmEntity data, required String id});
}
