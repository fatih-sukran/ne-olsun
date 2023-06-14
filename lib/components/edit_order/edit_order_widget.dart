import 'package:ne_olsun/backend/backend.dart';
import 'package:ne_olsun/backend/schema/structs/order_wrapper.dart';
import 'package:ne_olsun/components/custom_input_field.dart';
import 'package:ne_olsun/components/loader_box.dart';
import 'package:ne_olsun/flutter_flow/form_field_controller.dart';

import '/flutter_flow/flutter_flow_dropdown.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_order_bottom_sheet_model.dart';
export 'edit_order_bottom_sheet_model.dart';

class EditOrderBottomSheetWidget extends StatefulWidget {
  const EditOrderBottomSheetWidget({
    Key? key,
    this.tablesRecord,
    this.orderWrapper,
  }) : super(key: key);

  final TablesRecord? tablesRecord;
  final OrderWrapper? orderWrapper;

  @override
  _EditOrderBottomSheetWidgetState createState() =>
      _EditOrderBottomSheetWidgetState();
}

class _EditOrderBottomSheetWidgetState
    extends State<EditOrderBottomSheetWidget> {
  late EditOrderBottomSheetModel _model;
  late final String _text;
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _text = widget.orderWrapper == null ? 'Create' : 'update';
    _model = createModel(context, () => EditOrderBottomSheetModel());
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

    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        alignment: AlignmentDirectional(0, -1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sheetLine(),
            title(context),
            if (widget.tablesRecord == null) tableDropdown(context),
            countInput(context),
            completedCountInput(context),
            noteInput(context),
            updateOrderButton(context),
          ],
        ),
      ),
    );
  }

  Widget sheetLine() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: Container(
            width: 50,
            height: 4,
            decoration: BoxDecoration(
              color: Color(0xFFE0E3E7),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget updateOrderButton(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(21, 21, 21, 21),
          child: FFButtonWidget(
            onPressed: () {
              print('count: ${_model.countController.text}');
              setState(() {
                if (widget.orderWrapper == null) {
                  var order = OrdersRecord.createOrder(
                    parent: widget.tablesRecord!.reference,
                    count: int.parse(_model.countController.value.text),
                    completedCount:
                        int.parse(_model.completedCountController.value.text),
                    note: _model.noteController.value.text,
                    status: 0,
                    createdDate: DateTime.now(),
                  );
                  print(order);
                }
                // widget.order.count =
                //     int.parse(_model.countController.value.text);
                // widget.order.completedCount =
                //     int.parse(_model.completedCountController.value.text); //! todo: setlemeleri tamamla
                // widget.orderWrapper.note = _model.noteController.value.text;
              });
              Navigator.pop(context);
            },
            text: '$_text Order',
            options: FFButtonOptions(
              width: 270,
              height: 50,
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              color: Color(0xFF4B39EF),
              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
              elevation: 3,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget noteInput(BuildContext context) {
    return CustomInputField(
      initialValue: widget.orderWrapper?.note,
      labelText: 'Note',
      hintText: 'Enter order note',
      controller: _model.noteController,
    );
  }

  Widget completedCountInput(BuildContext context) {
    return CustomInputField(
      initialValue: widget.orderWrapper?.completedCount as String?,
      labelText: 'Completed Count',
      hintText: 'Enter order completed count',
      textInputType: TextInputType.number,
      controller: _model.completedCountController,
    );
  }

  Widget countInput(BuildContext context) {
    return CustomInputField(
      initialValue: widget.orderWrapper?.count as String?,
      labelText: 'Count',
      hintText: 'Enter order count',
      textInputType: TextInputType.number,
      controller: _model.countController,
    );
  }

  Widget title(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
      child: Text(
        '$_text Order',
        style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: Color(0xFF14181B),
              fontSize: 24,
              fontWeight: FontWeight.normal,
            ),
      ),
    );
  }

  Widget tableDropdown(BuildContext _) {
    return FutureBuilder<List<TablesRecord>>(
        future: TablesRecord.getAllTables(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (!snapshot.hasData) {
            return LoaderBox();
          } else {
            var tables = snapshot.data!;
            return FlutterFlowDropDown<TablesRecord>(
              controller: _model.dropDownValueController ??=
                  FormFieldController<TablesRecord>(
                _model.dropDownValue ??= tables[0],
              ),
              options: tables,
              optionLabels: tables.map((e) => e.name).toList(),
              onChanged: (val) => setState(() => _model.dropDownValue = val),
              width: 300,
              height: 50,
              textStyle: FlutterFlowTheme.of(context).bodyMedium,
              hintText: 'Please select...',
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2,
              borderColor: FlutterFlowTheme.of(context).alternate,
              borderWidth: 2,
              borderRadius: 8,
              margin: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
              hidesUnderline: true,
              isSearchable: false,
            );
          }
        });
  }
}
