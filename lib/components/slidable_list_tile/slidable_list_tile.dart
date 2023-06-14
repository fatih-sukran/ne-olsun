import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:ne_olsun/app_state.dart';
import 'package:ne_olsun/flutter_flow/flutter_flow_theme.dart';

class SlidableListTile extends StatefulWidget {
  const SlidableListTile({
    Key? key,
    this.listItem,
    this.slidableActions = const <SlidableAction>[],
  }) : super(key: key);

  final Widget? listItem;
  final List<SlidableAction> slidableActions;

  @override
  State<StatefulWidget> createState() => _SlidableListTile();
}

class _SlidableListTile extends State<SlidableListTile> {
  // late LogoutButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    // _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    // _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.5,
        children: widget.slidableActions,
      ),
      child: widget.listItem ?? listTile(context),
    );
  }

  Widget listTile(BuildContext context) {
    return ListTile(
      title: Text(
        'Title',
        style: FlutterFlowTheme.of(context).titleLarge,
      ),
      subtitle: Text(
        'Subtitle goes here...',
        style: FlutterFlowTheme.of(context).labelMedium,
      ),
      tileColor: FlutterFlowTheme.of(context).secondaryBackground,
      dense: false,
    );
  }
}
