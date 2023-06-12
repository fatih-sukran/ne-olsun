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
        var detail = OrderDetailStruct(
          orderDetailId: orderDetailDoc.reference,
          product: orderDetailDoc.get('product_id'),
          count: orderDetailDoc.get('count'),
          completedCount: orderDetailDoc.get('completed_count'),
        );

        orderDetails.add(detail);
        continue;
      }

      filters.first.count += int.parse(orderDetailDoc.get('count'));
    }
  }

  return orderDetails;
}
