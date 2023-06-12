import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

class CounterModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  int num = 0;

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks 

  Future incrementButtonActions(
    BuildContext context, {
    required int? step,
    required ProductsRecord? order,
  }) async {
    await actions.counterOfProducts(
      order!,
      step!,
    );
    num =
        functions.getProductCount(FFAppState().orderProducts.toList(), order);
    await action_blocks.updateTotalOrderPrice(context);
  }

  /// Additional helper methods are added here.

}
