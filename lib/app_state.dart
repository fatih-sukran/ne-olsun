import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _currency = prefs.getString('ff_currency') ?? _currency;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_cafe')) {
        try {
          final serializedData = prefs.getString('ff_cafe') ?? '{}';
          _cafe = CafeStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _currency = '\$';
  String get currency => _currency;
  set currency(String _value) {
    _currency = _value;
    prefs.setString('ff_currency', _value);
  }

  CafeStruct _cafe = CafeStruct();
  CafeStruct get cafe => _cafe;
  set cafe(CafeStruct _value) {
    _cafe = _value;
    prefs.setString('ff_cafe', _value.serialize());
  }

  void updateCafeStruct(Function(CafeStruct) updateFn) {
    updateFn(_cafe);
    prefs.setString('ff_cafe', _cafe.serialize());
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
