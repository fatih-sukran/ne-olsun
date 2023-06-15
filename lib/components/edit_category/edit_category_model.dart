import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditCategoryModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for shortBio widget.
  TextEditingController? shortBioController1;
  String? Function(BuildContext, String?)? shortBioController1Validator;
  // State field(s) for shortBio widget.
  TextEditingController? shortBioController2;
  String? Function(BuildContext, String?)? shortBioController2Validator;
  // State field(s) for shortBio widget.
  TextEditingController? shortBioController3;
  String? Function(BuildContext, String?)? shortBioController3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    shortBioController1?.dispose();
    shortBioController2?.dispose();
    shortBioController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
