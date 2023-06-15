import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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