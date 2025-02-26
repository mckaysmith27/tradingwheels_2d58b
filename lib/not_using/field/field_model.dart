import '/flutter_flow/flutter_flow_util.dart';
import 'field_widget.dart' show FieldWidget;
import 'package:flutter/material.dart';

class FieldModel extends FlutterFlowModel<FieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for settingVal widget.
  FocusNode? settingValFocusNode;
  TextEditingController? settingValTextController;
  String? Function(BuildContext, String?)? settingValTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    settingValFocusNode?.dispose();
    settingValTextController?.dispose();
  }
}
