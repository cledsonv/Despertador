import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';
import 'package:despertador/src/feactures/domain/repositories/alarm_repository.dart';
import 'package:despertador/src/feactures/domain/usecases/list_alarm_usecase.dart';

class ListHistoricUsecaseImp implements ListAlarmUsecase {
  final AlarmRepository repository;

  ListHistoricUsecaseImp(this.repository);

  @override
  Future<List<AlarmEntity>> list() async {
    return await repository.list();
  }
}
