import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';
import 'package:despertador/src/feactures/domain/repositories/alarm_repository.dart';
import 'package:despertador/src/feactures/domain/usecases/get_alarm_usecase.dart';

class GetHistoricUsecaseImp implements GetAlarmUsecase {
  final AlarmRepository repository;

  GetHistoricUsecaseImp(this.repository);

  @override
  Future<AlarmEntity> get({required String id}) async {
    return await repository.get(id: id);
  }
}
