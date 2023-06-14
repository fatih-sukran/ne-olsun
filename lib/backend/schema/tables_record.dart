import 'dart:async';

import 'package:ne_olsun/backend/backend.dart';

class TablesRecord extends FirestoreRecord {
  TablesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // List<OrdersRecord> _orders = [];
  // List<OrdersRecord> get orders => _orders;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _status = snapshotData['status'] as int?;
    // _orders =
    //     snapshotData['orders'] as List<OrdersRecord>; //! todo: hata çıkabilir.
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tables')
          : FirebaseFirestore.instance.collectionGroup('tables');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tables').doc();

  static Stream<TablesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TablesRecord.fromSnapshot(s));

  static Future<TablesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TablesRecord.fromSnapshot(s));

  static TablesRecord fromSnapshot(DocumentSnapshot snapshot) => TablesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TablesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TablesRecord._(reference, mapFromFirestore(data));

  static Future<List<TablesRecord>> getAllTables() {
    return FirebaseFirestore.instance
        .collection('cafes')
        .doc('PQ9L320aVDYlOOmKt2Jk') //! parametrik alınacak
        .collection('tables')
        .get()
        .then((value) {
      var tables = <TablesRecord>[];
      for (var document in value.docs) {
        var record = TablesRecord.fromSnapshot(document);
        tables.add(record);
      }
      return tables;
    });
  }

  @override
  String toString() =>
      'TablesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TablesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTablesRecordData({
  String? name,
  int? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}
