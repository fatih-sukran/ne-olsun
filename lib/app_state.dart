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
    _safeInit(() {
      _orderProducts = prefs
              .getStringList('ff_orderProducts')
              ?.map((x) {
                try {
                  return OrderDetailStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _orderProducts;
    });
    _safeInit(() {
      _price = prefs.getDouble('ff_price') ?? _price;
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

  List<OrderDetailStruct> _orderProducts = [];
  List<OrderDetailStruct> get orderProducts => _orderProducts;
  set orderProducts(List<OrderDetailStruct> _value) {
    _orderProducts = _value;
    prefs.setStringList(
        'ff_orderProducts', _value.map((x) => x.serialize()).toList());
  }

  void addToOrderProducts(OrderDetailStruct _value) {
    _orderProducts.add(_value);
    prefs.setStringList(
        'ff_orderProducts', _orderProducts.map((x) => x.serialize()).toList());
  }

  void removeFromOrderProducts(OrderDetailStruct _value) {
    _orderProducts.remove(_value);
    prefs.setStringList(
        'ff_orderProducts', _orderProducts.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromOrderProducts(int _index) {
    _orderProducts.removeAt(_index);
    prefs.setStringList(
        'ff_orderProducts', _orderProducts.map((x) => x.serialize()).toList());
  }

  void updateOrderProductsAtIndex(
    int _index,
    OrderDetailStruct Function(OrderDetailStruct) updateFn,
  ) {
    _orderProducts[_index] = updateFn(_orderProducts[_index]);
    prefs.setStringList(
        'ff_orderProducts', _orderProducts.map((x) => x.serialize()).toList());
  }

  double _price = 0;
  double get price => _price;
  set price(double _value) {
    _price = _value;
    prefs.setDouble('ff_price', _value);
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
