import 'package:despertador/src/feactures/data/datasources/local/data_table_enum.dart';
import 'package:despertador/src/feactures/data/datasources/local/local_datasource.dart';
import 'package:despertador/src/feactures/data/mappers/alarm_mapper.dart';
import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';
import 'package:despertador/src/feactures/domain/repositories/alarm_repository.dart';
import 'package:uuid/uuid.dart';

class AlarmRepositoryImp implements AlarmRepository {
  final LocalDatasource dataBase;
  final AlarmMapper alarmMapper;

  AlarmRepositoryImp(this.dataBase, this.alarmMapper);

  var table = DataTables.alarm;
  final Uuid _uuid = const Uuid();

  @override
  Future<String> create({required AlarmEntity data}) async {
    String id = _uuid.v4();
    data.id = id;
    return await dataBase.create(
        data: alarmMapper.toJson(data), table: table, id: id);
  }

  @override
  Future<Map<String, dynamic>> update(
      {required AlarmEntity data, required String id}) async {
    var result = await dataBase.update(
        data: alarmMapper.toJson(data), table: table, id: id);
    return result;
  }

  @override
  Future<String> delete({required String id}) async {
    return await dataBase.delete(table: table, id: id);
  }

  @override
  Future<AlarmEntity> get({required String id}) async {
    var take = await dataBase.get(table: table, id: id);
    var result = alarmMapper.fromJson(take!);
    return result;
  }

  @override
  Future<List<AlarmEntity>> list() async {
    var take = await dataBase.list(table: table);
    var result = take.map((e) => alarmMapper.fromJson(e)).toList();
    return result;
  }
}
