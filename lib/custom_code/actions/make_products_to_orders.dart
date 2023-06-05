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

import 'dart:developer';

Future makeProductsToOrders() async {
  // Add your function code here!

  if (FFAppState().products.isEmpty) {
    log("products is empty");
    return;
  }

  for (int i = 0; i < FFAppState().products.length; i++) {
    var flag = true;
    for (int j = 0; j < FFAppState().orders.length; j++) {
      if (FFAppState().orders[j].productDocumentId?.id ==
          FFAppState().products[i].productDocumentId?.id) {
        flag = false;
        FFAppState().orders[j].count += FFAppState().products[i].count;
      }
    }

    if (flag) {
      FFAppState().orders.add(FFAppState().products[i]);
    }
  }

  FFAppState().products.clear();
}
