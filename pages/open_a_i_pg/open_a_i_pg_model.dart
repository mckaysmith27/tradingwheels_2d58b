import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'open_a_i_pg_widget.dart' show OpenAIPgWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class OpenAIPgModel extends FlutterFlowModel<OpenAIPgWidget> {
  ///  Local state fields for this page.

  List<MessagesRecord> messages = [];
  void addToMessages(MessagesRecord item) => messages.add(item);
  void removeFromMessages(MessagesRecord item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, MessagesRecord item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(MessagesRecord) updateFn) =>
      messages[index] = updateFn(messages[index]);

  DocumentReference? chatRef;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for PromptField widget.
  FocusNode? promptFieldFocusNode;
  TextEditingController? promptFieldTextController;
  String? Function(BuildContext, String?)? promptFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in PromptField widget.
  MessagesRecord? ongoingChatNewMessage;
  // Stores action output result for [Firestore Query - Query a collection] action in PromptField widget.
  List<MessagesRecord>? ongoingChatUserMessage;
  // Stores action output result for [Backend Call - API (createChatCompletion)] action in PromptField widget.
  ApiCallResponse? ongoingChatResponse;
  // Stores action output result for [Backend Call - Create Document] action in PromptField widget.
  MessagesRecord? ongoingChatAssistantDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in PromptField widget.
  List<MessagesRecord>? ongoingChatAllMessages;
  // Stores action output result for [Backend Call - Create Document] action in PromptField widget.
  ChatsRecord? newChatDoc;
  // Stores action output result for [Backend Call - Create Document] action in PromptField widget.
  MessagesRecord? newChatNewMessage;
  // Stores action output result for [Backend Call - API (createChatCompletion)] action in PromptField widget.
  ApiCallResponse? newChatResponse;
  // Stores action output result for [Backend Call - Create Document] action in PromptField widget.
  MessagesRecord? newChatAssistantDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in PromptField widget.
  List<MessagesRecord>? newChatAllMessages;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // Stores action output result for [Backend Call - API (CSVMerging)] action in merge widget.
  ApiCallResponse? cSVMergingComplet;
  // State field(s) for Checkbox widget.
  Map<CsvRecord, bool> checkboxValueMap = {};
  List<CsvRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    promptFieldFocusNode?.dispose();
    promptFieldTextController?.dispose();

    expandableExpandableController1.dispose();
    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
