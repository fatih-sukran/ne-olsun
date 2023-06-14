import 'dart:developer';

import 'package:ne_olsun/backend/schema/structs/order_wrapper.dart';

import '/backend/backend.dart';

Future<List<OrderWrapper>> getAllOrders({
  required DocumentReference tableRef,
}) async {
  var orders =
      await tableRef.collection('orders').where('status', isEqualTo: 0).get();

  var ordersMap = <String, List<OrdersRecord>>{};
  for (var element in orders.docs) {
    if (ordersMap[element.id] == null) {
      ordersMap[element.id] = <OrdersRecord>[];
    }
    var order =
        await OrdersRecord.fromFirebase(element.data(), element.reference);
    ordersMap[element.id]!.add(order);
  }

  var orderWrappers = <OrderWrapper>[];
  ordersMap.values.forEach((element) {
    orderWrappers.add(OrderWrapper(element));
  });

  return orderWrappers;

  // int i = 0;
  // for (var order in orders.docs) {
  //   log('Order For : ${i++}');
  //   var orderDetailsDocs = await cafesRecord
  //       .collection('order_products')
  //       .where('order_id', isEqualTo: order.reference)
  //       .get();

  //   int j = 0;
  //   for (var orderDetailDoc in orderDetailsDocs.docs) {
  //     log('Detail For : ${j++}');
  //     var filters = orderWrappers
  //         .where((element) =>
  //             element.product.productId == orderDetailDoc.get('product_id'))
  //         .toList();
  //     if (filters.isEmpty) {
  //       var productDoc = await FirebaseFirestore.instance
  //           .doc((orderDetailDoc.get('product_id') as DocumentReference).path)
  //           .get();

  //       var product = ProductStruct(
  //         productId: productDoc.reference,
  //         name: productDoc.get('name'),
  //         description: productDoc.get('description'),
  //         price: productDoc.get('price'),
  //         imageUrl: productDoc.get('image_url'),
  //       );

  //       var detail = OrderDetailStruct(
  //         orderDetailId: orderDetailDoc.reference,
  //         product: product,
  //         count: orderDetailDoc.get('count'),
  //         completedCount: orderDetailDoc.get('completed_count'),
  //       );

  //       orderWrappers.add(detail);
  //       continue;
  //     }

  //     filters.first.count += orderDetailDoc.get('count') as int;
  //   }
  // }

  // return orderWrappers;
}
