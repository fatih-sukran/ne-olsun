import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future updateTotalOrderPrice(BuildContext context) async {
  FFAppState().update(() {
    FFAppState().price =
        functions.getTotalOrderPrice(FFAppState().orderProducts.toList());
  });
}
