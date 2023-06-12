import 'dart:async';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CafesRecord extends FirestoreRecord {
  CafesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cafes');

  static Stream<CafesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CafesRecord.fromSnapshot(s));

  static Future<CafesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CafesRecord.fromSnapshot(s));

  static CafesRecord fromSnapshot(DocumentSnapshot snapshot) => CafesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CafesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CafesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CafesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CafesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCafesRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}
