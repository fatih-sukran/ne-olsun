import '/backend/backend.dart';

Future<List<OrderDetailStruct>> getAllOrders(
    DocumentReference cafesRecord) async {
  var orders = await cafesRecord.collection('orders').get();
  var orderDetails = <OrderDetailStruct>[];

  for (var order in orders.docs) {
    var orderDetailsDocs = await cafesRecord
        .collection('order_products')
        .where('order_id', isEqualTo: order.reference)
        .get();

    for (var orderDetailDoc in orderDetailsDocs.docs) {
      var filters = orderDetails
          .where((element) =>
              element.product.productId == orderDetailDoc.get('product_id'))
          .toList();
      if (filters.isEmpty) {
        var productDoc = await FirebaseFirestore.instance
            .doc((orderDetailDoc.get('product_id') as DocumentReference).path)
            .get();

        var product = ProductStruct(
          productId: productDoc.reference,
          name: productDoc.get('name'),
          description: productDoc.get('description'),
          price: productDoc.get('price'),
          imageUrl: productDoc.get('image_url'),
        );

        var detail = OrderDetailStruct(
          orderDetailId: orderDetailDoc.reference,
          product: product,
          count: orderDetailDoc.get('count'),
          completedCount: orderDetailDoc.get('completed_count'),
        );

        orderDetails.add(detail);
        continue;
      }

      filters.first.count += orderDetailDoc.get('count') as int;
    }
  }

  return orderDetails;
}
