import 'package:ne_olsun/backend/backend.dart';
import 'package:ne_olsun/flutter_flow/form_field_controller.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class EditOrderBottomSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  TextEditingController countController = TextEditingController();
  String? Function(BuildContext, String?)? countValidator;

  TextEditingController completedCountController = TextEditingController();
  String? Function(BuildContext, String?)? completedCountValidator;

  TextEditingController noteController = TextEditingController();
  String? Function(BuildContext, String?)? noteValidator;

  TablesRecord? dropDownValue;
  FormFieldController<TablesRecord>? dropDownValueController;
  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    countController.dispose();
    completedCountController.dispose();
    noteController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
