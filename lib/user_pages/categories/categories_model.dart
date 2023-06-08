import '/backend/backend.dart';
import '/components/logout_button/logout_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoriesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for logout_button component.
  late LogoutButtonModel logoutButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    logoutButtonModel = createModel(context, () => LogoutButtonModel());
  }

  void dispose() {
    logoutButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
