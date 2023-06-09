import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';

Future newCustomAction(
  String cafeName,
  String tableName,
) async {
  var cafeDoc = await FirebaseFirestore.instance
      .collection('cafes')
      .where("name", isEqualTo: cafeName)
      .get();
  print("cafes id: ${cafeDoc.docs[0].id}");
  var tableDoc = await cafeDoc.docs[0].reference
      .collection('tables')
      .where('name', isEqualTo: "Masa 1")
      .get();
  print('tables');
  var ordersDoc = await cafeDoc.docs[0].reference
      .collection('orders')
      .where('table_id', isEqualTo: tableDoc.docs[0].id)
      .get();
  print('orders');
  var orders = <OrderStruct>[];
  for (var orderDoc in ordersDoc.docs) {
    var order = OrderStruct(
      orderId: orderDoc.reference,
      note: orderDoc.get('note'),
      status: orderDoc.get('status'),
      orderDetails: [],
    );
    orders.add(order);
  }

  var table = TableStruct(
    tableId: tableDoc.docs[0].reference,
    name: tableDoc.docs[0].get('name'),
    status: tableDoc.docs[0].get('status'),
    orders: orders,
  );

  var cafe = CafeStruct(
    cafeId: cafeDoc.docs[0].reference,
    cafeName: cafeDoc.docs[0].get('name'),
    table: table,
  );

  FFAppState().cafe = cafe;

  print('cafe.id: ${FFAppState().cafe.cafeId}');
}
