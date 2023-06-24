import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';

abstract class GetAlarmUsecase {
  Future<AlarmEntity> get({required String id});
}
