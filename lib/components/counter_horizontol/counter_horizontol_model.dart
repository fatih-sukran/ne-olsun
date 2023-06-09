import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CounterHorizontolModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  int num = 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  Future incrementActions(
    BuildContext context, {
    required OrderDetailStruct? product,
    required int? step,
  }) async {
    await actions.counterOfProducts2(
      product!,
      step!,
      FFAppState().orderProducts.toList(),
    );
    num = functions.getProductCountForHorizantolCounter(
        product!, FFAppState().orderProducts.toList());
    FFAppState().update(() {
      FFAppState().price =
          functions.getTotalOrderPrice(FFAppState().orderProducts.toList());
    });
  }

  /// Additional helper methods are added here.

}
