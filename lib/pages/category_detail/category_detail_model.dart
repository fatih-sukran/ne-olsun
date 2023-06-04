import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/counter_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryDetailModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<ProductsStruct> products = [];
  void addToProducts(ProductsStruct item) => products.add(item);
  void removeFromProducts(ProductsStruct item) => products.remove(item);
  void removeAtIndexFromProducts(int index) => products.removeAt(index);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
