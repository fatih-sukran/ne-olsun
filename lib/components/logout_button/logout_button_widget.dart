import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'logout_button_model.dart';
export 'logout_button_model.dart';

class LogoutButtonWidget extends StatefulWidget {
  const LogoutButtonWidget({Key? key}) : super(key: key);

  @override
  _LogoutButtonWidgetState createState() => _LogoutButtonWidgetState();
}

class _LogoutButtonWidgetState extends State<LogoutButtonWidget> {
  late LogoutButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoutButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 56.0,
      height: 56.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: FlutterFlowIconButton(
        borderColor: FlutterFlowTheme.of(context).primary,
        borderWidth: 1.0,
        buttonSize: 40.0,
        fillColor: FlutterFlowTheme.of(context).primary,
        icon: FaIcon(
          FontAwesomeIcons.signOutAlt,
          color: FlutterFlowTheme.of(context).secondary,
          size: 24.0,
        ),
        onPressed: () async {
          setState(() {
            FFAppState().updateCafeStruct(
              (e) => e
                ..cafeId = null
                ..table = null
                ..cafeName = null,
            );
          });

          context.goNamed('scan_qr');
        },
      ),
    );
  }
}
