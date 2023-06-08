import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CounterModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  int num = 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  Future incrementButtonActions(
    BuildContext context, {
    required int? step,
  }) async {
    await actions.counterOfProducts(
      widget.product!,
      step!,
    );
    num = functions.getProductCount(
        FFAppState().orderProducts.toList(), widget.product!);
    await action_blocks.updateTotalOrderPrice(context);
  }

  /// Additional helper methods are added here.

}
