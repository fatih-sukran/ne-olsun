import 'package:ne_olsun/backend/backend.dart';

class OrderWrapper {
  OrderWrapper(this._orders) {
    assert(_orders.isNotEmpty);
    
    _name = _orders[0].product.name;
    _description = _orders[0].product.description;
    _imageUrl = _orders[0].product.imageUrl;
    _price = _orders[0].product.price;
    _note = _orders[0].note;
  }

  String? _name;
  String get name => _name ?? '';

  String? _description;
  String get description => _description ?? '';

  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';

  double? _price;
  double get price => _price ?? -1.0;

  int get count => _orders.fold(0, (previous, e) => previous + e.count);
  int get completedCount =>
      _orders.fold(0, (previous, e) => previous + e.completedCount);

  String? _note;
  String get note => _note ?? '';
  set note(value) {
    _note = value;
    _orders.forEach((element) {
      element.update(note: value);
    });
  }

  List<OrdersRecord> _orders;
}
