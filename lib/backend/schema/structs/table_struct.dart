// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TableStruct extends FFFirebaseStruct {
  TableStruct({
    DocumentReference? tableId,
    String? name,
    int? status,
    List<OrderStruct>? orders,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tableId = tableId,
        _name = name,
        _status = status,
        _orders = orders,
        super(firestoreUtilData);

  // "table_id" field.
  DocumentReference? _tableId;
  DocumentReference? get tableId => _tableId;
  set tableId(DocumentReference? val) => _tableId = val;
  bool hasTableId() => _tableId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;
  void incrementStatus(int amount) => _status = status + amount;
  bool hasStatus() => _status != null;

  // "orders" field.
  List<OrderStruct>? _orders;
  List<OrderStruct> get orders => _orders ?? const [];
  set orders(List<OrderStruct>? val) => _orders = val;
  void updateOrders(Function(List<OrderStruct>) updateFn) =>
      updateFn(_orders ??= []);
  bool hasOrders() => _orders != null;

  static TableStruct fromMap(Map<String, dynamic> data) => TableStruct(
        tableId: data['table_id'] as DocumentReference?,
        name: data['name'] as String?,
        status: data['status'] as int?,
        orders: getStructList(
          data['orders'],
          OrderStruct.fromMap,
        ),
      );

  static TableStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TableStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'table_id': _tableId,
        'name': _name,
        'status': _status,
        'orders': _orders?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'table_id': serializeParam(
          _tableId,
          ParamType.DocumentReference,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'orders': serializeParam(
          _orders,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static TableStruct fromSerializableMap(Map<String, dynamic> data) =>
      TableStruct(
        tableId: deserializeParam(
          data['table_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['cafes', 'tables'],
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        orders: deserializeParam<OrderStruct>(
          data['orders'],
          ParamType.DataStruct,
          true,
          structBuilder: OrderStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TableStruct &&
        tableId == other.tableId &&
        name == other.name &&
        status == other.status &&
        listEquality.equals(orders, other.orders);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([tableId, name, status, orders]);
}

TableStruct createTableStruct({
  DocumentReference? tableId,
  String? name,
  int? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TableStruct(
      tableId: tableId,
      name: name,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TableStruct? updateTableStruct(
  TableStruct? table, {
  bool clearUnsetFields = true,
}) =>
    table
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addTableStructData(
  Map<String, dynamic> firestoreData,
  TableStruct? table,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (table == null) {
    return;
  }
  if (table.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && table.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tableData = getTableFirestoreData(table, forFieldValue);
  final nestedData = tableData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = table.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTableFirestoreData(
  TableStruct? table, [
  bool forFieldValue = false,
]) {
  if (table == null) {
    return {};
  }
  final firestoreData = mapToFirestore(table.toMap());

  // Add any Firestore field values
  table.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTableListFirestoreData(
  List<TableStruct>? tables,
) =>
    tables?.map((e) => getTableFirestoreData(e, true)).toList() ?? [];
