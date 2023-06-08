import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GuestRecord extends FirestoreRecord {
  GuestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _id = snapshotData['id'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('guest');

  static Stream<GuestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GuestRecord.fromSnapshot(s));

  static Future<GuestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GuestRecord.fromSnapshot(s));

  static GuestRecord fromSnapshot(DocumentSnapshot snapshot) => GuestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GuestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GuestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GuestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GuestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGuestRecordData({
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}
