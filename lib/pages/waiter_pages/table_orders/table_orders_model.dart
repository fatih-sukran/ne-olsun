import 'package:ne_olsun/backend/schema/structs/order_detail_struct.dart';
import 'package:ne_olsun/backend/schema/structs/order_wrapper.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class TableOrdersModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<OrderWrapper> orderWrappers = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
