import 'dart:async';

import 'package:ne_olsun/backend/backend.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  static String _collectionName = 'orders';

  ProductsRecord? _product;
  ProductsRecord get product => _product!;

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

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _count = snapshotData['count'] as int?;
    _completedCount = snapshotData['completed_count'] as int?;
    _note = snapshotData['note'] as String?;
    _status = snapshotData['status'] as int?;
    _createdDate = snapshotData['created_date'] as DateTime?;
  }

  Future _initializeFieldsAsync() async {
    var productRef = snapshotData['product_id'] as DocumentReference;
    _product = await ProductsRecord.getDocumentOnce(productRef);
  }

  void update({
    ProductsRecord? product,
    int? count,
    int? completedCount,
    String? note,
    int? status,
    DateTime? createdDate,
  }) async {
    _product = product ?? _product;
    _count = count ?? _count;
    _completedCount = completedCount ?? _completedCount;
    _note = note ?? _note;
    _status = status ?? _status;
    _createdDate = createdDate ?? _createdDate;

    var map = <String, dynamic>{
      'count': count,
      'completed_count': completedCount,
      'note': note,
      'status': status,
      'created_date': createdDate
    }.withoutNulls;
    await reference.update(map);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection(_collectionName)
          : FirebaseFirestore.instance.collectionGroup(_collectionName);

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection(_collectionName).doc();

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  static Future<OrdersRecord> fromFirebase(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) async {
    var order = OrdersRecord._(reference, mapFromFirestore(data));
    await order._initializeFieldsAsync();
    return order;
  }

  static Future<OrdersRecord?> createOrder({
    required DocumentReference parent,
    DocumentReference? productId,
    int? count,
    int? completedCount,
    String? note,
    int? status,
    DateTime? createdDate,
  }) async {
    var map = createOrdersRecordData(
      productId: productId,
      count: count,
      completedCount: completedCount,
      note: note,
      status: status,
      createdDate: createdDate,
    );

    var doc = createDoc(parent);
    doc.set(map);

    return await fromFirebase(map, doc);
  }

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DocumentReference? productId,
  int? count,
  int? completedCount,
  String? note,
  int? status,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'count': count,
      'completed_count': completedCount,
      'note': note,
      'status': status,
      'created_date': createdDate
    }.withoutNulls,
  );

  return firestoreData;
}
