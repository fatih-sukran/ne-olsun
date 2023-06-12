import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'payment_page_model.dart';
export 'payment_page_model.dart';

class PaymentPageWidget extends StatefulWidget {
  const PaymentPageWidget({Key? key}) : super(key: key);

  @override
  _PaymentPageWidgetState createState() => _PaymentPageWidgetState();
}

class _PaymentPageWidgetState extends State<PaymentPageWidget>
    with TickerProviderStateMixin {
  late PaymentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentPageModel());

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
        title: 'payment_page',
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
                'Payment',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(21.0, 21.0, 21.0, 21.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            21.0, 21.0, 21.0, 0.0),
                        child: Lottie.network(
                          'https://assets10.lottiefiles.com/packages/lf20_g3ki3g0v.json',
                          width: 180.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                          repeat: false,
                          animate: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 21.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x34090F13),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 7.0, 7.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowCreditCardForm(
                                  formKey: _model.creditCardFormKey,
                                  creditCardModel: _model.creditCardInfo,
                                  obscureNumber: false,
                                  obscureCvv: false,
                                  spacing: 10.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  inputDecoration: InputDecoration(
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              'Amount: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                          Text(
                                            '${FFAppState().currency}${FFAppState().price.toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'pay',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 21.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onDoubleTap: () async {
                            final ordersCreateData = createOrdersRecordData(
                              guestId: null,
                              tableId: FFAppState().cafe.table.tableId,
                              note: 'Zeytin tuzlu olsun',
                              status: 0,
                            );
                            var ordersRecordReference = OrdersRecord.createDoc(
                                FFAppState().cafe.cafeId!);
                            await ordersRecordReference.set(ordersCreateData);
                            _model.order = OrdersRecord.getDocumentFromData(
                                ordersCreateData, ordersRecordReference);

                            final orderProductsCreateData =
                                createOrderProductsRecordData(
                              orderId: _model.order!.reference,
                              productId: FFAppState()
                                  .orderProducts
                                  .first
                                  .product
                                  .productId,
                              count: FFAppState().orderProducts.first.count,
                              completedCount: FFAppState()
                                  .orderProducts
                                  .first
                                  .completedCount,
                            );
                            await OrderProductsRecord.createDoc(
                                    FFAppState().cafe.cafeId!)
                                .set(orderProductsCreateData);

                            setState(() {});
                          },
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.goNamed('payment_successful');

                              await actions.createOrder(
                                'zeytin tuzlu olsun',
                              );
                            },
                            text: 'Pay after meal with waiter',
                            icon: Icon(
                              Icons.local_cafe_outlined,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
