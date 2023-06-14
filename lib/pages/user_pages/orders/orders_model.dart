import 'package:ne_olsun/backend/schema/structs/order_wrapper.dart';

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class OrdersModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<OrderWrapper> orderWrappers = [];
  void addToOrders(OrderWrapper item) => orderWrappers.add(item);
  void removeFromOrders(OrderWrapper item) => orderWrappers.remove(item);
  void removeAtIndexFromOrders(int index) => orderWrappers.removeAt(index);
  void updateOrdersAtIndex(int index, Function(OrderWrapper) updateFn) =>
      orderWrappers[index] = updateFn(orderWrappers[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
