import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';
import 'package:despertador/src/feactures/domain/repositories/alarm_repository.dart';
import 'package:despertador/src/feactures/domain/usecases/update_alarm_usecase.dart';

class UpdateAlarmUsecaseImp implements UpdateAlarmUsecase {
  final AlarmRepository repository;

  UpdateAlarmUsecaseImp(this.repository);

  @override
  Future<Map<String, dynamic>> update(
      {required AlarmEntity data, required String id}) async {
    return await repository.update(data: data, id: id);
  }
}
