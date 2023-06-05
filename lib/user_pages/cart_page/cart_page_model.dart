import '/components/counter_horizontol/counter_horizontol_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for counter_horizontol component.
  late CounterHorizontolModel counterHorizontolModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    counterHorizontolModel =
        createModel(context, () => CounterHorizontolModel());
  }

  void dispose() {
    counterHorizontolModel.dispose();
  }

  /// Additional helper methods are added here.

}
