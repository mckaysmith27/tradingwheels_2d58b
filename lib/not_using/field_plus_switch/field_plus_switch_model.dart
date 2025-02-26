import '/flutter_flow/flutter_flow_util.dart';
import '/not_using/field/field_widget.dart';
import 'field_plus_switch_widget.dart' show FieldPlusSwitchWidget;
import 'package:flutter/material.dart';

class FieldPlusSwitchModel extends FlutterFlowModel<FieldPlusSwitchWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Field component.
  late FieldModel fieldModel;
  // State field(s) for ManualOverridSwitch widget.
  bool? manualOverridSwitchValue;

  @override
  void initState(BuildContext context) {
    fieldModel = createModel(context, () => FieldModel());
  }

  @override
  void dispose() {
    fieldModel.dispose();
  }
}
