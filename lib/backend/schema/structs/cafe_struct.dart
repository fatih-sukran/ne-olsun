// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CafeStruct extends FFFirebaseStruct {
  CafeStruct({
    DocumentReference? cafeId,
    String? cafeName,
    TableStruct? table,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cafeId = cafeId,
        _cafeName = cafeName,
        _table = table,
        super(firestoreUtilData);

  static Future<CafeStruct> fromFirebase() async {
    if (_instance == null) {
      DocumentSnapshot cafeDoc = await FirebaseFirestore.instance
          .collection('cafes')
          .doc('PQ9L320aVDYlOOmKt2Jk') //! parametrik alınacak
          .get();

      _instance = CafeStruct(
        cafeId: cafeDoc.reference,
        cafeName: cafeDoc.get('name'),
      );
    }
    return _instance!;
  }

  static CafeStruct? _instance;

  // "cafe_id" field.
  DocumentReference? _cafeId;
  DocumentReference? get cafeId => _cafeId;
  set cafeId(DocumentReference? val) => _cafeId = val;
  bool hasCafeId() => _cafeId != null;

  // "cafe_name" field.
  String? _cafeName;
  String get cafeName => _cafeName ?? '';
  set cafeName(String? val) => _cafeName = val;
  bool hasCafeName() => _cafeName != null;

  // "table" field.
  TableStruct? _table;
  TableStruct get table => _table ?? TableStruct();
  set table(TableStruct? val) => _table = val;
  void updateTable(Function(TableStruct) updateFn) =>
      updateFn(_table ??= TableStruct());
  bool hasTable() => _table != null;

  static CafeStruct fromMap(Map<String, dynamic> data) => CafeStruct(
        cafeId: data['cafe_id'] as DocumentReference?,
        cafeName: data['cafe_name'] as String?,
        table: TableStruct.maybeFromMap(data['table']),
      );

  static CafeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CafeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'cafe_id': _cafeId,
        'cafe_name': _cafeName,
        'table': _table?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cafe_id': serializeParam(
          _cafeId,
          ParamType.DocumentReference,
        ),
        'cafe_name': serializeParam(
          _cafeName,
          ParamType.String,
        ),
        'table': serializeParam(
          _table,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CafeStruct fromSerializableMap(Map<String, dynamic> data) =>
      CafeStruct(
        cafeId: deserializeParam(
          data['cafe_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['cafes'],
        ),
        cafeName: deserializeParam(
          data['cafe_name'],
          ParamType.String,
          false,
        ),
        table: deserializeParam(
          data['table'],
          ParamType.DataStruct,
          false,
          structBuilder: TableStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CafeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CafeStruct &&
        cafeId == other.cafeId &&
        cafeName == other.cafeName &&
        table == other.table;
  }

  @override
  int get hashCode => const ListEquality().hash([cafeId, cafeName, table]);
}

CafeStruct createCafeStruct({
  DocumentReference? cafeId,
  String? cafeName,
  TableStruct? table,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CafeStruct(
      cafeId: cafeId,
      cafeName: cafeName,
      table: table ?? TableStruct(),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CafeStruct? updateCafeStruct(
  CafeStruct? cafe, {
  bool clearUnsetFields = true,
}) =>
    cafe
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addCafeStructData(
  Map<String, dynamic> firestoreData,
  CafeStruct? cafe,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cafe == null) {
    return;
  }
  if (cafe.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && cafe.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cafeData = getCafeFirestoreData(cafe, forFieldValue);
  final nestedData = cafeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = cafe.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCafeFirestoreData(
  CafeStruct? cafe, [
  bool forFieldValue = false,
]) {
  if (cafe == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cafe.toMap());

  // Handle nested data for "table" field.
  addTableStructData(firestoreData, cafe.table, 'table', forFieldValue);

  // Add any Firestore field values
  cafe.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCafeListFirestoreData(
  List<CafeStruct>? cafes,
) =>
    cafes?.map((e) => getCafeFirestoreData(e, true)).toList() ?? [];
