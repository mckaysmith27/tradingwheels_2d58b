import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/not_using/field/field_widget.dart';
import 'package:flutter/material.dart';
import 'field_plus_switch_model.dart';
export 'field_plus_switch_model.dart';

class FieldPlusSwitchWidget extends StatefulWidget {
  const FieldPlusSwitchWidget({
    super.key,
    this.parameter1,
  });

  final bool? parameter1;

  @override
  State<FieldPlusSwitchWidget> createState() => _FieldPlusSwitchWidgetState();
}

class _FieldPlusSwitchWidgetState extends State<FieldPlusSwitchWidget> {
  late FieldPlusSwitchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FieldPlusSwitchModel());

    _model.manualOverridSwitchValue = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: wrapWithModel(
                model: _model.fieldModel,
                updateCallback: () => safeSetState(() {}),
                child: FieldWidget(),
              ),
            ),
            Switch.adaptive(
              value: _model.manualOverridSwitchValue!,
              onChanged: (widget.parameter1 != true)
                  ? null
                  : (newValue) async {
                      safeSetState(
                          () => _model.manualOverridSwitchValue = newValue);
                    },
              activeColor: FlutterFlowTheme.of(context).primary,
              activeTrackColor: FlutterFlowTheme.of(context).accent1,
              inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
              inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Manual',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    'Override',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
