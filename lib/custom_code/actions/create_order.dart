import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';

Future createOrder(String? note) async {

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
