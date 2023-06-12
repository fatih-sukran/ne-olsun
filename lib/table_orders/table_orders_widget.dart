import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'table_orders_model.dart';
export 'table_orders_model.dart';

class TableOrdersWidget extends StatefulWidget {
  const TableOrdersWidget({
    Key? key,
    required this.table,
  }) : super(key: key);

  final TablesRecord? table;

  @override
  _TableOrdersWidgetState createState() => _TableOrdersWidgetState();
}

class _TableOrdersWidgetState extends State<TableOrdersWidget>
    with TickerProviderStateMixin {
  late TableOrdersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1600.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(40.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 180.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 180.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 180.ms,
          duration: 600.ms,
          begin: Offset(20.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.8, 0.8),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TableOrdersModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'table_orders',
        color: FlutterFlowTheme.of(context).primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
              title: Text(
                '${widget.table!.name} Orders',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<OrdersRecord>>(
                stream: queryOrdersRecord(
                  parent: FFAppState().cafe.cafeId,
                  queryBuilder: (ordersRecord) => ordersRecord.where('table_id',
                      isEqualTo: widget.table!.reference),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitFadingFour(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<OrdersRecord> listViewOrdersRecordList = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewOrdersRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewOrdersRecord =
                          listViewOrdersRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x1F000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 8.0, 16.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 12.0, 12.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Contract Activity',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                            ).animateOnPageLoad(animationsMap[
                                                'textOnPageLoadAnimation1']!),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                listViewOrdersRecord.note,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation2']!),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0xFFE0E3E7),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 12.0),
                                            child: Icon(
                                              Icons.folder_open_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation2']!),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: LinearPercentIndicator(
                                    percent: 0.5,
                                    width: MediaQuery.of(context).size.width *
                                        0.82,
                                    lineHeight: 16.0,
                                    animation: true,
                                    progressColor:
                                        FlutterFlowTheme.of(context).primary,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    barRadius: Radius.circular(24.0),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ));
  }
}
