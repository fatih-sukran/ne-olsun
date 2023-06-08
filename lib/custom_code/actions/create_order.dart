// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future createOrder(String? note) async {
  // Add your function code here!

  final ordersCreateData = createOrdersRecordData(
    guestId: null,
    tableId: FFAppState().cafe.table.tableId,
    note: note ?? '',
    status: 0,
  );

  var ordersRecordReference = OrdersRecord.createDoc(FFAppState().cafe.cafeId!);
  await ordersRecordReference.set(ordersCreateData);

  var order = OrdersRecord.getDocumentFromData(
    ordersCreateData,
    ordersRecordReference,
  );

  for (var orderDetail in FFAppState().orderProducts) {
    final orderProductsCreateData = createOrderProductsRecordData(
      orderId: order.reference,
      productId: orderDetail.product.productId,
      count: orderDetail.count,
      completedCount: orderDetail.completedCount,
    );
    await OrderProductsRecord.createDoc(FFAppState().cafe.cafeId!)
        .set(orderProductsCreateData);
  }
  FFAppState().orderProducts.clear();
}
