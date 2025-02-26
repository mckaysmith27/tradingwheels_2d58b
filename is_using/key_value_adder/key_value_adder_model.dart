import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'key_value_adder_widget.dart' show KeyValueAdderWidget;
import 'package:flutter/material.dart';

class KeyValueAdderModel extends FlutterFlowModel<KeyValueAdderWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Switch_isList widget.
  bool? switchIsListValue;
  // State field(s) for DropDown_DataType widget.
  String? dropDownDataTypeValue;
  FormFieldController<String>? dropDownDataTypeValueController;
  // State field(s) for DropDown_dbDict widget.
  String? dropDownDbDictValue;
  FormFieldController<String>? dropDownDbDictValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField_Str widget.
  FocusNode? textFieldStrFocusNode;
  TextEditingController? textFieldStrTextController;
  String? Function(BuildContext, String?)? textFieldStrTextControllerValidator;
  // State field(s) for TextField_Int widget.
  FocusNode? textFieldIntFocusNode;
  TextEditingController? textFieldIntTextController;
  String? Function(BuildContext, String?)? textFieldIntTextControllerValidator;
  // State field(s) for TextField_Float widget.
  FocusNode? textFieldFloatFocusNode;
  TextEditingController? textFieldFloatTextController;
  String? Function(BuildContext, String?)?
      textFieldFloatTextControllerValidator;
  // State field(s) for TextField_LS_Str widget.
  FocusNode? textFieldLSStrFocusNode;
  TextEditingController? textFieldLSStrTextController;
  String? Function(BuildContext, String?)?
      textFieldLSStrTextControllerValidator;
  // State field(s) for TextField_LS_Int widget.
  FocusNode? textFieldLSIntFocusNode;
  TextEditingController? textFieldLSIntTextController;
  String? Function(BuildContext, String?)?
      textFieldLSIntTextControllerValidator;
  // State field(s) for TextField_LS_Float widget.
  FocusNode? textFieldLSFloatFocusNode;
  TextEditingController? textFieldLSFloatTextController;
  String? Function(BuildContext, String?)?
      textFieldLSFloatTextControllerValidator;
  // Stores action output result for [Backend Call - API (smallScaleActionsRtdbDataDictValsStr)] action in Button_Add_Var_Str widget.
  ApiCallResponse? apiResultzub;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    textFieldStrFocusNode?.dispose();
    textFieldStrTextController?.dispose();

    textFieldIntFocusNode?.dispose();
    textFieldIntTextController?.dispose();

    textFieldFloatFocusNode?.dispose();
    textFieldFloatTextController?.dispose();

    textFieldLSStrFocusNode?.dispose();
    textFieldLSStrTextController?.dispose();

    textFieldLSIntFocusNode?.dispose();
    textFieldLSIntTextController?.dispose();

    textFieldLSFloatFocusNode?.dispose();
    textFieldLSFloatTextController?.dispose();
  }
}
