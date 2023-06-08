// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderDetailStruct extends FFFirebaseStruct {
  OrderDetailStruct({
    DocumentReference? orderDetailId,
    ProductStruct? product,
    int? count,
    int? completedCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderDetailId = orderDetailId,
        _product = product,
        _count = count,
        _completedCount = completedCount,
        super(firestoreUtilData);

  // "order_detail_id" field.
  DocumentReference? _orderDetailId;
  DocumentReference? get orderDetailId => _orderDetailId;
  set orderDetailId(DocumentReference? val) => _orderDetailId = val;
  bool hasOrderDetailId() => _orderDetailId != null;

  // "product" field.
  ProductStruct? _product;
  ProductStruct get product => _product ?? ProductStruct();
  set product(ProductStruct? val) => _product = val;
  void updateProduct(Function(ProductStruct) updateFn) =>
      updateFn(_product ??= ProductStruct());
  bool hasProduct() => _product != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;
  void incrementCount(int amount) => _count = count + amount;
  bool hasCount() => _count != null;

  // "completed_count" field.
  int? _completedCount;
  int get completedCount => _completedCount ?? 0;
  set completedCount(int? val) => _completedCount = val;
  void incrementCompletedCount(int amount) =>
      _completedCount = completedCount + amount;
  bool hasCompletedCount() => _completedCount != null;

  static OrderDetailStruct fromMap(Map<String, dynamic> data) =>
      OrderDetailStruct(
        orderDetailId: data['order_detail_id'] as DocumentReference?,
        product: ProductStruct.maybeFromMap(data['product']),
        count: data['count'] as int?,
        completedCount: data['completed_count'] as int?,
      );

  static OrderDetailStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OrderDetailStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'order_detail_id': _orderDetailId,
        'product': _product?.toMap(),
        'count': _count,
        'completed_count': _completedCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'order_detail_id': serializeParam(
          _orderDetailId,
          ParamType.DocumentReference,
        ),
        'product': serializeParam(
          _product,
          ParamType.DataStruct,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'completed_count': serializeParam(
          _completedCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static OrderDetailStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderDetailStruct(
        orderDetailId: deserializeParam(
          data['order_detail_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['cafes', 'order_products'],
        ),
        product: deserializeParam(
          data['product'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductStruct.fromSerializableMap,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        completedCount: deserializeParam(
          data['completed_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OrderDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderDetailStruct &&
        orderDetailId == other.orderDetailId &&
        product == other.product &&
        count == other.count &&
        completedCount == other.completedCount;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([orderDetailId, product, count, completedCount]);
}

OrderDetailStruct createOrderDetailStruct({
  DocumentReference? orderDetailId,
  ProductStruct? product,
  int? count,
  int? completedCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderDetailStruct(
      orderDetailId: orderDetailId,
      product: product ?? ProductStruct(),
      count: count,
      completedCount: completedCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderDetailStruct? updateOrderDetailStruct(
  OrderDetailStruct? orderDetail, {
  bool clearUnsetFields = true,
}) =>
    orderDetail
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addOrderDetailStructData(
  Map<String, dynamic> firestoreData,
  OrderDetailStruct? orderDetail,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderDetail == null) {
    return;
  }
  if (orderDetail.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && orderDetail.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderDetailData =
      getOrderDetailFirestoreData(orderDetail, forFieldValue);
  final nestedData =
      orderDetailData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = orderDetail.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderDetailFirestoreData(
  OrderDetailStruct? orderDetail, [
  bool forFieldValue = false,
]) {
  if (orderDetail == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderDetail.toMap());

  // Handle nested data for "product" field.
  addProductStructData(
      firestoreData, orderDetail.product, 'product', forFieldValue);

  // Add any Firestore field values
  orderDetail.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderDetailListFirestoreData(
  List<OrderDetailStruct>? orderDetails,
) =>
    orderDetails?.map((e) => getOrderDetailFirestoreData(e, true)).toList() ??
    [];
