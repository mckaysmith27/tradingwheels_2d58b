import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'upload_c_s_vs_widget.dart' show UploadCSVsWidget;
import 'package:flutter/material.dart';

class UploadCSVsModel extends FlutterFlowModel<UploadCSVsWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CsvRecord? actionOutput1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
