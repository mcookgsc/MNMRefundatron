import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _fNameV = '';
  String get fNameV => _fNameV;
  set fNameV(String _value) {
    _fNameV = _value;
  }

  String _lNameV = '';
  String get lNameV => _lNameV;
  set lNameV(String _value) {
    _lNameV = _value;
  }

  String _emailV = '';
  String get emailV => _emailV;
  set emailV(String _value) {
    _emailV = _value;
  }

  String _statusV = '';
  String get statusV => _statusV;
  set statusV(String _value) {
    _statusV = _value;
  }

  String _sortIDV = '';
  String get sortIDV => _sortIDV;
  set sortIDV(String _value) {
    _sortIDV = _value;
  }

  String _orderV = '';
  String get orderV => _orderV;
  set orderV(String _value) {
    _orderV = _value;
  }

  String _authTokenV = '';
  String get authTokenV => _authTokenV;
  set authTokenV(String _value) {
    _authTokenV = _value;
  }

  String _accountIDV = '';
  String get accountIDV => _accountIDV;
  set accountIDV(String _value) {
    _accountIDV = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
