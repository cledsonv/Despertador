import 'package:despertador/src/feactures/data/datasources/local/data_table_enum.dart';

abstract class LocalDatasource {
  Future<String> create(
      {required Map<String, dynamic> data,
      required String id,
      required DataTables table});
  Future<Map<String, dynamic>> update(
      {required Map<String, dynamic> data,
      required DataTables table,
      required String id});
  Future<String> delete({required DataTables table, required String id});
  Future<Map<String, dynamic>?> get(
      {required DataTables table, required String id});
  Future<List<Map<String, dynamic>>> list({required DataTables table});
}
