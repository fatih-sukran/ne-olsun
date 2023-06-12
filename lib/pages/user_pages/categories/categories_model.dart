import '/components/logout_button/logout_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CategoriesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for logout_button component.
  late LogoutButtonModel logoutButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    logoutButtonModel = createModel(context, () => LogoutButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    logoutButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
