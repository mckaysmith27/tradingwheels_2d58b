import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_dialog_widget.dart' show AIDialogWidget;
import 'package:flutter/material.dart';

class AIDialogModel extends FlutterFlowModel<AIDialogWidget> {
  ///  Local state fields for this component.

  List<dynamic> messages = [];
  void addToMessages(dynamic item) => messages.add(item);
  void removeFromMessages(dynamic item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, dynamic item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(dynamic) updateFn) =>
      messages[index] = updateFn(messages[index]);

  String? userInput;

  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Checkbox widget.
  Map<GptResponseStruct, bool> checkboxValueMap = {};
  List<GptResponseStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for InputField widget.
  FocusNode? inputFieldFocusNode;
  TextEditingController? inputFieldTextController;
  String? Function(BuildContext, String?)? inputFieldTextControllerValidator;
  // State field(s) for aiQuestionField widget.
  FocusNode? aiQuestionFieldFocusNode;
  TextEditingController? aiQuestionFieldTextController;
  String? Function(BuildContext, String?)?
      aiQuestionFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    inputFieldFocusNode?.dispose();
    inputFieldTextController?.dispose();

    aiQuestionFieldFocusNode?.dispose();
    aiQuestionFieldTextController?.dispose();
  }
}
