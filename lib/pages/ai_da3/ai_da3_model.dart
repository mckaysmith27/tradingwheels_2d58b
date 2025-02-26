import '/flutter_flow/flutter_flow_util.dart';
import '/is_using/a_i_dialog/a_i_dialog_widget.dart';
import 'ai_da3_widget.dart' show AiDa3Widget;
import 'package:flutter/material.dart';

class AiDa3Model extends FlutterFlowModel<AiDa3Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for AI_Dialog component.
  late AIDialogModel aIDialogModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    aIDialogModel = createModel(context, () => AIDialogModel());
  }

  @override
  void dispose() {
    aIDialogModel.dispose();
  }
}
