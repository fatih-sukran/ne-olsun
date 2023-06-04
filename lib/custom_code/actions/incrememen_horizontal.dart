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

Future incrememenHorizontal(
  ProductsStruct product,
  int step,
) async {
  // Add your function code here!
  for (int i = 0; i < FFAppState().products.length; i++) {
    if (FFAppState().products[i].productDocumentId?.id ==
        product.productDocumentId?.id) {
      FFAppState().products[i].count += step;
      return;
    }
  }
}
