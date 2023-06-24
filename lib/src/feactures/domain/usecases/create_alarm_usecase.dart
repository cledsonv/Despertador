import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';

abstract class CreateAlarmUsecase {
  Future<String> create(
      {required AlarmEntity data});
}
