import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';
import 'package:despertador/src/feactures/domain/repositories/alarm_repository.dart';
import 'package:despertador/src/feactures/domain/usecases/list_alarm_usecase.dart';

class ListAlarmUsecaseImp implements ListAlarmUsecase {
  final AlarmRepository repository;

  ListAlarmUsecaseImp(this.repository);

  @override
  Future<List<AlarmEntity>> list() async {
    return await repository.list();
  }
}
