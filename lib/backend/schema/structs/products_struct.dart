// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsStruct extends FFFirebaseStruct {
  ProductsStruct({
    int? count,
    DocumentReference? productDocumentId,
    String? name,
    String? description,
    double? price,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _count = count,
        _productDocumentId = productDocumentId,
        _name = name,
        _description = description,
        _price = price,
        super(firestoreUtilData);

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;
  void incrementCount(int amount) => _count = count + amount;
  bool hasCount() => _count != null;

  // "productDocumentId" field.
  DocumentReference? _productDocumentId;
  DocumentReference? get productDocumentId => _productDocumentId;
  set productDocumentId(DocumentReference? val) => _productDocumentId = val;
  bool hasProductDocumentId() => _productDocumentId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  static ProductsStruct fromMap(Map<String, dynamic> data) => ProductsStruct(
        count: data['count'] as int?,
        productDocumentId: data['productDocumentId'] as DocumentReference?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        price: castToType<double>(data['price']),
      );

  static ProductsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProductsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'count': _count,
        'productDocumentId': _productDocumentId,
        'name': _name,
        'description': _description,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'productDocumentId': serializeParam(
          _productDocumentId,
          ParamType.DocumentReference,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static ProductsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductsStruct(
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        productDocumentId: deserializeParam(
          data['productDocumentId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ProductsStruct(${toMap()})';
}

ProductsStruct createProductsStruct({
  int? count,
  DocumentReference? productDocumentId,
  String? name,
  String? description,
  double? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductsStruct(
      count: count,
      productDocumentId: productDocumentId,
      name: name,
      description: description,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductsStruct? updateProductsStruct(
  ProductsStruct? products, {
  bool clearUnsetFields = true,
}) =>
    products
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addProductsStructData(
  Map<String, dynamic> firestoreData,
  ProductsStruct? products,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (products == null) {
    return;
  }
  if (products.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && products.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productsData = getProductsFirestoreData(products, forFieldValue);
  final nestedData = productsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = products.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductsFirestoreData(
  ProductsStruct? products, [
  bool forFieldValue = false,
]) {
  if (products == null) {
    return {};
  }
  final firestoreData = mapToFirestore(products.toMap());

  // Add any Firestore field values
  products.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductsListFirestoreData(
  List<ProductsStruct>? productss,
) =>
    productss?.map((e) => getProductsFirestoreData(e, true)).toList() ?? [];
