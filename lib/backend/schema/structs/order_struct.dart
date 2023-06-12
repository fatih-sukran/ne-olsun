// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderStruct extends FFFirebaseStruct {
  OrderStruct({
    DocumentReference? orderId,
    String? note,
    int? status,
    List<OrderDetailStruct>? orderDetails,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderId = orderId,
        _note = note,
        _status = status,
        _orderDetails = orderDetails,
        super(firestoreUtilData);

  // "order_id" field.
  DocumentReference? _orderId;
  DocumentReference? get orderId => _orderId;
  set orderId(DocumentReference? val) => _orderId = val;
  bool hasOrderId() => _orderId != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;
  bool hasNote() => _note != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;
  void incrementStatus(int amount) => _status = status + amount;
  bool hasStatus() => _status != null;

  // "orderDetails" field.
  List<OrderDetailStruct>? _orderDetails;
  List<OrderDetailStruct> get orderDetails => _orderDetails ?? const [];
  set orderDetails(List<OrderDetailStruct>? val) => _orderDetails = val;
  void updateOrderDetails(Function(List<OrderDetailStruct>) updateFn) =>
      updateFn(_orderDetails ??= []);
  bool hasOrderDetails() => _orderDetails != null;

  static OrderStruct fromMap(Map<String, dynamic> data) => OrderStruct(
        orderId: data['order_id'] as DocumentReference?,
        note: data['note'] as String?,
        status: data['status'] as int?,
        orderDetails: getStructList(
          data['orderDetails'],
          OrderDetailStruct.fromMap,
        ),
      );

  static OrderStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OrderStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'order_id': _orderId,
        'note': _note,
        'status': _status,
        'orderDetails': _orderDetails?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'order_id': serializeParam(
          _orderId,
          ParamType.DocumentReference,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'orderDetails': serializeParam(
          _orderDetails,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static OrderStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderStruct(
        orderId: deserializeParam(
          data['order_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['cafes', 'orders'],
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        orderDetails: deserializeParam<OrderDetailStruct>(
          data['orderDetails'],
          ParamType.DataStruct,
          true,
          structBuilder: OrderDetailStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OrderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrderStruct &&
        orderId == other.orderId &&
        note == other.note &&
        status == other.status &&
        listEquality.equals(orderDetails, other.orderDetails);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([orderId, note, status, orderDetails]);
}

OrderStruct createOrderStruct({
  DocumentReference? orderId,
  String? note,
  int? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderStruct(
      orderId: orderId,
      note: note,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderStruct? updateOrderStruct(
  OrderStruct? order, {
  bool clearUnsetFields = true,
}) =>
    order
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addOrderStructData(
  Map<String, dynamic> firestoreData,
  OrderStruct? order,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (order == null) {
    return;
  }
  if (order.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && order.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderData = getOrderFirestoreData(order, forFieldValue);
  final nestedData = orderData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = order.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderFirestoreData(
  OrderStruct? order, [
  bool forFieldValue = false,
]) {
  if (order == null) {
    return {};
  }
  final firestoreData = mapToFirestore(order.toMap());

  // Add any Firestore field values
  order.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderListFirestoreData(
  List<OrderStruct>? orders,
) =>
    orders?.map((e) => getOrderFirestoreData(e, true)).toList() ?? [];
