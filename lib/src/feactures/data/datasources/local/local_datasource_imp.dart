import 'package:despertador/src/feactures/data/datasources/local/data_table_enum.dart';
import 'package:despertador/src/feactures/data/datasources/local/local_datasource.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class LocalDatasourceImp implements LocalDatasource {
  final String dbName = "alarm.db";

  Database? _db;

  Future<Database> get database => _starting();

  Future<Database> _starting() async {
    if (_db != null) {
      return _db!;
    }
    DatabaseFactory dbFactory = databaseFactoryIo;
    final dir = await getApplicationDocumentsDirectory();

    _db = await dbFactory.openDatabase(join(dir.path, dbName));
    return _db!;
  }

  @override
  Future<String> create({
    required Map<String, dynamic> data,
    required String id,
    required DataTables table,
  }) async {
    final store = StoreRef<String, dynamic>(table.name);
    var result = await store.record(id).add(await database, data);
    if (result == null) {
      throw Exception('Registro não inserido');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> update({
    required Map<String, dynamic> data,
    required DataTables table,
    required String id,
  }) async {
    final store = StoreRef<String, dynamic>(table.name);
    Map<String, dynamic> result =
        await store.record(id).put(await database, data);

    return result;
  }

  @override
  Future<String> delete({required String id, required DataTables table}) async {
    final store = StoreRef<String, dynamic>(table.name);
    var result = await store.record(id).delete(await database);
    if (result == null) {
      throw Exception('Registro não deletado');
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>?> get(
      {required DataTables table, required String id}) async {
    final store = StoreRef<String, dynamic>(table.name);
    return await store.record(id).get(await database);
  }

  @override
  Future<List<Map<String, dynamic>>> list({required DataTables table}) async {
    final store = StoreRef<String, dynamic>(table.name);
    final result = await store.find(await database);
    return result.map((e) => Map<String, dynamic>.from(e.value)).toList();
  }
}
