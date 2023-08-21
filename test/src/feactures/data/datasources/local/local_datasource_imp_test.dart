import 'package:despertador/src/feactures/data/datasources/local/data_table_enum.dart';
import 'package:despertador/src/feactures/data/datasources/local/local_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalDatasource extends Mock implements LocalDatasource {}

void main() {
  final LocalDatasource data = MockLocalDatasource();

  setUp(() {
    registerFallbackValue(<String, dynamic>{});
    registerFallbackValue(DataTables.alarm);
    registerFallbackValue('');
  });

  test('database local imp ...', () async {
    when(() => data.create(
          data: any(named: 'data'),
          id: any(named: 'id'),
          table: any(named: 'table'),
        )).thenAnswer((_) async => '123');

    expect(
        await data.create(
          data: {
            'title': 'Medicaçao',
            'description': 'descriçao de alguma coisa',
            'child': 'Cledson ventura',
          },
          id: '123',
          table: DataTables.alarm,
        ),
        '23');
    expect(
        await data.update(
          data: {
            'title': 'Medicaçaoooo',
            'description': 'descriçao de alguma coisa',
            'child': 'Cledson ventura',
          },
          id: '123',
          table: DataTables.alarm,
        ),
        data.get(table: DataTables.alarm, id: '123'));
    expect(1, 1);
  });
}
