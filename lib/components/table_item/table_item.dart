import 'package:ne_olsun/constants.dart';
import 'package:ne_olsun/flutter_flow/flutter_flow_animations.dart';

import 'package:flutter/material.dart';
import 'package:ne_olsun/flutter_flow/flutter_flow_theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TableItem extends StatelessWidget {
  const TableItem({
    Key? key,
    required this.title,
    this.onTap,
    this.description,
    this.iconButton,
    this.progresBarPercent,
  }) : super(key: key);

  final double? progresBarPercent;
  final String title;
  final String? description;
  final Widget? iconButton;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x1F000000),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 16.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            4.0, 12.0, 12.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$title',
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation9']!),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                'Below is an a summary of activity.',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation10']!),
                            ),
                          ],
                        ),
                      ),
                      icon(context),
                    ],
                  ),
                ),
                if (progresBarPercent != null) progresBar(context),
              ],
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation6']!),
      ),
    );
  }

  Padding progresBar(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: LinearPercentIndicator(
        percent: progresBarPercent!,
        // width: MediaQuery.of(context).size.width * 0.81,
        lineHeight: 16.0,
        animation: true,
        progressColor: FlutterFlowTheme.of(context).primary,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        barRadius: Radius.circular(24.0),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget icon(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        shape: BoxShape.circle,
      ),
      alignment: AlignmentDirectional(0, 0),
      child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Color(0xFFE0E3E7),
            shape: BoxShape.circle,
          ),
          alignment: AlignmentDirectional(0, 0),
          child: iconButton ??
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Icon(
                  Icons.desktop_windows_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24,
                ),
              )),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation7']!);
  }
}
