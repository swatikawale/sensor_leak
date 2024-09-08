import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _appslist = prefs.getString('ff_appslist') ?? _appslist;
    });
    _safeInit(() {
      _AppPer = prefs.getString('ff_AppPer') ?? _AppPer;
    });
    _safeInit(() {
      _appDetect = prefs.getString('ff_appDetect') ?? _appDetect;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _appslist = '';
  String get appslist => _appslist;
  set appslist(String value) {
    _appslist = value;
    prefs.setString('ff_appslist', value);
  }

  String _AppPer = '28%';
  String get AppPer => _AppPer;
  set AppPer(String value) {
    _AppPer = value;
    prefs.setString('ff_AppPer', value);
  }

  String _appDetect = '3';
  String get appDetect => _appDetect;
  set appDetect(String value) {
    _appDetect = value;
    prefs.setString('ff_appDetect', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
