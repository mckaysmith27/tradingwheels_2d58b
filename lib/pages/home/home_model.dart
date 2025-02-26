import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/is_using/a_i_dialog/a_i_dialog_widget.dart';
import '/is_using/key_value_adder/key_value_adder_widget.dart';
import '/not_using/light_dark_switch_v2/light_dark_switch_v2_widget.dart';
import '/not_using/trading_view_comp_dark/trading_view_comp_dark_widget.dart';
import '/not_using/trading_view_comp_light/trading_view_comp_light_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  dynamic twAllData;

  dynamic twPhasesData;

  dynamic twP2r;

  dynamic twMCs;

  int index = 0;

  String? batchid;

  dynamic ordersNowJson;

  dynamic ohlcNowJson;

  String twIntent = 'place_order';

  String twPhase = 'trade';

  String? twUserInputStr;

  List<dynamic> pgstTagsJsonList = [];
  void addToPgstTagsJsonList(dynamic item) => pgstTagsJsonList.add(item);
  void removeFromPgstTagsJsonList(dynamic item) =>
      pgstTagsJsonList.remove(item);
  void removeAtIndexFromPgstTagsJsonList(int index) =>
      pgstTagsJsonList.removeAt(index);
  void insertAtIndexInPgstTagsJsonList(int index, dynamic item) =>
      pgstTagsJsonList.insert(index, item);
  void updatePgstTagsJsonListAtIndex(int index, Function(dynamic) updateFn) =>
      pgstTagsJsonList[index] = updateFn(pgstTagsJsonList[index]);

  List<String> twTradTermiRespTitle = ['Starting Trading...'];
  void addToTwTradTermiRespTitle(String item) => twTradTermiRespTitle.add(item);
  void removeFromTwTradTermiRespTitle(String item) =>
      twTradTermiRespTitle.remove(item);
  void removeAtIndexFromTwTradTermiRespTitle(int index) =>
      twTradTermiRespTitle.removeAt(index);
  void insertAtIndexInTwTradTermiRespTitle(int index, String item) =>
      twTradTermiRespTitle.insert(index, item);
  void updateTwTradTermiRespTitleAtIndex(
          int index, Function(String) updateFn) =>
      twTradTermiRespTitle[index] = updateFn(twTradTermiRespTitle[index]);

  List<String> twTradTermiRespText = ['Welcome, Trader! Good luck out there.'];
  void addToTwTradTermiRespText(String item) => twTradTermiRespText.add(item);
  void removeFromTwTradTermiRespText(String item) =>
      twTradTermiRespText.remove(item);
  void removeAtIndexFromTwTradTermiRespText(int index) =>
      twTradTermiRespText.removeAt(index);
  void insertAtIndexInTwTradTermiRespText(int index, String item) =>
      twTradTermiRespText.insert(index, item);
  void updateTwTradTermiRespTextAtIndex(int index, Function(String) updateFn) =>
      twTradTermiRespText[index] = updateFn(twTradTermiRespText[index]);

  double? pgstOrigChallBal;

  double? pgstMornAcctBal;

  double? pgstCurrBalDouble;

  double? pgstMaxRiskDouble;

  double? pgstBrokCommDouble;

  double? pgstBrokSpreadDouble;

  bool? pgstMorningAcctBal = true;

  bool? pgstMaxRiskOverride = false;

  bool pgstBrokCommOverride = false;

  bool pgstBrodSpreadOverride = true;

  bool? pgstIsUserAuthenticated = true;

  String? pgstUID;

  dynamic pgstOrdPlaceResp;

  List<String> pgstKeysListStrs = [];
  void addToPgstKeysListStrs(String item) => pgstKeysListStrs.add(item);
  void removeFromPgstKeysListStrs(String item) => pgstKeysListStrs.remove(item);
  void removeAtIndexFromPgstKeysListStrs(int index) =>
      pgstKeysListStrs.removeAt(index);
  void insertAtIndexInPgstKeysListStrs(int index, String item) =>
      pgstKeysListStrs.insert(index, item);
  void updatePgstKeysListStrsAtIndex(int index, Function(String) updateFn) =>
      pgstKeysListStrs[index] = updateFn(pgstKeysListStrs[index]);

  List<double> pgstValsListDoubles = [];
  void addToPgstValsListDoubles(double item) => pgstValsListDoubles.add(item);
  void removeFromPgstValsListDoubles(double item) =>
      pgstValsListDoubles.remove(item);
  void removeAtIndexFromPgstValsListDoubles(int index) =>
      pgstValsListDoubles.removeAt(index);
  void insertAtIndexInPgstValsListDoubles(int index, double item) =>
      pgstValsListDoubles.insert(index, item);
  void updatePgstValsListDoublesAtIndex(int index, Function(double) updateFn) =>
      pgstValsListDoubles[index] = updateFn(pgstValsListDoubles[index]);

  List<String> pgstValsListStrs = [];
  void addToPgstValsListStrs(String item) => pgstValsListStrs.add(item);
  void removeFromPgstValsListStrs(String item) => pgstValsListStrs.remove(item);
  void removeAtIndexFromPgstValsListStrs(int index) =>
      pgstValsListStrs.removeAt(index);
  void insertAtIndexInPgstValsListStrs(int index, String item) =>
      pgstValsListStrs.insert(index, item);
  void updatePgstValsListStrsAtIndex(int index, Function(String) updateFn) =>
      pgstValsListStrs[index] = updateFn(pgstValsListStrs[index]);

  List<dynamic> psgstSettToOverrideListOfObj = [];
  void addToPsgstSettToOverrideListOfObj(dynamic item) =>
      psgstSettToOverrideListOfObj.add(item);
  void removeFromPsgstSettToOverrideListOfObj(dynamic item) =>
      psgstSettToOverrideListOfObj.remove(item);
  void removeAtIndexFromPsgstSettToOverrideListOfObj(int index) =>
      psgstSettToOverrideListOfObj.removeAt(index);
  void insertAtIndexInPsgstSettToOverrideListOfObj(int index, dynamic item) =>
      psgstSettToOverrideListOfObj.insert(index, item);
  void updatePsgstSettToOverrideListOfObjAtIndex(
          int index, Function(dynamic) updateFn) =>
      psgstSettToOverrideListOfObj[index] =
          updateFn(psgstSettToOverrideListOfObj[index]);

  List<double> psgstSettToOverrideListOfDbls = [];
  void addToPsgstSettToOverrideListOfDbls(double item) =>
      psgstSettToOverrideListOfDbls.add(item);
  void removeFromPsgstSettToOverrideListOfDbls(double item) =>
      psgstSettToOverrideListOfDbls.remove(item);
  void removeAtIndexFromPsgstSettToOverrideListOfDbls(int index) =>
      psgstSettToOverrideListOfDbls.removeAt(index);
  void insertAtIndexInPsgstSettToOverrideListOfDbls(int index, double item) =>
      psgstSettToOverrideListOfDbls.insert(index, item);
  void updatePsgstSettToOverrideListOfDblsAtIndex(
          int index, Function(double) updateFn) =>
      psgstSettToOverrideListOfDbls[index] =
          updateFn(psgstSettToOverrideListOfDbls[index]);

  String? pgstGemResp = 'Null';

  double? pgstOriginalStartingAcctBal;

  dynamic pgstReturnedJSON;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Action Block - PostUserInputCall] action in Home widget.
  dynamic aPIcallPageLoad;
  // Stores action output result for [Backend Call - API (GetSizePgLoad)] action in Home widget.
  ApiCallResponse? apiResultGetSizePgLoad;
  // Model for light_dark_switch_V2 component.
  late LightDarkSwitchV2Model lightDarkSwitchV2Model;
  // Stores action output result for [Backend Call - API (GetSize)] action in ToggleIcon widget.
  ApiCallResponse? respGetSizeIcon;
  // Model for TradingViewComp_Light component.
  late TradingViewCompLightModel tradingViewCompLightModel;
  // Model for TradingViewComp_Dark component.
  late TradingViewCompDarkModel tradingViewCompDarkModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // State field(s) for ManualSizeSwitch widget.
  bool? manualSizeSwitchValue;
  // State field(s) for AggSlider widget.
  double? aggSliderValue;
  // State field(s) for CheckboxesAggSlider widget.
  bool? checkboxesAggSliderValue;
  // State field(s) for ManOrigChallBal widget.
  FocusNode? manOrigChallBalFocusNode;
  TextEditingController? manOrigChallBalTextController;
  String? Function(BuildContext, String?)?
      manOrigChallBalTextControllerValidator;
  // State field(s) for CheckboxesOriginalChallBal widget.
  bool? checkboxesOriginalChallBalValue;
  // State field(s) for MornAcctBal widget.
  FocusNode? mornAcctBalFocusNode;
  TextEditingController? mornAcctBalTextController;
  String? Function(BuildContext, String?)? mornAcctBalTextControllerValidator;
  // State field(s) for CheckboxesMorningAcctBal widget.
  bool? checkboxesMorningAcctBalValue;
  // State field(s) for TextFieldCurrAcctBal widget.
  FocusNode? textFieldCurrAcctBalFocusNode;
  TextEditingController? textFieldCurrAcctBalTextController;
  String? Function(BuildContext, String?)?
      textFieldCurrAcctBalTextControllerValidator;
  // State field(s) for CheckboxesCurrCacctBal widget.
  bool? checkboxesCurrCacctBalValue;
  // State field(s) for TextFieldMaxRisk widget.
  FocusNode? textFieldMaxRiskFocusNode;
  TextEditingController? textFieldMaxRiskTextController;
  String? Function(BuildContext, String?)?
      textFieldMaxRiskTextControllerValidator;
  // State field(s) for CheckMaxRiskCap widget.
  bool? checkMaxRiskCapValue;
  // State field(s) for TextFieldCommFee widget.
  FocusNode? textFieldCommFeeFocusNode;
  TextEditingController? textFieldCommFeeTextController;
  String? Function(BuildContext, String?)?
      textFieldCommFeeTextControllerValidator;
  // State field(s) for CheckboxesAvgCommFee widget.
  bool? checkboxesAvgCommFeeValue;
  // State field(s) for TextFieldSpreaFee widget.
  FocusNode? textFieldSpreaFeeFocusNode;
  TextEditingController? textFieldSpreaFeeTextController;
  String? Function(BuildContext, String?)?
      textFieldSpreaFeeTextControllerValidator;
  // State field(s) for CheckboxesAvgSpreadsFee widget.
  bool? checkboxesAvgSpreadsFeeValue;
  // Model for KeyValueAdder component.
  late KeyValueAdderModel keyValueAdderModel;
  // Model for AI_Dialog component.
  late AIDialogModel aIDialogModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  // Stores action output result for [Action Block - PostUserInputCall] action in Button widget.
  dynamic actionoutputASDFA;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];
  List<String> uploadedFileUrls1 = [];

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // State field(s) for TextField_Size_Units widget.
  FocusNode? textFieldSizeUnitsFocusNode;
  TextEditingController? textFieldSizeUnitsTextController;
  String? Function(BuildContext, String?)?
      textFieldSizeUnitsTextControllerValidator;
  String? _textFieldSizeUnitsTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Error with validation of this field.';
    }

    return null;
  }

  // State field(s) for Switch_ManualSizeUnits widget.
  bool? switchManualSizeUnitsValue;
  // Stores action output result for [Backend Call - API (PlaceOrderAndDataAnalysis)] action in Button_buy widget.
  ApiCallResponse? apiResultBUY;
  // Stores action output result for [Backend Call - API (PlaceOrderAndDataAnalysis)] action in Button_Sell widget.
  ApiCallResponse? apiResultSell;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? actionOutputValidateFormSetButton;
  // Stores action output result for [Backend Call - API (GetSize)] action in Button widget.
  ApiCallResponse? apiResultGetSizeSetButton;
  // State field(s) for TextField_currbal widget.
  FocusNode? textFieldCurrbalFocusNode;
  TextEditingController? textFieldCurrbalTextController;
  String? Function(BuildContext, String?)?
      textFieldCurrbalTextControllerValidator;
  String? _textFieldCurrbalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Error with validation of this field.';
    }

    return null;
  }

  // State field(s) for Switch_ManualCurrBal widget.
  bool? switchManualCurrBalValue;
  // Stores action output result for [Validate Form] action in Switch_ManualCurrBal widget.
  bool? actionOutputValidateFormCurrBalSwitch;
  // Stores action output result for [Backend Call - API (GetSize)] action in Switch_ManualCurrBal widget.
  ApiCallResponse? apiResultGetSizeSetCurrBal;
  // State field(s) for TextField_dlybal widget.
  FocusNode? textFieldDlybalFocusNode;
  TextEditingController? textFieldDlybalTextController;
  String? Function(BuildContext, String?)?
      textFieldDlybalTextControllerValidator;
  String? _textFieldDlybalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Error with validation of this field.';
    }

    return null;
  }

  // State field(s) for Switch_ManualDlyBal widget.
  bool? switchManualDlyBalValue;
  // Stores action output result for [Validate Form] action in Switch_ManualDlyBal widget.
  bool? actionOutputValidateFormDlyBalSwitch;
  // Stores action output result for [Backend Call - API (GetSize)] action in Switch_ManualDlyBal widget.
  ApiCallResponse? apiResultGetSizeSetDlyBal;
  // State field(s) for TextField_origbal widget.
  FocusNode? textFieldOrigbalFocusNode;
  TextEditingController? textFieldOrigbalTextController;
  String? Function(BuildContext, String?)?
      textFieldOrigbalTextControllerValidator;
  String? _textFieldOrigbalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Error with validation of this field.';
    }

    return null;
  }

  // State field(s) for Switch_ManualOrigBal widget.
  bool? switchManualOrigBalValue;
  // Stores action output result for [Validate Form] action in Switch_ManualOrigBal widget.
  bool? actionOutputValidateFormOrigBalSwitch;
  // Stores action output result for [Backend Call - API (GetSize)] action in Switch_ManualOrigBal widget.
  ApiCallResponse? apiResultGetSizeSetOrigBal;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for DropDown_Instrument widget.
  String? dropDownInstrumentValue;
  FormFieldController<String>? dropDownInstrumentValueController;
  // State field(s) for Switch_ManualInstrument widget.
  bool? switchManualInstrumentValue;
  // State field(s) for RadioButton_broker widget.
  FormFieldController<String>? radioButtonBrokerValueController;
  // State field(s) for Switch_ManualBroker widget.
  bool? switchManualBrokerValue;
  // State field(s) for RadioButton_OrderType widget.
  FormFieldController<String>? radioButtonOrderTypeValueController;
  // State field(s) for Switch_ManualType widget.
  bool? switchManualTypeValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Slider widget.
  double? sliderValue1;
  // State field(s) for Slider widget.
  double? sliderValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap2 = {};
  List<dynamic> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  @override
  void initState(BuildContext context) {
    lightDarkSwitchV2Model =
        createModel(context, () => LightDarkSwitchV2Model());
    tradingViewCompLightModel =
        createModel(context, () => TradingViewCompLightModel());
    tradingViewCompDarkModel =
        createModel(context, () => TradingViewCompDarkModel());
    keyValueAdderModel = createModel(context, () => KeyValueAdderModel());
    aIDialogModel = createModel(context, () => AIDialogModel());
    textFieldSizeUnitsTextControllerValidator =
        _textFieldSizeUnitsTextControllerValidator;
    textFieldCurrbalTextControllerValidator =
        _textFieldCurrbalTextControllerValidator;
    textFieldDlybalTextControllerValidator =
        _textFieldDlybalTextControllerValidator;
    textFieldOrigbalTextControllerValidator =
        _textFieldOrigbalTextControllerValidator;
  }

  @override
  void dispose() {
    lightDarkSwitchV2Model.dispose();
    tradingViewCompLightModel.dispose();
    tradingViewCompDarkModel.dispose();
    tabBarController1?.dispose();
    manOrigChallBalFocusNode?.dispose();
    manOrigChallBalTextController?.dispose();

    mornAcctBalFocusNode?.dispose();
    mornAcctBalTextController?.dispose();

    textFieldCurrAcctBalFocusNode?.dispose();
    textFieldCurrAcctBalTextController?.dispose();

    textFieldMaxRiskFocusNode?.dispose();
    textFieldMaxRiskTextController?.dispose();

    textFieldCommFeeFocusNode?.dispose();
    textFieldCommFeeTextController?.dispose();

    textFieldSpreaFeeFocusNode?.dispose();
    textFieldSpreaFeeTextController?.dispose();

    keyValueAdderModel.dispose();
    aIDialogModel.dispose();
    tabBarController2?.dispose();
    textFieldSizeUnitsFocusNode?.dispose();
    textFieldSizeUnitsTextController?.dispose();

    textFieldCurrbalFocusNode?.dispose();
    textFieldCurrbalTextController?.dispose();

    textFieldDlybalFocusNode?.dispose();
    textFieldDlybalTextController?.dispose();

    textFieldOrigbalFocusNode?.dispose();
    textFieldOrigbalTextController?.dispose();

    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
  }

  /// Action blocks.
  Future<dynamic> postUserInputCall(BuildContext context) async {
    ApiCallResponse? apiResultFirstcall;

    pgstMorningAcctBal = false;
    pgstMaxRiskOverride = false;
    pgstBrokCommOverride = false;
    pgstBrodSpreadOverride = false;
    FFAppState().batchid = random_data.randomString(
      20,
      24,
      true,
      true,
      true,
    );
    FFAppState().originalObjRef = random_data.randomString(
      20,
      24,
      true,
      true,
      true,
    );
    FFAppState().ObjRef = random_data.randomString(
      20,
      24,
      true,
      true,
      true,
    );
    apiResultFirstcall = await SendInputGetResponseCall.call(
      phase: 'welcome',
      intent: 'get',
      username: currentUserUid,
    );

    if ((apiResultFirstcall.succeeded ?? true) ||
        ((apiResultFirstcall.statusCode ?? 200) == 200)) {
      twAllData = SendInputGetResponseCall.body(
        (apiResultFirstcall.jsonBody ?? ''),
      );
      twPhasesData = SendInputGetResponseCall.phases(
        (apiResultFirstcall.jsonBody ?? ''),
      );
      twIntent = 'place_order';
      twPhase = 'trade';
      pgstIsUserAuthenticated = true;
    } else {
      twAllData = FFAppState().nodataapijsonfail;

      context.pushNamed(IntroPgsWidget.routeName);
    }

    return null;
  }

  Future orderSizer(BuildContext context) async {
    ApiCallResponse? apiResultGetSizeActionBlock;

    apiResultGetSizeActionBlock = await GetSizeCall.call(
      currBal: double.tryParse(textFieldCurrbalTextController.text),
      dlyBal: double.tryParse(textFieldDlybalTextController.text),
      origBal: double.tryParse(textFieldOrigbalTextController.text),
    );

    if ((apiResultGetSizeActionBlock.succeeded ?? true)) {
      FFAppState().OrderSettingsJson =
          (apiResultGetSizeActionBlock.jsonBody ?? '');
      FFAppState().OrderSettingsJsonBackUp =
          (apiResultGetSizeActionBlock.jsonBody ?? '');
      FFAppState().currBal = FFAppState().BoolCurrBal == true
          ? double.parse(textFieldCurrbalTextController.text)
          : FFAppState().currBal;
      FFAppState().dlyBal = FFAppState().BoolDlyBal == true
          ? double.parse(textFieldDlybalTextController.text)
          : FFAppState().dlyBal;
      FFAppState().origBal = FFAppState().boolOrigBal == true
          ? double.parse(textFieldOrigbalTextController.text)
          : FFAppState().origBal;
      FFAppState().sizeUnits = FFAppState().BoolSzUnits == true
          ? int.parse(textFieldSizeUnitsTextController.text)
          : FFAppState().sizeUnits;
    } else {
      FFAppState().currBal = FFAppState().BoolCurrBal == true
          ? double.parse(textFieldCurrbalTextController.text)
          : getJsonField(
              FFAppState().OrderSettingsJson,
              r'''$.bals_dict.curr_bal''',
            );
      FFAppState().dlyBal = FFAppState().BoolDlyBal == true
          ? double.parse(textFieldDlybalTextController.text)
          : getJsonField(
              FFAppState().OrderSettingsJson,
              r'''$.bals_dict.dly_bal''',
            );
      FFAppState().origBal = FFAppState().boolOrigBal == true
          ? double.parse(textFieldOrigbalTextController.text)
          : getJsonField(
              FFAppState().OrderSettingsJson,
              r'''$.bals_dict.orig_bal''',
            );
      FFAppState().sizeUnits = FFAppState().BoolSzUnits == true
          ? int.parse(textFieldCurrbalTextController.text)
          : getJsonField(
              FFAppState().OrderSettingsJson,
              r'''$.units''',
            );
    }
  }

  /// Additional helper methods.
  String? get radioButtonBrokerValue => radioButtonBrokerValueController?.value;
  String? get radioButtonOrderTypeValue =>
      radioButtonOrderTypeValueController?.value;
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
