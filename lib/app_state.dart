import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _products = (await secureStorage.getStringList('ff_products'))
              ?.map((x) {
                try {
                  return ProductsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _products;
    });
    await _safeInitAsync(() async {
      _currency = await secureStorage.getString('ff_currency') ?? _currency;
    });
    await _safeInitAsync(() async {
      _cafe = (await secureStorage.getString('ff_cafe'))?.ref ?? _cafe;
    });
    await _safeInitAsync(() async {
      _orders = (await secureStorage.getStringList('ff_orders'))
              ?.map((x) {
                try {
                  return ProductsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _orders;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<ProductsStruct> _products = [];
  List<ProductsStruct> get products => _products;
  set products(List<ProductsStruct> _value) {
    _products = _value;
    secureStorage.setStringList(
        'ff_products', _value.map((x) => x.serialize()).toList());
  }

  void deleteProducts() {
    secureStorage.delete(key: 'ff_products');
  }

  void addToProducts(ProductsStruct _value) {
    _products.add(_value);
    secureStorage.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void removeFromProducts(ProductsStruct _value) {
    _products.remove(_value);
    secureStorage.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProducts(int _index) {
    _products.removeAt(_index);
    secureStorage.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void updateProductsAtIndex(
    int _index,
    Function(ProductsStruct) updateFn,
  ) {
    updateFn(_products[_index]);
    secureStorage.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  String _currency = '\$';
  String get currency => _currency;
  set currency(String _value) {
    _currency = _value;
    secureStorage.setString('ff_currency', _value);
  }

  void deleteCurrency() {
    secureStorage.delete(key: 'ff_currency');
  }

  DocumentReference? _cafe;
  DocumentReference? get cafe => _cafe;
  set cafe(DocumentReference? _value) {
    _cafe = _value;
    _value != null
        ? secureStorage.setString('ff_cafe', _value.path)
        : secureStorage.remove('ff_cafe');
  }

  void deleteCafe() {
    secureStorage.delete(key: 'ff_cafe');
  }

  List<ProductsStruct> _orders = [];
  List<ProductsStruct> get orders => _orders;
  set orders(List<ProductsStruct> _value) {
    _orders = _value;
    secureStorage.setStringList(
        'ff_orders', _value.map((x) => x.serialize()).toList());
  }

  void deleteOrders() {
    secureStorage.delete(key: 'ff_orders');
  }

  void addToOrders(ProductsStruct _value) {
    _orders.add(_value);
    secureStorage.setStringList(
        'ff_orders', _orders.map((x) => x.serialize()).toList());
  }

  void removeFromOrders(ProductsStruct _value) {
    _orders.remove(_value);
    secureStorage.setStringList(
        'ff_orders', _orders.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromOrders(int _index) {
    _orders.removeAt(_index);
    secureStorage.setStringList(
        'ff_orders', _orders.map((x) => x.serialize()).toList());
  }

  void updateOrdersAtIndex(
    int _index,
    Function(ProductsStruct) updateFn,
  ) {
    updateFn(_orders[_index]);
    secureStorage.setStringList(
        'ff_orders', _orders.map((x) => x.serialize()).toList());
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
