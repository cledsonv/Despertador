import 'package:despertador/src/feactures/data/datasources/local/local_datasource.dart';
import 'package:despertador/src/feactures/data/datasources/local/local_datasource_imp.dart';
import 'package:despertador/src/feactures/data/mappers/alarm_mapper.dart';
import 'package:despertador/src/feactures/data/repositories/alarm_repository_imp.dart';
import 'package:despertador/src/feactures/domain/repositories/alarm_repository.dart';
import 'package:despertador/src/feactures/domain/usecases/create_alarm_usecase.dart';
import 'package:despertador/src/feactures/domain/usecases/delete_alarm_usecase.dart';
import 'package:despertador/src/feactures/domain/usecases/get_alarm_usecase.dart';
import 'package:despertador/src/feactures/domain/usecases/implements/create_alarm_usecase_imp.dart';
import 'package:despertador/src/feactures/domain/usecases/implements/delete_alarm_usecase_imp.dart';
import 'package:despertador/src/feactures/domain/usecases/implements/get_alarm_usecase_imp.dart';
import 'package:despertador/src/feactures/domain/usecases/implements/list_alarm_usecase_imp.dart';
import 'package:despertador/src/feactures/domain/usecases/implements/update_alarm_usecase_imp.dart';
import 'package:despertador/src/feactures/domain/usecases/list_alarm_usecase.dart';
import 'package:despertador/src/feactures/domain/usecases/update_alarm_usecase.dart';
import 'package:despertador/src/feactures/presenter/controller/alarm_controller.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void inicialize() {
    GetIt getIt = GetIt.instance;

    //Mapper
    getIt.registerFactory(() => AlarmMapper());

    //datasource
    getIt.registerFactory<LocalDatasource>(() => LocalDatasourceImp());

    //repository
    getIt.registerFactory<AlarmRepository>(
        () => AlarmRepositoryImp(getIt(), getIt()));

    //usecases
    getIt.registerFactory<CreateAlarmUsecase>(
        () => CreateAlarmUsecaseImp(getIt()));
    getIt.registerFactory<UpdateAlarmUsecase>(
        () => UpdateAlarmUsecaseImp(getIt()));
    getIt.registerFactory<DeleteAlarmUsecase>(
        () => DeleteAlarmUsecaseImp(getIt()));
    getIt.registerFactory<GetAlarmUsecase>(() => GetAlarmUsecaseImp(getIt()));
    getIt.registerFactory<ListAlarmUsecase>(() => ListAlarmUsecaseImp(getIt()));

    //controller
    getIt.registerFactory<AlarmController>(
        () => AlarmController(getIt(), getIt(), getIt(), getIt()));
  }
}
