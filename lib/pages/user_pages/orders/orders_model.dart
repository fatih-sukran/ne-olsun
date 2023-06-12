import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class OrdersModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<OrderDetailStruct> orders = [];
  void addToOrders(OrderDetailStruct item) => orders.add(item);
  void removeFromOrders(OrderDetailStruct item) => orders.remove(item);
  void removeAtIndexFromOrders(int index) => orders.removeAt(index);
  void updateOrdersAtIndex(int index, Function(OrderDetailStruct) updateFn) =>
      orders[index] = updateFn(orders[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getAllOrders] action in orders widget.
  List<OrderDetailStruct>? allOrderDetails;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
