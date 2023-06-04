import '/backend/backend.dart';
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
import 'counter_model.dart';
export 'counter_model.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key? key,
    required this.productDocumentId,
  }) : super(key: key);

  final ProductsRecord? productDocumentId;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late CounterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CounterModel());

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
      width: 50.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primary,
            borderRadius: 15.0,
            borderWidth: 1.0,
            buttonSize: 35.0,
            fillColor: FlutterFlowTheme.of(context).tertiary,
            icon: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 15.0,
            ),
            onPressed: () async {
              await actions.incremement(
                widget.productDocumentId!,
                1,
              );
              setState(() {
                _model.num = functions.getProductCount(
                    widget.productDocumentId!, FFAppState().products.toList());
              });
              FFAppState().update(() {
                FFAppState().products = FFAppState().products.toList();
              });
            },
          ),
          Text(
            functions
                .getProductCount(
                    widget.productDocumentId!, FFAppState().products.toList())
                .toString(),
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primary,
            borderRadius: 15.0,
            borderWidth: 1.0,
            buttonSize: 35.0,
            fillColor: FlutterFlowTheme.of(context).tertiary,
            icon: FaIcon(
              FontAwesomeIcons.minus,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 15.0,
            ),
            onPressed: () async {
              await actions.incremement(
                widget.productDocumentId!,
                -1,
              );
              setState(() {
                _model.num = functions.getProductCount(
                    widget.productDocumentId!, FFAppState().products.toList());
              });
              FFAppState().update(() {
                FFAppState().products = FFAppState().products.toList();
              });
            },
          ),
        ],
      ),
    );
  }
}
