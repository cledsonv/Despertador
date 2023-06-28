import 'package:despertador/src/feactures/domain/repositories/alarm_repository.dart';
import 'package:despertador/src/feactures/domain/usecases/delete_alarm_usecase.dart';

class DeleteAlarmUsecaseImp implements DeleteAlarmUsecase {
  final AlarmRepository repository;

  DeleteAlarmUsecaseImp(this.repository);

  @override
  Future<String> delete({required String id}) async {
    return await repository.delete(id: id);
  }
}
