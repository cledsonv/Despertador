// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';
import 'package:despertador/src/feactures/domain/usecases/create_alarm_usecase.dart';
import 'package:despertador/src/feactures/domain/usecases/delete_alarm_usecase.dart';
import 'package:despertador/src/feactures/domain/usecases/list_alarm_usecase.dart';
import 'package:despertador/src/feactures/domain/usecases/update_alarm_usecase.dart';
import 'package:flutter/material.dart';

class AlarmController extends ChangeNotifier {
  final CreateAlarmUsecase _createAlarmUsecase;
  final DeleteAlarmUsecase _deleteAlarmUsecase;
  final UpdateAlarmUsecase _updateAlarmUsecase;
  //final GetAlarmUsecase _getAlarmUsecase;
  final ListAlarmUsecase _listAlarmUsecase;
  AlarmController(
    this._createAlarmUsecase,
    this._deleteAlarmUsecase,
    this._updateAlarmUsecase,
    //this._getAlarmUsecase,
    this._listAlarmUsecase,
  );

  static void testePrint() {
    print('testinho');
  }

  void init() async {
    list();
    notifyListeners();
  }

  List<AlarmEntity> listAlarm = [];
  List<String> listWeek = [
    'Domingo',
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado',
  ];

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
          idAlarm: Random().nextInt(1000),
          title: '',
          description: '',
          music: 'assets/marimba.mp3',
          active: true,
          dayWeek: [],
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

  void update({required AlarmEntity alarmEntity}) async {
    await _updateAlarmUsecase.update(
      data: alarmEntity.copyWith(
        updateAt: DateTime.now().millisecondsSinceEpoch,
      ),
      id: alarmEntity.id!,
    );
    list();
    notifyListeners();
  }

  void delete(String id) async {
    try {
      print(id);
      await _deleteAlarmUsecase.delete(id: id);
      list();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void setAlarm(
      {required AlarmEntity alarm, required int hour, required int minutes}) {
    var dateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minutes);

    if (dateTime.isBefore(DateTime.now())) {
      print('ASAAAAAAAAAAAAAAAAAAA');
      dateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().add(const Duration(days: 1)).day,
        hour,
        minutes,
      );
    }
    update(
      alarmEntity: alarm.copyWith(dateTime: dateTime.millisecondsSinceEpoch),
    );
    Alarm.set(
      alarmSettings: AlarmSettings(
        id: alarm.idAlarm,
        dateTime: dateTime,
        assetAudioPath: alarm.music,
        loopAudio: true,
        vibrate: true,
        volumeMax: true,
        fadeDuration: 3.0,
        notificationTitle: 'alarme',
        notificationBody: 'Clique para parar',
        enableNotificationOnKill: true,
        stopOnNotificationOpen: true,
      ),
    );
  }
}
