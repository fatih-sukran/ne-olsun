import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderProductsRecord extends FirestoreRecord {
  OrderProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "order_id" field.
  DocumentReference? _orderId;
  DocumentReference? get orderId => _orderId;
  bool hasOrderId() => _orderId != null;

  // "product_id" field.
  DocumentReference? _productId;
  DocumentReference? get productId => _productId;
  bool hasProductId() => _productId != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  // "completed_count" field.
  int? _completedCount;
  int get completedCount => _completedCount ?? 0;
  bool hasCompletedCount() => _completedCount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _orderId = snapshotData['order_id'] as DocumentReference?;
    _productId = snapshotData['product_id'] as DocumentReference?;
    _count = snapshotData['count'] as int?;
    _completedCount = snapshotData['completed_count'] as int?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('order_products')
          : FirebaseFirestore.instance.collectionGroup('order_products');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('order_products').doc();

  static Stream<OrderProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderProductsRecord.fromSnapshot(s));

  static Future<OrderProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderProductsRecord.fromSnapshot(s));

  static OrderProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderProductsRecordData({
  DocumentReference? orderId,
  DocumentReference? productId,
  int? count,
  int? completedCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order_id': orderId,
      'product_id': productId,
      'count': count,
      'completed_count': completedCount,
    }.withoutNulls,
  );

  return firestoreData;
}
