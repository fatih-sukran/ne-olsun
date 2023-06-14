import 'package:flutter/material.dart';
import 'package:ne_olsun/flutter_flow/flutter_flow_theme.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.controller,
    this.validator,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    if (controller != null) {
      controller!.text = initialValue ?? '';
    }
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: TextFormField(
        controller: controller,
        obscureText: false,
        initialValue: controller == null ? initialValue : null,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Plus Jakarta Sans',
                color: Color(0xFF57636C),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFE0E3E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF4B39EF),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFFF5963),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFFF5963),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Plus Jakarta Sans',
              color: Color(0xFF14181B),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
        textAlign: TextAlign.start,
        maxLines: null,
        keyboardType: textInputType,
        validator: validator,
      ),
    );
  }
}
