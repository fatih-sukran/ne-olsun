import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ne_olsun/backend/schema/structs/order_wrapper.dart';
import 'package:ne_olsun/components/edit_order/edit_order_widget.dart';
import 'package:provider/provider.dart';

import 'package:ne_olsun/components/slidable_list_tile/slidable_list_tile.dart';
import 'package:ne_olsun/components/table_item/table_item.dart';
import 'package:ne_olsun/constants.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '/backend/backend.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'table_orders_model.dart';

export 'table_orders_model.dart';

class TableOrdersWidget extends StatefulWidget {
  const TableOrdersWidget({
    Key? key,
    required this.table,
  }) : super(key: key);

  final TablesRecord table;

  @override
  _TableOrdersWidgetState createState() => _TableOrdersWidgetState();
}

class _TableOrdersWidgetState extends State<TableOrdersWidget>
    with TickerProviderStateMixin {
  late TableOrdersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TableOrdersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.orderWrappers = await actions.getAllOrders(
        tableRef: widget.table.reference,
      );
      setState(() {});
    });
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
          appBar: appBar(context),
          floatingActionButton: fab(context),
          body: SafeArea(
              top: true,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: _model.orderWrappers.length,
                itemBuilder: (context, i) {
                  return orderItem(i, context);
                },
              )),
        ),
      ),
    );
  }

  SlidableListTile orderItem(int i, BuildContext context) {
    var order = _model.orderWrappers[i];

    return SlidableListTile(
        listItem: TableItem(
          title: order.name,
          //! onTap: () => print("hello"),
          progresBarPercent: order.completedCount / order.count,
          iconButton: Text(
            'x${_model.orderWrappers[i].count}',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Poppins',
                  lineHeight: 1,
                ),
          ),
        ),
        slidableActions: [
          SlidableAction(
            label: 'edit',
            backgroundColor: Color(0xFF4681FF),
            icon: Icons.edit,
            onPressed: (_) async {
              await slidingBottomSheet(_,
                  child: EditOrderBottomSheetWidget(
                    orderWrapper: order,
                  ));
            },
          ),
          SlidableAction(
            label: 'delete',
            backgroundColor: FlutterFlowTheme.of(context).alternate,
            icon: Icons.delete,
            onPressed: (_) {
              print('SlidableActionWidget pressed ...');
            },
          ),
        ]);
  }

  Future<dynamic> slidingBottomSheet(BuildContext _, {required Widget child}) {
    return showSlidingBottomSheet(
      _,
      builder: (context) {
        return SlidingSheetDialog(
          elevation: 8,
          cornerRadius: 16,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [1.0, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          builder: (_, state) {
            return child;
          },
        );
      },
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: FlutterFlowTheme.of(context).primary,
      automaticallyImplyLeading: true,
      title: Text(
        '${widget.table.name} Orders',
        style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 22,
            ),
      ),
      actions: [],
      centerTitle: false,
      elevation: 2,
    );
  }

  Widget fab(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        slidingBottomSheet(context,
            child: EditOrderBottomSheetWidget(
              tablesRecord: widget.table,
            ));
      },
      backgroundColor: FlutterFlowTheme.of(context).primary,
      icon: Icon(
        Icons.add_box,
      ),
      elevation: 8,
      label: Text(
        'Add Order',
        style: FlutterFlowTheme.of(context).bodyLarge.override(
              fontFamily: 'Poppins',
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
      ),
    );
  }
}
