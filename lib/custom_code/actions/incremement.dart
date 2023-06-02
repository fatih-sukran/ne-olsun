// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future incremement(
  ProductsRecord product,
  int step,
) async {
  print("START method incremement");
  // Add your function code here!
  print('product.reference: ${product.reference}');
  print('FFAppState().products.length: ${FFAppState().products.length}');
  for (int i = 0; i < FFAppState().products.length; i++) {
    print(
        'FFAppState().products[i].productDocumentId?.id: ${FFAppState().products[i].productDocumentId?.id}');
    print('FFAppState().products[i].count: ${FFAppState().products[i].count}');
    if (FFAppState().products[i].productDocumentId?.id ==
        product.reference.id) {
      FFAppState().products[i].count += step;
      return;
    }
  }

  ProductsStruct productsStruct = ProductsStruct(
      count: step,
      productDocumentId: product.reference,
      name: product.name,
      description: product.description,
      price: product.price);
  FFAppState().products.add(productsStruct);
  print("END method incremement");
}
