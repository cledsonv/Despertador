import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';
import 'package:despertador/src/feactures/domain/repositories/alarm_repository.dart';
import 'package:despertador/src/feactures/domain/usecases/create_alarm_usecase.dart';

class CreateAlarmUsecaseImp implements CreateAlarmUsecase {
  final AlarmRepository repository;

  CreateAlarmUsecaseImp(this.repository);

  @override
  Future<String> create({required AlarmEntity data}) async {
    return await repository.create(data: data);
  }
}
