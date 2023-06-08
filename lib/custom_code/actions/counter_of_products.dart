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

Future counterOfProducts(
  ProductsRecord product,
  int step,
) async {
  // Add your function code here!
  print('product: ${product.name}');
  print('step: $step');

  var orderDetailStructs = FFAppState().orderProducts.where(
      (element) => element.product.productId?.id == product.reference.id);

  if (orderDetailStructs.isEmpty) {
    print('orders is empty');
    ProductStruct productStruct = ProductStruct(
      productId: product.reference,
      name: product.name,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
    );

    OrderDetailStruct orderDetail = OrderDetailStruct(
      completedCount: 0,
      count: step,
      product: productStruct,
    );
    FFAppState().orderProducts.add(orderDetail);
    return;
  }

  print('count: ${orderDetailStructs.first.count}');
  orderDetailStructs.first.count += step;
}
