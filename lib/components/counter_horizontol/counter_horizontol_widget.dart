import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'counter_horizontol_model.dart';
export 'counter_horizontol_model.dart';

class CounterHorizontolWidget extends StatefulWidget {
  const CounterHorizontolWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final OrderDetailStruct? product;

  @override
  _CounterHorizontolWidgetState createState() =>
      _CounterHorizontolWidgetState();
}

class _CounterHorizontolWidgetState extends State<CounterHorizontolWidget> {
  late CounterHorizontolModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CounterHorizontolModel());

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
      width: 90.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 15.0,
              borderWidth: 1.0,
              buttonSize: 30.0,
              fillColor: FlutterFlowTheme.of(context).tertiary,
              icon: FaIcon(
                FontAwesomeIcons.minus,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 15.0,
              ),
              onPressed: () async {
                await _model.incrementActions(
                  context,
                  product: widget.product,
                  step: 1,
                );
                setState(() {});
              },
            ),
          ),
          Text(
            _model.num.toString(),
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primary,
            borderRadius: 15.0,
            borderWidth: 1.0,
            buttonSize: 30.0,
            fillColor: FlutterFlowTheme.of(context).tertiary,
            icon: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 15.0,
            ),
            onPressed: () async {
              await _model.incrementActions(
                context,
                product: widget.product,
                step: 1,
              );
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
