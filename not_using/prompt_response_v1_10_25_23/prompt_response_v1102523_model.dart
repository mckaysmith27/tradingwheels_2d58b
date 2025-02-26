import '/flutter_flow/flutter_flow_util.dart';
import 'prompt_response_v1102523_widget.dart' show PromptResponseV1102523Widget;
import 'package:flutter/material.dart';

class PromptResponseV1102523Model
    extends FlutterFlowModel<PromptResponseV1102523Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
