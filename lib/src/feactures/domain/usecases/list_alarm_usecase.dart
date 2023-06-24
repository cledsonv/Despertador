import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';

abstract class ListAlarmUsecase {
  Future<List<AlarmEntity>> list();
}
