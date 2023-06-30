// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';
import 'package:despertador/src/feactures/domain/usecases/create_alarm_usecase.dart';
import 'package:despertador/src/feactures/domain/usecases/delete_alarm_usecase.dart';
import 'package:despertador/src/feactures/domain/usecases/get_alarm_usecase.dart';
import 'package:despertador/src/feactures/domain/usecases/list_alarm_usecase.dart';
import 'package:despertador/src/feactures/domain/usecases/update_alarm_usecase.dart';
import 'package:flutter/material.dart';

class AlarmController extends ChangeNotifier {
  final CreateAlarmUsecase _createAlarmUsecase;
  final DeleteAlarmUsecase _deleteAlarmUsecase;
  final UpdateAlarmUsecase _updateAlarmUsecase;
  final GetAlarmUsecase _getAlarmUsecase;
  final ListAlarmUsecase _listAlarmUsecase;
  AlarmController(
    this._createAlarmUsecase,
    this._deleteAlarmUsecase,
    this._updateAlarmUsecase,
    this._getAlarmUsecase,
    this._listAlarmUsecase,
  );

  void init() async {
    list();
    notifyListeners();
  }

  List<AlarmEntity> listAlarm = [];

  void list() async {
    try {
      listAlarm = await _listAlarmUsecase.list();
      listAlarm.sort((a, b) => a.createAt.compareTo(b.createAt));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void create() async {
    try {
      await _createAlarmUsecase.create(
        data: AlarmEntity(
          title: '',
          active: true,
          dateTime: DateTime.now().millisecondsSinceEpoch,
          createAt: DateTime.now().millisecondsSinceEpoch,
          updateAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );
      list();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void update({
    required String id,
    required String title,
    required bool active,
    required int dateTime,
    required int createAt,
  }) {
    _updateAlarmUsecase.update(
        data: AlarmEntity(
          title: title,
          active: active,
          dateTime: dateTime,
          createAt: createAt,
          updateAt: DateTime.now().millisecondsSinceEpoch,
        ),
        id: id);
  }

  void delete(String id) async {
    try {
      await _deleteAlarmUsecase.delete(id: id);
      list();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
