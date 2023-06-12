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

Future<int> counterHorizontal(OrderDetailStruct orderDetail, int step) async {
  var details = FFAppState()
      .orderProducts
      .where(
          (e) => e.product.productId?.id == orderDetail.product.productId?.id)
      .toList();

  print('--------------------------------------');
  print('DEBUG - step: $step');
  print('DEBUG - product.name: ${orderDetail.product.name}');
  print('DEBUG - product.count: ${orderDetail.count}');
  print('DEBUG - details.length : ${details.length}');
  print('-----------------');

  var message = '(orderDetail.orderDetailId: ${orderDetail.orderDetailId})';
  if (details.isEmpty) {
    print('DEBUG: CounterHorizontal -> orderDetail not found. $message');
    return 0;
  }

  int count = 0;
  FFAppState().update(() {
    var firstDetail = details.first;
    firstDetail.count += step;
    count = firstDetail.count;
    if (firstDetail.count == 0) {
      print('DEBUG: product remove from orders. $message');
      FFAppState().orderProducts.remove(firstDetail);
    }
  });

  var filteredProduct = FFAppState()
      .orderProducts
      .where(
          (e) => e.product.productId?.id == orderDetail.product.productId?.id)
      .first;

  print('DEBUG - FFAppState.product.name: ${filteredProduct.product.name}');
  print('DEBUG - FFAppState.product.count: ${filteredProduct.count}');

  return count;
}
