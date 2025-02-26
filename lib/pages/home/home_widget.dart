import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/is_using/a_i_dialog/a_i_dialog_widget.dart';
import '/is_using/key_value_adder/key_value_adder_widget.dart';
import '/not_using/light_dark_switch_v2/light_dark_switch_v2_widget.dart';
import '/not_using/trading_view_comp_dark/trading_view_comp_dark_widget.dart';
import '/not_using/trading_view_comp_light/trading_view_comp_light_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      _model.aPIcallPageLoad = await _model.postUserInputCall(context);
      _model.apiResultGetSizePgLoad = await GetSizePgLoadCall.call(
        currBal:
            FFAppState().BoolCurrBal == true ? FFAppState().currBalManual : 0.0,
        dlyBal:
            FFAppState().BoolDlyBal == true ? FFAppState().dlyBalManual : 0.0,
        origBal:
            FFAppState().boolOrigBal == true ? FFAppState().origBalManual : 0.0,
      );

      if ((_model.apiResultGetSizePgLoad?.succeeded ?? true)) {
        FFAppState().OrderSettingsJson =
            (_model.apiResultGetSizePgLoad?.jsonBody ?? '');
        FFAppState().OrderSettingsJsonBackUp =
            (_model.apiResultGetSizePgLoad?.jsonBody ?? '');
        FFAppState().OrderSettingsJsonPgLoad =
            (_model.apiResultGetSizePgLoad?.jsonBody ?? '');
        FFAppState().currBal = GetSizePgLoadCall.currBal(
          (_model.apiResultGetSizePgLoad?.jsonBody ?? ''),
        )!;
        FFAppState().dlyBal = GetSizePgLoadCall.dlyBal(
          (_model.apiResultGetSizePgLoad?.jsonBody ?? ''),
        )!;
        FFAppState().origBal = FFAppState().origBal;
        FFAppState().sizeUnits = GetSizePgLoadCall.szUnits(
          (_model.apiResultGetSizePgLoad?.jsonBody ?? ''),
        )!;
        FFAppState().BoolShowOrderPanel = false;
        FFAppState().currBalAuto = GetSizePgLoadCall.currBal(
          (_model.apiResultGetSizePgLoad?.jsonBody ?? ''),
        )!;
        FFAppState().origBalAuto = GetSizePgLoadCall.origBal(
          (_model.apiResultGetSizePgLoad?.jsonBody ?? ''),
        )!;
        FFAppState().dlyBalAuto = GetSizePgLoadCall.dlyBal(
          (_model.apiResultGetSizePgLoad?.jsonBody ?? ''),
        )!;
        FFAppState().sizeUnitsAuto = GetSizePgLoadCall.szUnits(
          (_model.apiResultGetSizePgLoad?.jsonBody ?? ''),
        )!;
        safeSetState(() {});
      } else {
        FFAppState().OrderSettingsJson = getJsonField(
          FFAppState().OrderSettingsJsonBackUp,
          r'''$.body''',
        );
        safeSetState(() {});
        FFAppState().currBal = getJsonField(
          FFAppState().OrderSettingsJson,
          r'''$.bals_dict.curr_bal''',
        );
        FFAppState().origBal = getJsonField(
          FFAppState().OrderSettingsJson,
          r'''$.bals_dict.orig_bal''',
        );
        FFAppState().sizeUnits = getJsonField(
          FFAppState().OrderSettingsJson,
          r'''$.units''',
        );
        FFAppState().dlyBal = getJsonField(
          FFAppState().OrderSettingsJson,
          r'''$.bals_dict.dly_bal''',
        );
        FFAppState().BoolShowOrderPanel = false;
        safeSetState(() {});
      }
    });

    _model.tabBarController1 = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.manualSizeSwitchValue = true;
    _model.manOrigChallBalTextController ??=
        TextEditingController(text: '26000.00');
    _model.manOrigChallBalFocusNode ??= FocusNode();

    _model.mornAcctBalTextController ??=
        TextEditingController(text: '26000.00');
    _model.mornAcctBalFocusNode ??= FocusNode();

    _model.textFieldCurrAcctBalTextController ??=
        TextEditingController(text: '25000.00');
    _model.textFieldCurrAcctBalFocusNode ??= FocusNode();

    _model.textFieldMaxRiskTextController ??=
        TextEditingController(text: '2.0');
    _model.textFieldMaxRiskFocusNode ??= FocusNode();

    _model.textFieldCommFeeTextController ??=
        TextEditingController(text: '28.00');
    _model.textFieldCommFeeFocusNode ??= FocusNode();

    _model.textFieldSpreaFeeTextController ??=
        TextEditingController(text: '37.00');
    _model.textFieldSpreaFeeFocusNode ??= FocusNode();

    _model.tabBarController2 = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textFieldSizeUnitsFocusNode ??= FocusNode();

    _model.switchManualSizeUnitsValue = false;

    _model.textFieldCurrbalFocusNode ??= FocusNode();
    _model.textFieldCurrbalFocusNode!.addListener(() => safeSetState(() {}));
    _model.switchManualCurrBalValue = FFAppState().BoolCurrBal;

    _model.textFieldDlybalFocusNode ??= FocusNode();

    _model.switchManualDlyBalValue = false;

    _model.textFieldOrigbalFocusNode ??= FocusNode();

    _model.switchManualOrigBalValue = false;
    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.switchManualInstrumentValue = true;
    _model.switchManualBrokerValue = true;
    _model.switchManualTypeValue = true;
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.switchValue1 = false;
    _model.switchValue2 = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: WebViewAware(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
              child: Container(
                width: 270.0,
                height: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 300.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      color: FlutterFlowTheme.of(context).alternate,
                      offset: Offset(
                        1.0,
                        0.0,
                      ),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.add_task_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 32.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Trading Wheels',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 28.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Search',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.dashboard_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 28.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Dashboard',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(OpenAIPgWidget.routeName);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.bar_chart,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 28.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Data Analysis',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.document_scanner_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 28.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Contracts',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.groups,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 28.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'My Team',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 28.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      await authManager.signOut();
                                      GoRouter.of(context)
                                          .clearRedirectLocation();

                                      context.goNamedAuth(
                                          UserSignInWidget.routeName,
                                          context.mounted);
                                    },
                                    child: Text(
                                      'Log Out',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Divider(
                                height: 12.0,
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                Duration(milliseconds: 500),
                                            imageUrl:
                                                'https://images.unsplash.com/photo-1624561172888-ac93c696e10c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjJ8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                            width: 44.0,
                                            height: 44.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Andrew D.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                'admin@gmail.com',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                'View Profile',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        endDrawer: Drawer(
          elevation: 16.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 5.0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        hoverColor: FlutterFlowTheme.of(context).alternate,
                        hoverIconColor:
                            FlutterFlowTheme.of(context).primaryText,
                        icon: Icon(
                          Icons.menu,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 25.0,
                        ),
                        onPressed: () async {
                          // Open LeftDrawer
                          scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (() {
                          if ((MediaQuery.sizeOf(context).width * 0.6) <
                              kBreakpointSmall) {
                            return false;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return true;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return true;
                          } else {
                            return true;
                          }
                        }())
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: wrapWithModel(
                              model: _model.lightDarkSwitchV2Model,
                              updateCallback: () => safeSetState(() {}),
                              child: LightDarkSwitchV2Widget(),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: ToggleIcon(
                            onPressed: () async {
                              safeSetState(() =>
                                  FFAppState().BoolShowOrderPanel =
                                      !FFAppState().BoolShowOrderPanel);
                              _model.respGetSizeIcon = await GetSizeCall.call(
                                currBal: FFAppState().currBal,
                                dlyBal: FFAppState().dlyBal,
                                origBal: FFAppState().origBal,
                              );

                              safeSetState(() {});
                            },
                            value: FFAppState().BoolShowOrderPanel,
                            onIcon: Icon(
                              Icons.attach_money,
                              color:
                                  FlutterFlowTheme.of(context).purpCircBorder,
                              size: 24.0,
                            ),
                            offIcon: Icon(
                              Icons.money_off_csred_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: ToggleIcon(
                            onPressed: () async {
                              safeSetState(() => FFAppState().showChartBool =
                                  !FFAppState().showChartBool);
                            },
                            value: FFAppState().showChartBool,
                            onIcon: Icon(
                              Icons.candlestick_chart_sharp,
                              color:
                                  FlutterFlowTheme.of(context).purpCircBorder,
                              size: 24.0,
                            ),
                            offIcon: Icon(
                              Icons.candlestick_chart_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Stack(
                        children: [
                          if (Theme.of(context).brightness == Brightness.light)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.tradingViewCompLightModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TradingViewCompLightWidget(),
                                  ),
                                ),
                              ],
                            ),
                          if (Theme.of(context).brightness == Brightness.dark)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.tradingViewCompDarkModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TradingViewCompDarkWidget(),
                                  ),
                                ),
                              ],
                            ),
                          if (FFAppState().showChartBool == true)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Tools',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              lineHeight: 1.1,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                thickness: 4.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment(0.0, 0),
                                                  child: TabBar(
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    unselectedLabelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    unselectedLabelStyle:
                                                        TextStyle(),
                                                    indicatorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    tabs: [
                                                      Tab(
                                                        text: 'Settings Sync',
                                                      ),
                                                      Tab(
                                                        text: 'Sizing Schema',
                                                      ),
                                                      Tab(
                                                        text: 'AI Advisor',
                                                      ),
                                                      Tab(
                                                        text: 'Social',
                                                      ),
                                                    ],
                                                    controller: _model
                                                        .tabBarController1,
                                                    onTap: (i) async {
                                                      [
                                                        () async {},
                                                        () async {},
                                                        () async {},
                                                        () async {}
                                                      ][i]();
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    controller: _model
                                                        .tabBarController1,
                                                    children: [
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Divider(
                                                              thickness: 1.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                            ),
                                                            Container(
                                                              height: 70.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Sizing Input Settings',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Switch
                                                                              .adaptive(
                                                                            value:
                                                                                _model.manualSizeSwitchValue!,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.manualSizeSwitchValue = newValue);
                                                                              if (newValue) {
                                                                                safeSetState(() {
                                                                                  _model.manualSizeSwitchValue = true;
                                                                                });
                                                                              } else {
                                                                                safeSetState(() {
                                                                                  _model.manualSizeSwitchValue = false;
                                                                                });
                                                                              }
                                                                            },
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            activeTrackColor:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            inactiveTrackColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            inactiveThumbColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                    child: Text(
                                                                                      'Manual',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                    child: Text(
                                                                                      'Override',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if (_model
                                                                            .manualSizeSwitchValue ==
                                                                        true)
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 100.0,
                                                                              child: VerticalDivider(
                                                                                thickness: 1.0,
                                                                                color: FlutterFlowTheme.of(context).accent4,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                    child: Text(
                                                                                      'Aggression',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                    child: Text(
                                                                                      'Settings',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  child: Slider(
                                                                                    activeColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                    inactiveColor: FlutterFlowTheme.of(context).alternate,
                                                                                    min: 0.0,
                                                                                    max: 1.0,
                                                                                    value: _model.aggSliderValue ??= 0.2,
                                                                                    label: _model.aggSliderValue?.toStringAsFixed(2),
                                                                                    divisions: 5,
                                                                                    onChanged: (newValue) {
                                                                                      newValue = double.parse(newValue.toStringAsFixed(2));
                                                                                      safeSetState(() => _model.aggSliderValue = newValue);
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                              child: Theme(
                                                                                data: ThemeData(
                                                                                  checkboxTheme: CheckboxThemeData(
                                                                                    visualDensity: VisualDensity.compact,
                                                                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(1.0),
                                                                                    ),
                                                                                  ),
                                                                                  unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                ),
                                                                                child: Checkbox(
                                                                                  value: _model.checkboxesAggSliderValue ??= false,
                                                                                  onChanged: (newValue) async {
                                                                                    safeSetState(() => _model.checkboxesAggSliderValue = newValue!);
                                                                                    if (newValue!) {
                                                                                      safeSetState(() {
                                                                                        _model.checkboxesAggSliderValue = true;
                                                                                      });
                                                                                    } else {
                                                                                      safeSetState(() {
                                                                                        _model.checkboxesAggSliderValue = false;
                                                                                      });
                                                                                    }
                                                                                  },
                                                                                  side: BorderSide(
                                                                                    width: 2,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                                  activeColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                  checkColor: FlutterFlowTheme.of(context).info,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            if (_model
                                                                    .manualSizeSwitchValue ==
                                                                true)
                                                              FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future:
                                                                    SendInputGetResponseCall
                                                                        .call(
                                                                  username:
                                                                      currentUserUid,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final listViewSendInputGetResponseResponse =
                                                                      snapshot
                                                                          .data!;

                                                                  return ListView(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    children: [
                                                                      Form(
                                                                        key: _model
                                                                            .formKey1,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.always,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 2,
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Divider(
                                                                                    thickness: 1.0,
                                                                                    color: FlutterFlowTheme.of(context).accent4,
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 6.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          flex: 2,
                                                                                          child: Text(
                                                                                            'Setting',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 2,
                                                                                          child: Text(
                                                                                            'Automated Value',
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 3,
                                                                                          child: Text(
                                                                                            'Manual Value',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 3,
                                                                                          child: Text(
                                                                                            'Update?',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 6.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          flex: 2,
                                                                                          child: Text(
                                                                                            'Original Chall Account Balance',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 2,
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Current Value',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 3,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 4.0),
                                                                                            child: TextFormField(
                                                                                              controller: _model.manOrigChallBalTextController,
                                                                                              focusNode: _model.manOrigChallBalFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.manOrigChallBalTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: true,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                suffixIcon: _model.manOrigChallBalTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.manOrigChallBalTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 18.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLength: 15,
                                                                                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                                                                              buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                              validator: _model.manOrigChallBalTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: Theme(
                                                                                            data: ThemeData(
                                                                                              checkboxTheme: CheckboxThemeData(
                                                                                                visualDensity: VisualDensity.compact,
                                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(1.0),
                                                                                                ),
                                                                                              ),
                                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                            child: Checkbox(
                                                                                              value: _model.checkboxesOriginalChallBalValue ??= false,
                                                                                              onChanged: (newValue) async {
                                                                                                safeSetState(() => _model.checkboxesOriginalChallBalValue = newValue!);
                                                                                                if (newValue!) {
                                                                                                  safeSetState(() {
                                                                                                    _model.checkboxesOriginalChallBalValue = true;
                                                                                                  });
                                                                                                } else {
                                                                                                  safeSetState(() {
                                                                                                    _model.checkboxesOriginalChallBalValue = false;
                                                                                                  });
                                                                                                }
                                                                                              },
                                                                                              side: BorderSide(
                                                                                                width: 2,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              activeColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                              checkColor: FlutterFlowTheme.of(context).info,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 6.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          flex: 2,
                                                                                          child: Text(
                                                                                            'Morning Account Balance',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 2,
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Current Value',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 3,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 4.0),
                                                                                            child: TextFormField(
                                                                                              controller: _model.mornAcctBalTextController,
                                                                                              focusNode: _model.mornAcctBalFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.mornAcctBalTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: true,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                suffixIcon: _model.mornAcctBalTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.mornAcctBalTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 18.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLength: 15,
                                                                                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                                                                              buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                              validator: _model.mornAcctBalTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: Theme(
                                                                                            data: ThemeData(
                                                                                              checkboxTheme: CheckboxThemeData(
                                                                                                visualDensity: VisualDensity.compact,
                                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(1.0),
                                                                                                ),
                                                                                              ),
                                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                            child: Checkbox(
                                                                                              value: _model.checkboxesMorningAcctBalValue ??= false,
                                                                                              onChanged: (newValue) async {
                                                                                                safeSetState(() => _model.checkboxesMorningAcctBalValue = newValue!);
                                                                                                if (newValue!) {
                                                                                                  safeSetState(() {
                                                                                                    _model.checkboxesMorningAcctBalValue = true;
                                                                                                  });
                                                                                                } else {
                                                                                                  safeSetState(() {
                                                                                                    _model.checkboxesMorningAcctBalValue = false;
                                                                                                  });
                                                                                                }
                                                                                              },
                                                                                              side: BorderSide(
                                                                                                width: 2,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              activeColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                              checkColor: FlutterFlowTheme.of(context).info,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          flex: 2,
                                                                                          child: Text(
                                                                                            'Currrent Account Balance',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 2,
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Current Value',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 3,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 4.0),
                                                                                            child: TextFormField(
                                                                                              controller: _model.textFieldCurrAcctBalTextController,
                                                                                              focusNode: _model.textFieldCurrAcctBalFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.textFieldCurrAcctBalTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: true,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                suffixIcon: _model.textFieldCurrAcctBalTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.textFieldCurrAcctBalTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 18.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLength: 15,
                                                                                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                                                                              buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                              validator: _model.textFieldCurrAcctBalTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: Theme(
                                                                                            data: ThemeData(
                                                                                              checkboxTheme: CheckboxThemeData(
                                                                                                visualDensity: VisualDensity.compact,
                                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(1.0),
                                                                                                ),
                                                                                              ),
                                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                            child: Checkbox(
                                                                                              value: _model.checkboxesCurrCacctBalValue ??= false,
                                                                                              onChanged: (newValue) async {
                                                                                                safeSetState(() => _model.checkboxesCurrCacctBalValue = newValue!);
                                                                                                if (newValue!) {
                                                                                                  safeSetState(() {
                                                                                                    _model.textFieldCurrAcctBalTextController?.text = true.toString();
                                                                                                  });
                                                                                                } else {
                                                                                                  safeSetState(() {
                                                                                                    _model.checkboxesCurrCacctBalValue = false;
                                                                                                  });
                                                                                                }
                                                                                              },
                                                                                              side: BorderSide(
                                                                                                width: 2,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              activeColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                              checkColor: FlutterFlowTheme.of(context).info,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          flex: 2,
                                                                                          child: Text(
                                                                                            'Max Risk Cap Perc Per Trade',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 2,
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Current Value',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 3,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 4.0),
                                                                                            child: TextFormField(
                                                                                              controller: _model.textFieldMaxRiskTextController,
                                                                                              focusNode: _model.textFieldMaxRiskFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.textFieldMaxRiskTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: true,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                suffixIcon: _model.textFieldMaxRiskTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.textFieldMaxRiskTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 18.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLength: 15,
                                                                                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                                                                              buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                              validator: _model.textFieldMaxRiskTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: Theme(
                                                                                            data: ThemeData(
                                                                                              checkboxTheme: CheckboxThemeData(
                                                                                                visualDensity: VisualDensity.compact,
                                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(1.0),
                                                                                                ),
                                                                                              ),
                                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                            child: Checkbox(
                                                                                              value: _model.checkMaxRiskCapValue ??= false,
                                                                                              onChanged: (newValue) async {
                                                                                                safeSetState(() => _model.checkMaxRiskCapValue = newValue!);
                                                                                                if (newValue!) {
                                                                                                  safeSetState(() {
                                                                                                    _model.checkMaxRiskCapValue = true;
                                                                                                  });
                                                                                                } else {
                                                                                                  safeSetState(() {
                                                                                                    _model.checkMaxRiskCapValue = false;
                                                                                                  });
                                                                                                }
                                                                                              },
                                                                                              side: BorderSide(
                                                                                                width: 2,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              activeColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                              checkColor: FlutterFlowTheme.of(context).info,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          flex: 2,
                                                                                          child: Text(
                                                                                            'Average Commission Fee',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 2,
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Current Value',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 3,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 4.0),
                                                                                            child: TextFormField(
                                                                                              controller: _model.textFieldCommFeeTextController,
                                                                                              focusNode: _model.textFieldCommFeeFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.textFieldCommFeeTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: true,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                suffixIcon: _model.textFieldCommFeeTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.textFieldCommFeeTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 18.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLength: 15,
                                                                                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                                                                              buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                              validator: _model.textFieldCommFeeTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: Theme(
                                                                                            data: ThemeData(
                                                                                              checkboxTheme: CheckboxThemeData(
                                                                                                visualDensity: VisualDensity.compact,
                                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(1.0),
                                                                                                ),
                                                                                              ),
                                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                            child: Checkbox(
                                                                                              value: _model.checkboxesAvgCommFeeValue ??= false,
                                                                                              onChanged: (newValue) async {
                                                                                                safeSetState(() => _model.checkboxesAvgCommFeeValue = newValue!);
                                                                                                if (newValue!) {
                                                                                                  safeSetState(() {
                                                                                                    _model.checkboxesAvgCommFeeValue = true;
                                                                                                  });
                                                                                                } else {
                                                                                                  safeSetState(() {
                                                                                                    _model.checkboxesAvgCommFeeValue = true;
                                                                                                  });
                                                                                                }
                                                                                              },
                                                                                              side: BorderSide(
                                                                                                width: 2,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              activeColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                              checkColor: FlutterFlowTheme.of(context).info,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          flex: 2,
                                                                                          child: Text(
                                                                                            'Average Spreads Fee',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 2,
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Current Value',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 3,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 4.0),
                                                                                            child: TextFormField(
                                                                                              controller: _model.textFieldSpreaFeeTextController,
                                                                                              focusNode: _model.textFieldSpreaFeeFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.textFieldSpreaFeeTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: true,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                                ),
                                                                                                suffixIcon: _model.textFieldSpreaFeeTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.textFieldSpreaFeeTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 18.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLength: 15,
                                                                                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                                                                              buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                              validator: _model.textFieldSpreaFeeTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 1,
                                                                                          child: Theme(
                                                                                            data: ThemeData(
                                                                                              checkboxTheme: CheckboxThemeData(
                                                                                                visualDensity: VisualDensity.compact,
                                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(1.0),
                                                                                                ),
                                                                                              ),
                                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                            child: Checkbox(
                                                                                              value: _model.checkboxesAvgSpreadsFeeValue ??= false,
                                                                                              onChanged: (newValue) async {
                                                                                                safeSetState(() => _model.checkboxesAvgSpreadsFeeValue = newValue!);
                                                                                                if (newValue!) {
                                                                                                  safeSetState(() {
                                                                                                    _model.checkboxesAvgSpreadsFeeValue = true;
                                                                                                  });
                                                                                                } else {
                                                                                                  safeSetState(() {
                                                                                                    _model.checkboxesAvgSpreadsFeeValue = false;
                                                                                                  });
                                                                                                }
                                                                                              },
                                                                                              side: BorderSide(
                                                                                                width: 2,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              activeColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                              checkColor: FlutterFlowTheme.of(context).info,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(1.0, -1.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                _model.pgstOrigChallBal = null;
                                                                                                _model.pgstMornAcctBal = null;
                                                                                                _model.pgstCurrBalDouble = null;
                                                                                                _model.pgstMaxRiskDouble = null;
                                                                                                _model.pgstBrokCommDouble = null;
                                                                                                _model.pgstBrokSpreadDouble = null;
                                                                                                safeSetState(() {});
                                                                                                safeSetState(() {
                                                                                                  _model.textFieldCurrAcctBalTextController?.text = ((_model.manualSizeSwitchValue == true) && (_model.checkboxesOriginalChallBalValue == true) ? _model.manOrigChallBalTextController.text : null);
                                                                                                });
                                                                                                safeSetState(() {
                                                                                                  _model.mornAcctBalTextController?.text = ((_model.manualSizeSwitchValue == true) && (_model.mornAcctBalTextController.text == 'true') ? _model.mornAcctBalTextController.text : null);
                                                                                                });
                                                                                                safeSetState(() {
                                                                                                  _model.textFieldCurrAcctBalTextController?.text = ((_model.manualSizeSwitchValue == true) && (_model.checkboxesCurrCacctBalValue == true) ? _model.textFieldCurrAcctBalTextController.text : null);
                                                                                                });
                                                                                                safeSetState(() {
                                                                                                  _model.textFieldMaxRiskTextController?.text = ((_model.manualSizeSwitchValue == true) && (_model.checkMaxRiskCapValue == true) ? _model.textFieldMaxRiskTextController.text : null);
                                                                                                });
                                                                                                safeSetState(() {
                                                                                                  _model.textFieldCommFeeTextController?.text = ((_model.manualSizeSwitchValue == true) && (_model.checkboxesAvgCommFeeValue == true) ? _model.textFieldCommFeeTextController.text : null);
                                                                                                });
                                                                                                safeSetState(() {
                                                                                                  _model.textFieldSpreaFeeTextController?.text = ((_model.manualSizeSwitchValue == true) && (_model.checkboxesAvgSpreadsFeeValue == true) ? _model.textFieldSpreaFeeTextController.text : null);
                                                                                                });
                                                                                                safeSetState(() {
                                                                                                  _model.aggSliderValue = double.parse((_model.manualSizeSwitchValue == true) && (_model.checkboxesAggSliderValue == true)
                                                                                                      ? valueOrDefault<String>(
                                                                                                          _model.aggSliderValue?.toString(),
                                                                                                          '0.2',
                                                                                                        )
                                                                                                      : null);
                                                                                                });
                                                                                              },
                                                                                              text: 'Update Selected',
                                                                                              options: FFButtonOptions(
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      color: FlutterFlowTheme.of(context).grayWhiteAlways,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                elevation: 3.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                                                hoverColor: FlutterFlowTheme.of(context).inputLineFoc,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Stack(
                                                              children: [
                                                                FutureBuilder<
                                                                    ApiCallResponse>(
                                                                  future:
                                                                      SendInputGetResponseCall
                                                                          .call(
                                                                    username:
                                                                        currentUserUid,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final varListColumnSendInputGetResponseResponse =
                                                                        snapshot
                                                                            .data!;

                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (FFAppState().AddNewKeyVal ==
                                                                            true)
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                  child: wrapWithModel(
                                                                                    model: _model.keyValueAdderModel,
                                                                                    updateCallback: () => safeSetState(() {}),
                                                                                    child: KeyValueAdderWidget(),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        Form(
                                                                          key: _model
                                                                              .formKey3,
                                                                          autovalidateMode:
                                                                              AutovalidateMode.disabled,
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final tradeSetting = getJsonField(
                                                                                varListColumnSendInputGetResponseResponse.jsonBody,
                                                                                r'''$.body.trading_settings''',
                                                                              ).toList();

                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: tradeSetting.length,
                                                                                itemBuilder: (context, tradeSettingIndex) {
                                                                                  final tradeSettingItem = tradeSetting[tradeSettingIndex];
                                                                                  return Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              tradeSettingItem,
                                                                                              r'''$''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [],
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .purpCircBorder,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          ToggleIcon(
                                                                        onPressed:
                                                                            () async {
                                                                          safeSetState(() =>
                                                                              FFAppState().AddNewKeyVal = !FFAppState().AddNewKeyVal);
                                                                        },
                                                                        value: FFAppState()
                                                                            .AddNewKeyVal,
                                                                        onIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .cancel_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                        offIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .add,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .aIDialogModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: AIDialogWidget(
                                                          parameter1:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model.pgstGemResp,
                                                            '...',
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Flexible(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Data',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  lineHeight:
                                                                      1.1,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 4.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ],
                                              ),
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 570.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      3.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment(
                                                                        -1.0,
                                                                        0),
                                                                child:
                                                                    FlutterFlowButtonTabBar(
                                                                  useToggleButtonStyle:
                                                                      false,
                                                                  isScrollable:
                                                                      true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        color: Color(
                                                                            0xFF14181B),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  unselectedLabelStyle:
                                                                      TextStyle(),
                                                                  labelColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  unselectedLabelColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .purpCircFill,
                                                                  unselectedBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .idleFillPurpCirc,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .purpCircBorder,
                                                                  unselectedBorderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .idleBordPurpCirc,
                                                                  borderWidth:
                                                                      2.0,
                                                                  borderRadius:
                                                                      12.0,
                                                                  elevation:
                                                                      0.0,
                                                                  labelPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  buttonMargin:
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                  tabs: [
                                                                    // Routines = The set of phases you perform pre-trading/post-trading.
                                                                    //
                                                                    // Interventions = The set of phases that occur pre-entry, (before initial entry), at each scale-in, at each scale-out, exit.
                                                                    //
                                                                    // Filters = the minimum criteria requirements that muse exist before a trade.
                                                                    //
                                                                    // Rule Automations
                                                                    Tab(
                                                                      text:
                                                                          'Phases',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'interventions',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'Order Tags',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'Settings',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'Backtesting',
                                                                    ),
                                                                  ],
                                                                  controller: _model
                                                                      .tabBarController2,
                                                                  onTap:
                                                                      (i) async {
                                                                    [
                                                                      () async {},
                                                                      () async {},
                                                                      () async {},
                                                                      () async {},
                                                                      () async {}
                                                                    ][i]();
                                                                  },
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    TabBarView(
                                                                  controller: _model
                                                                      .tabBarController2,
                                                                  children: [
                                                                    KeepAliveWidgetWrapper(
                                                                      builder:
                                                                          (context) =>
                                                                              Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 5.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: 'Add  Phase Record',
                                                                                      icon: Icon(
                                                                                        Icons.add,
                                                                                        size: 14.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 22.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                              color: FlutterFlowTheme.of(context).whtTxtAlways,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        elevation: 3.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(14.0),
                                                                                        hoverColor: FlutterFlowTheme.of(context).inputLineNotFoc,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          FutureBuilder<
                                                                              ApiCallResponse>(
                                                                            future:
                                                                                SendInputGetResponseCall.call(
                                                                              username: currentUserUid,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 40.0,
                                                                                    height: 40.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).purpCircBorder,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final listViewSendInputGetResponseResponse = snapshot.data!;

                                                                              return Builder(
                                                                                builder: (context) {
                                                                                  final phase = getJsonField(
                                                                                    listViewSendInputGetResponseResponse.jsonBody,
                                                                                    r'''$.body.input_data.*''',
                                                                                  ).toList();

                                                                                  return ReorderableListView.builder(
                                                                                    padding: EdgeInsets.zero,
                                                                                    primary: false,
                                                                                    proxyDecorator: (Widget child, int index, Animation<double> animation) => Material(color: Colors.transparent, child: child),
                                                                                    shrinkWrap: true,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    itemCount: phase.length,
                                                                                    itemBuilder: (context, phaseIndex) {
                                                                                      final phaseItem = phase[phaseIndex];
                                                                                      return Container(
                                                                                        key: ValueKey("ListView_2f7rqjot" + '_' + phaseIndex.toString()),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 60.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 0.0,
                                                                                                  color: Color(0xFFE0E3E7),
                                                                                                  offset: Offset(
                                                                                                    0.0,
                                                                                                    1.0,
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 16.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 2,
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Phase Name:',
                                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                phaseItem,
                                                                                                                r'''$.obj_name''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Desc:',
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                phaseItem,
                                                                                                                r'''$.desc''',
                                                                                                              ).toString().maybeHandleOverflow(
                                                                                                                    maxChars: 60,
                                                                                                                  ),
                                                                                                              maxLines: 1,
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Today\'s Response:',
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                phaseItem,
                                                                                                                r'''$.phase_type''',
                                                                                                              ).toString().maybeHandleOverflow(
                                                                                                                    maxChars: 60,
                                                                                                                  ),
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            height: 22.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Color(0x4D39D2C0),
                                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                                            ),
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                              child: Text(
                                                                                                                'Enabled',
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                                      color: Color(0xFF39D2C0),
                                                                                                                      fontSize: 12.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                    onReorder: (int reorderableOldIndex, int reorderableNewIndex) async {},
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    KeepAliveWidgetWrapper(
                                                                      builder:
                                                                          (context) =>
                                                                              Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 5.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: 'Add  New',
                                                                                      icon: Icon(
                                                                                        Icons.add,
                                                                                        size: 14.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 22.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                              color: FlutterFlowTheme.of(context).whtTxtAlways,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        elevation: 3.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(14.0),
                                                                                        hoverColor: FlutterFlowTheme.of(context).inputLineNotFoc,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FutureBuilder<ApiCallResponse>(
                                                                              future: SendInputGetResponseCall.call(
                                                                                username: valueOrDefault<String>(
                                                                                  valueOrDefault(currentUserDocument?.rtdbUid, ''),
                                                                                  'default',
                                                                                ),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                final listViewSendInputGetResponseResponse = snapshot.data!;

                                                                                return Builder(
                                                                                  builder: (context) {
                                                                                    final phase = getJsonField(
                                                                                      listViewSendInputGetResponseResponse.jsonBody,
                                                                                      r'''$.body.input_data.*''',
                                                                                    ).toList();

                                                                                    return ListView.builder(
                                                                                      padding: EdgeInsets.zero,
                                                                                      primary: false,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: phase.length,
                                                                                      itemBuilder: (context, phaseIndex) {
                                                                                        final phaseItem = phase[phaseIndex];
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 60.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 0.0,
                                                                                                  color: Color(0xFFE0E3E7),
                                                                                                  offset: Offset(
                                                                                                    0.0,
                                                                                                    1.0,
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 16.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 2,
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Phase Name:',
                                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                phaseItem,
                                                                                                                r'''$.obj_name''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Desc:',
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                phaseItem,
                                                                                                                r'''$.desc''',
                                                                                                              ).toString().maybeHandleOverflow(
                                                                                                                    maxChars: 60,
                                                                                                                  ),
                                                                                                              maxLines: 1,
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Today\'s Response:',
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                phaseItem,
                                                                                                                r'''$.desc''',
                                                                                                              ).toString().maybeHandleOverflow(
                                                                                                                    maxChars: 60,
                                                                                                                  ),
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            height: 22.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Color(0x4D39D2C0),
                                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                                            ),
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                              child: Text(
                                                                                                                'Enabled',
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                                      color: Color(0xFF39D2C0),
                                                                                                                      fontSize: 12.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    KeepAliveWidgetWrapper(
                                                                      builder:
                                                                          (context) =>
                                                                              Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 5.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: 'Add  New',
                                                                                      icon: Icon(
                                                                                        Icons.add,
                                                                                        size: 14.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 22.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                              color: FlutterFlowTheme.of(context).whtTxtAlways,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        elevation: 3.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(14.0),
                                                                                        hoverColor: FlutterFlowTheme.of(context).inputLineNotFoc,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                FutureBuilder<ApiCallResponse>(
                                                                              future: SendInputGetResponseCall.call(
                                                                                username: valueOrDefault<String>(
                                                                                  valueOrDefault(currentUserDocument?.rtdbUid, ''),
                                                                                  'default',
                                                                                ),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                final listViewSendInputGetResponseResponse = snapshot.data!;

                                                                                return Builder(
                                                                                  builder: (context) {
                                                                                    final phase = getJsonField(
                                                                                      listViewSendInputGetResponseResponse.jsonBody,
                                                                                      r'''$.body.input_data.*''',
                                                                                    ).toList();

                                                                                    return ListView.builder(
                                                                                      padding: EdgeInsets.zero,
                                                                                      primary: false,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: phase.length,
                                                                                      itemBuilder: (context, phaseIndex) {
                                                                                        final phaseItem = phase[phaseIndex];
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 60.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 0.0,
                                                                                                  color: Color(0xFFE0E3E7),
                                                                                                  offset: Offset(
                                                                                                    0.0,
                                                                                                    1.0,
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 16.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 2,
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Phase Name:',
                                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                phaseItem,
                                                                                                                r'''$.obj_name''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Desc:',
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                phaseItem,
                                                                                                                r'''$.desc''',
                                                                                                              ).toString().maybeHandleOverflow(
                                                                                                                    maxChars: 60,
                                                                                                                  ),
                                                                                                              maxLines: 1,
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Today\'s Response:',
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                phaseItem,
                                                                                                                r'''$.desc''',
                                                                                                              ).toString().maybeHandleOverflow(
                                                                                                                    maxChars: 60,
                                                                                                                  ),
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            height: 22.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Color(0x4D39D2C0),
                                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                                            ),
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                              child: Text(
                                                                                                                'Enabled',
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                                      color: Color(0xFF39D2C0),
                                                                                                                      fontSize: 12.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    KeepAliveWidgetWrapper(
                                                                      builder:
                                                                          (context) =>
                                                                              Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 5.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: 'Add  New',
                                                                                      icon: Icon(
                                                                                        Icons.add,
                                                                                        size: 14.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 22.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                              color: FlutterFlowTheme.of(context).whtTxtAlways,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        elevation: 3.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(14.0),
                                                                                        hoverColor: FlutterFlowTheme.of(context).inputLineNotFoc,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          FutureBuilder<
                                                                              ApiCallResponse>(
                                                                            future:
                                                                                SendInputGetResponseCall.call(
                                                                              username: valueOrDefault<String>(
                                                                                currentUserReference?.id,
                                                                                'default',
                                                                              ),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final listViewSendInputGetResponseResponse = snapshot.data!;

                                                                              return Builder(
                                                                                builder: (context) {
                                                                                  final setting = getJsonField(
                                                                                    listViewSendInputGetResponseResponse.jsonBody,
                                                                                    r'''$.body.account_settings_list''',
                                                                                  ).toList();

                                                                                  return ListView.builder(
                                                                                    padding: EdgeInsets.zero,
                                                                                    primary: false,
                                                                                    shrinkWrap: true,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    itemCount: setting.length,
                                                                                    itemBuilder: (context, settingIndex) {
                                                                                      final settingItem = setting[settingIndex];
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          height: 60.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 0.0,
                                                                                                color: Color(0xFFE0E3E7),
                                                                                                offset: Offset(
                                                                                                  0.0,
                                                                                                  1.0,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                            borderRadius: BorderRadius.circular(0.0),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 16.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Flexible(
                                                                                                      flex: 2,
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Phase Name:',
                                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 10.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            getJsonField(
                                                                                                              settingItem,
                                                                                                              r'''$.obj_name''',
                                                                                                            ).toString(),
                                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 14.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Flexible(
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Auto',
                                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 10.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            getJsonField(
                                                                                                              settingItem,
                                                                                                              r'''$.auto''',
                                                                                                            ).toString().maybeHandleOverflow(
                                                                                                                  maxChars: 60,
                                                                                                                ),
                                                                                                            maxLines: 1,
                                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Flexible(
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Manual',
                                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 10.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            getJsonField(
                                                                                                              settingItem,
                                                                                                              r'''$.auto''',
                                                                                                            ).toString().maybeHandleOverflow(
                                                                                                                  maxChars: 60,
                                                                                                                ),
                                                                                                            maxLines: 1,
                                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Set  New  Manual Value:',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          height: 22.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0x4D39D2C0),
                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                          ),
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                            child: Text(
                                                                                                              'Enabled',
                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: Color(0xFF39D2C0),
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          height: 22.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0x00FFFFFF),
                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                          ),
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    KeepAliveWidgetWrapper(
                                                                      builder:
                                                                          (context) =>
                                                                              Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 5.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            _model.actionoutputASDFA = await _model.postUserInputCall(context);

                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          text: 'Add  Order History',
                                                                                          icon: Icon(
                                                                                            Icons.add,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            height: 22.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  color: FlutterFlowTheme.of(context).whtTxtAlways,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            elevation: 3.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(14.0),
                                                                                            hoverColor: FlutterFlowTheme.of(context).inputLineNotFoc,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            final selectedFiles = await selectFiles(
                                                                                              multiFile: true,
                                                                                            );
                                                                                            if (selectedFiles != null) {
                                                                                              safeSetState(() => _model.isDataUploading1 = true);
                                                                                              var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                              var downloadUrls = <String>[];
                                                                                              try {
                                                                                                showUploadMessage(
                                                                                                  context,
                                                                                                  'Uploading file...',
                                                                                                  showLoading: true,
                                                                                                );
                                                                                                selectedUploadedFiles = selectedFiles
                                                                                                    .map((m) => FFUploadedFile(
                                                                                                          name: m.storagePath.split('/').last,
                                                                                                          bytes: m.bytes,
                                                                                                        ))
                                                                                                    .toList();

                                                                                                downloadUrls = (await Future.wait(
                                                                                                  selectedFiles.map(
                                                                                                    (f) async => await uploadData(f.storagePath, f.bytes),
                                                                                                  ),
                                                                                                ))
                                                                                                    .where((u) => u != null)
                                                                                                    .map((u) => u!)
                                                                                                    .toList();
                                                                                              } finally {
                                                                                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                                _model.isDataUploading1 = false;
                                                                                              }
                                                                                              if (selectedUploadedFiles.length == selectedFiles.length && downloadUrls.length == selectedFiles.length) {
                                                                                                safeSetState(() {
                                                                                                  _model.uploadedLocalFiles1 = selectedUploadedFiles;
                                                                                                  _model.uploadedFileUrls1 = downloadUrls;
                                                                                                });
                                                                                                showUploadMessage(
                                                                                                  context,
                                                                                                  'Success!',
                                                                                                );
                                                                                              } else {
                                                                                                safeSetState(() {});
                                                                                                showUploadMessage(
                                                                                                  context,
                                                                                                  'Failed to upload file',
                                                                                                );
                                                                                                return;
                                                                                              }
                                                                                            }

                                                                                            FFAppState().batchid = FFAppState().batchid;
                                                                                            FFAppState().index = 0;
                                                                                            safeSetState(() {});
                                                                                            while (functions.indexChecker(FFAppState().index, _model.uploadedFileUrls2.length)!) {
                                                                                              await CsvRecord.collection.doc().set(createCsvRecordData(
                                                                                                    uploadedTime: getCurrentTimestamp.toString(),
                                                                                                    creator: currentUserReference,
                                                                                                    batchId: FFAppState().batchid,
                                                                                                    fileName: random_data.randomString(
                                                                                                      24,
                                                                                                      32,
                                                                                                      true,
                                                                                                      true,
                                                                                                      true,
                                                                                                    ),
                                                                                                    type: 'ohlc',
                                                                                                    index: FFAppState().index,
                                                                                                  ));
                                                                                              FFAppState().index = FFAppState().index + 1;
                                                                                            }
                                                                                          },
                                                                                          text: 'Add  Candlestick Data',
                                                                                          icon: Icon(
                                                                                            Icons.add,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            height: 22.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  color: FlutterFlowTheme.of(context).whtTxtAlways,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            elevation: 3.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(14.0),
                                                                                            hoverColor: FlutterFlowTheme.of(context).inputLineNotFoc,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            final selectedFiles = await selectFiles(
                                                                                              multiFile: true,
                                                                                            );
                                                                                            if (selectedFiles != null) {
                                                                                              safeSetState(() => _model.isDataUploading2 = true);
                                                                                              var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                              var downloadUrls = <String>[];
                                                                                              try {
                                                                                                showUploadMessage(
                                                                                                  context,
                                                                                                  'Uploading file...',
                                                                                                  showLoading: true,
                                                                                                );
                                                                                                selectedUploadedFiles = selectedFiles
                                                                                                    .map((m) => FFUploadedFile(
                                                                                                          name: m.storagePath.split('/').last,
                                                                                                          bytes: m.bytes,
                                                                                                        ))
                                                                                                    .toList();

                                                                                                downloadUrls = (await Future.wait(
                                                                                                  selectedFiles.map(
                                                                                                    (f) async => await uploadData(f.storagePath, f.bytes),
                                                                                                  ),
                                                                                                ))
                                                                                                    .where((u) => u != null)
                                                                                                    .map((u) => u!)
                                                                                                    .toList();
                                                                                              } finally {
                                                                                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                                _model.isDataUploading2 = false;
                                                                                              }
                                                                                              if (selectedUploadedFiles.length == selectedFiles.length && downloadUrls.length == selectedFiles.length) {
                                                                                                safeSetState(() {
                                                                                                  _model.uploadedLocalFiles2 = selectedUploadedFiles;
                                                                                                  _model.uploadedFileUrls2 = downloadUrls;
                                                                                                });
                                                                                                showUploadMessage(
                                                                                                  context,
                                                                                                  'Success!',
                                                                                                );
                                                                                              } else {
                                                                                                safeSetState(() {});
                                                                                                showUploadMessage(
                                                                                                  context,
                                                                                                  'Failed to upload file',
                                                                                                );
                                                                                                return;
                                                                                              }
                                                                                            }

                                                                                            FFAppState().batchid = FFAppState().batchid;
                                                                                            FFAppState().index = 0;
                                                                                            safeSetState(() {});
                                                                                            while (functions.indexChecker(FFAppState().index, _model.uploadedFileUrls2.length)!) {
                                                                                              await CsvRecord.collection.doc().set(createCsvRecordData(
                                                                                                    uploadedTime: getCurrentTimestamp.toString(),
                                                                                                    creator: currentUserReference,
                                                                                                    batchId: FFAppState().batchid,
                                                                                                    fileName: random_data.randomString(
                                                                                                      24,
                                                                                                      32,
                                                                                                      true,
                                                                                                      true,
                                                                                                      true,
                                                                                                    ),
                                                                                                    type: 'orders',
                                                                                                    index: FFAppState().index,
                                                                                                  ));
                                                                                              FFAppState().index = FFAppState().index + 1;
                                                                                            }
                                                                                          },
                                                                                          text: 'New Batch',
                                                                                          icon: Icon(
                                                                                            Icons.refresh_outlined,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            height: 22.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  color: FlutterFlowTheme.of(context).whtTxtAlways,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            elevation: 3.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(14.0),
                                                                                            hoverColor: FlutterFlowTheme.of(context).inputLineNotFoc,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          StreamBuilder<
                                                                              List<CsvRecord>>(
                                                                            stream:
                                                                                queryCsvRecord(
                                                                              queryBuilder: (csvRecord) => csvRecord
                                                                                  .where(
                                                                                    'batch_id',
                                                                                    isEqualTo: FFAppState().batchid,
                                                                                  )
                                                                                  .orderBy('index', descending: true),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<CsvRecord> listViewCsvRecordList = snapshot.data!;

                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                primary: false,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: listViewCsvRecordList.length,
                                                                                itemBuilder: (context, listViewIndex) {
                                                                                  final listViewCsvRecord = listViewCsvRecordList[listViewIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      height: 110.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 0.0,
                                                                                            color: Color(0xFFE0E3E7),
                                                                                            offset: Offset(
                                                                                              0.0,
                                                                                              1.0,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 16.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 100.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/csv_9496416.png',
                                                                                                  width: 300.0,
                                                                                                  height: 200.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Flexible(
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Title:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listViewCsvRecord.fileName,
                                                                                                      'def variable',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Flexible(
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Creator:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listViewCsvRecord.creator?.id,
                                                                                                      'def',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Flexible(
                                                                                              child: SingleChildScrollView(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Batch ID',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        listViewCsvRecord.batchId,
                                                                                                        'def',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Flexible(
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Upload Time:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listViewCsvRecord.uploadedTime,
                                                                                                      'unspecified',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                Container(
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0x4D39D2C0),
                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                  ),
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'Uploaded',
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                                            color: Color(0xFF39D2C0),
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    if (FFAppState().BoolShowOrderPanel == false)
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 10.0, 0.0, 0.0),
                                              child: Text(
                                                'Order Execution',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          lineHeight: 1.1,
                                                        ),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 4.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Form(
                                                  key: _model.formKey2,
                                                  autovalidateMode:
                                                      AutovalidateMode.always,
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: GetSizeCall.call(
                                                      currBal: FFAppState()
                                                                  .BoolCurrBal ==
                                                              true
                                                          ? FFAppState()
                                                              .currBalManual
                                                          : 0.0,
                                                      dlyBal: FFAppState()
                                                                  .BoolDlyBal ==
                                                              true
                                                          ? FFAppState()
                                                              .dlyBalManual
                                                          : 0.0,
                                                      origBal: FFAppState()
                                                                  .boolOrigBal ==
                                                              true
                                                          ? FFAppState()
                                                              .origBalManual
                                                          : 0.0,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final columnGetSizeResponse =
                                                          snapshot.data!;

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                220.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.textFieldSizeUnitsTextController ??= TextEditingController(
                                                                                text: () {
                                                                                  if (_model.switchManualSizeUnitsValue == true) {
                                                                                    return FFAppState().sizeUnitsManual;
                                                                                  } else if (FFAppState().BoolBalsSet == false) {
                                                                                    return GetSizeCall.szUnits(
                                                                                      columnGetSizeResponse.jsonBody,
                                                                                    );
                                                                                  } else {
                                                                                    return FFAppState().sizeUnits;
                                                                                  }
                                                                                }()
                                                                                    ?.toString(),
                                                                              ),
                                                                              focusNode: _model.textFieldSizeUnitsFocusNode,
                                                                              autofocus: false,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                isDense: true,
                                                                                labelText: 'Size Units',
                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                hintText: '0.00',
                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              keyboardType: TextInputType.number,
                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                              validator: _model.textFieldSizeUnitsTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Auto/Manual',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Switch.adaptive(
                                                                                value: _model.switchManualSizeUnitsValue!,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.switchManualSizeUnitsValue = newValue);
                                                                                  if (newValue) {
                                                                                    FFAppState().sizeUnits = int.parse(_model.textFieldSizeUnitsTextController.text);
                                                                                    FFAppState().BoolSzUnits = true;
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    FFAppState().sizeUnits = FFAppState().sizeUnitsAuto;
                                                                                    FFAppState().BoolSzUnits = false;
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                },
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                activeTrackColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        2.0,
                                                                        8.0,
                                                                        8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          1.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          if (_model.formKey2.currentState == null ||
                                                                              !_model.formKey2.currentState!.validate()) {
                                                                            return;
                                                                          }
                                                                          if (_model.dropDownInstrumentValue ==
                                                                              null) {
                                                                            return;
                                                                          }
                                                                          _model.pgstTagsJsonList = _model
                                                                              .checkboxCheckedItems2
                                                                              .toList()
                                                                              .cast<dynamic>();
                                                                          _model.twUserInputStr =
                                                                              () {
                                                                            if (_model.radioButtonOrderTypeValue ==
                                                                                FFAppConstants.strMarket) {
                                                                              return 'mobuy';
                                                                            } else if (_model.radioButtonOrderTypeValue == FFAppConstants.strStop) {
                                                                              return 'sobuy';
                                                                            } else if (_model.radioButtonOrderTypeValue == FFAppConstants.strLimit) {
                                                                              return 'lobuy';
                                                                            } else {
                                                                              return 'mobuy';
                                                                            }
                                                                          }();
                                                                          safeSetState(
                                                                              () {});
                                                                          _model.apiResultBUY =
                                                                              await PlaceOrderAndDataAnalysisCall.call(
                                                                            username:
                                                                                currentUserUid,
                                                                            intent:
                                                                                'post',
                                                                            phase:
                                                                                'trade',
                                                                            ohlcCsvNowJsonJson:
                                                                                _model.ohlcNowJson,
                                                                            ordersCsvNowJsonJson:
                                                                                _model.ordersNowJson,
                                                                            userInputStr:
                                                                                _model.twUserInputStr,
                                                                            userInputJsonListJson:
                                                                                _model.pgstTagsJsonList,
                                                                            challStartAcctBal:
                                                                                double.tryParse(_model.manOrigChallBalTextController.text),
                                                                            mornAcctBal:
                                                                                double.tryParse(_model.mornAcctBalTextController.text),
                                                                            currAcctBal:
                                                                                double.tryParse(_model.textFieldCurrAcctBalTextController.text),
                                                                            maxRiskPercCap:
                                                                                double.tryParse(_model.textFieldMaxRiskTextController.text),
                                                                            brokCommFee:
                                                                                double.tryParse(_model.textFieldCommFeeTextController.text),
                                                                            brokSpreadFee:
                                                                                double.tryParse(_model.textFieldSpreaFeeTextController.text),
                                                                            accountAggressionLevel:
                                                                                _model.aggSliderValue,
                                                                            selectedBroker:
                                                                                _model.radioButtonBrokerValue,
                                                                          );

                                                                          if ((_model.apiResultBUY?.succeeded ??
                                                                              true)) {
                                                                            _model.pgstReturnedJSON =
                                                                                (_model.apiResultBUY?.jsonBody ?? '');
                                                                            safeSetState(() {});
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        text:
                                                                            'BUY',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.4,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).success,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          elevation:
                                                                              1.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xA7096843),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(6.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Opacity(
                                                                  opacity: 0.0,
                                                                  child:
                                                                      VerticalDivider(
                                                                    width: 0.0,
                                                                    thickness:
                                                                        1.0,
                                                                    color: Colors
                                                                        .transparent,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          1.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          if (_model.formKey2.currentState == null ||
                                                                              !_model.formKey2.currentState!.validate()) {
                                                                            return;
                                                                          }
                                                                          if (_model.dropDownInstrumentValue ==
                                                                              null) {
                                                                            return;
                                                                          }
                                                                          _model.pgstTagsJsonList = _model
                                                                              .checkboxCheckedItems2
                                                                              .toList()
                                                                              .cast<dynamic>();
                                                                          _model.twUserInputStr =
                                                                              () {
                                                                            if (_model.radioButtonOrderTypeValue ==
                                                                                FFAppConstants.strMarket) {
                                                                              return 'mosell';
                                                                            } else if (_model.radioButtonOrderTypeValue == FFAppConstants.strStop) {
                                                                              return 'sosell';
                                                                            } else if (_model.radioButtonOrderTypeValue == FFAppConstants.strLimit) {
                                                                              return 'losell';
                                                                            } else {
                                                                              return 'mosell';
                                                                            }
                                                                          }();
                                                                          safeSetState(
                                                                              () {});
                                                                          _model.apiResultSell =
                                                                              await PlaceOrderAndDataAnalysisCall.call(
                                                                            username:
                                                                                currentUserUid,
                                                                            intent:
                                                                                'post',
                                                                            phase:
                                                                                'trade',
                                                                            ohlcCsvNowJsonJson:
                                                                                _model.ohlcNowJson,
                                                                            ordersCsvNowJsonJson:
                                                                                _model.ordersNowJson,
                                                                            userInputStr:
                                                                                _model.twUserInputStr,
                                                                            userInputJsonListJson:
                                                                                _model.pgstTagsJsonList,
                                                                            challStartAcctBal:
                                                                                double.tryParse(_model.manOrigChallBalTextController.text),
                                                                            mornAcctBal:
                                                                                double.tryParse(_model.mornAcctBalTextController.text),
                                                                            currAcctBal:
                                                                                double.tryParse(_model.textFieldCurrAcctBalTextController.text),
                                                                            maxRiskPercCap:
                                                                                double.tryParse(_model.textFieldMaxRiskTextController.text),
                                                                            brokCommFee:
                                                                                double.tryParse(_model.textFieldCommFeeTextController.text),
                                                                            brokSpreadFee:
                                                                                double.tryParse(_model.textFieldSpreaFeeTextController.text),
                                                                            accountAggressionLevel:
                                                                                _model.aggSliderValue,
                                                                            selectedBroker:
                                                                                _model.radioButtonBrokerValue,
                                                                          );

                                                                          if ((_model.apiResultSell?.succeeded ??
                                                                              true)) {
                                                                            _model.pgstReturnedJSON =
                                                                                (_model.apiResultSell?.jsonBody ?? '');
                                                                            safeSetState(() {});
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        text:
                                                                            'Sell',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          elevation:
                                                                              1.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xB2B90C17),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(6.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (FFAppState()
                                                                  .BoolSzUnits ==
                                                              false)
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          2.0,
                                                                          5.0,
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Set Balance Info',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          _model.actionOutputValidateFormSetButton =
                                                                              true;
                                                                          if (_model.formKey2.currentState == null ||
                                                                              !_model.formKey2.currentState!.validate()) {
                                                                            safeSetState(() =>
                                                                                _model.actionOutputValidateFormSetButton = false);
                                                                            return;
                                                                          }
                                                                          if (_model.dropDownInstrumentValue ==
                                                                              null) {
                                                                            _model.actionOutputValidateFormSetButton =
                                                                                false;
                                                                            safeSetState(() {});
                                                                            return;
                                                                          }
                                                                          _model.apiResultGetSizeSetButton =
                                                                              await GetSizeCall.call(
                                                                            currBal: FFAppState().BoolCurrBal == true
                                                                                ? double.tryParse(_model.textFieldCurrbalTextController.text)
                                                                                : 0.0,
                                                                            dlyBal: FFAppState().BoolDlyBal == true
                                                                                ? double.tryParse(_model.textFieldDlybalTextController.text)
                                                                                : 0.0,
                                                                            origBal: FFAppState().boolOrigBal == true
                                                                                ? double.tryParse(_model.textFieldOrigbalTextController.text)
                                                                                : 0.0,
                                                                          );

                                                                          if ((_model.apiResultGetSizeSetButton?.succeeded ??
                                                                              true)) {
                                                                            FFAppState().OrderSettingsJson =
                                                                                getJsonField(
                                                                              (_model.apiResultGetSizeSetButton?.jsonBody ?? ''),
                                                                              r'''$''',
                                                                            );
                                                                            FFAppState().currBal =
                                                                                GetSizeCall.currBal(
                                                                              (_model.apiResultGetSizeSetButton?.jsonBody ?? ''),
                                                                            )!;
                                                                            FFAppState().dlyBal =
                                                                                GetSizeCall.dlyBal(
                                                                              (_model.apiResultGetSizeSetButton?.jsonBody ?? ''),
                                                                            )!;
                                                                            FFAppState().origBal =
                                                                                GetSizeCall.origBal(
                                                                              (_model.apiResultGetSizeSetButton?.jsonBody ?? ''),
                                                                            )!;
                                                                            FFAppState().sizeUnits =
                                                                                GetSizeCall.szUnits(
                                                                              (_model.apiResultGetSizeSetButton?.jsonBody ?? ''),
                                                                            )!;
                                                                            safeSetState(() {});
                                                                            safeSetState(() {
                                                                              _model.textFieldSizeUnitsTextController?.text = (_model.switchManualSizeUnitsValue == true
                                                                                      ? FFAppState().sizeUnitsManual
                                                                                      : GetSizeCall.szUnits(
                                                                                          (_model.apiResultGetSizeSetButton?.jsonBody ?? ''),
                                                                                        )!)
                                                                                  .toString();
                                                                            });
                                                                            safeSetState(() {
                                                                              _model.textFieldCurrbalTextController?.text = FFAppState().currBal.toString();
                                                                            });
                                                                            safeSetState(() {
                                                                              _model.textFieldDlybalTextController?.text = FFAppState().dlyBal.toString();
                                                                            });
                                                                            safeSetState(() {
                                                                              _model.textFieldOrigbalTextController?.text = FFAppState().origBal.toString();
                                                                            });
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        text:
                                                                            'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              20.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              2.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).purpCircBorder,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                color: Colors.white,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(24.0),
                                                                          hoverColor:
                                                                              FlutterFlowTheme.of(context).inputLineNotFoc,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 220.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.textFieldCurrbalTextController ??= TextEditingController(
                                                                                        text: GetSizeCall.currBal(
                                                                                          columnGetSizeResponse.jsonBody,
                                                                                        )?.toString(),
                                                                                      ),
                                                                                      focusNode: _model.textFieldCurrbalFocusNode,
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      readOnly: FFAppState().BoolCurrBal == false,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelText: 'Current Balance',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: '0.00',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            color: FlutterFlowTheme.of(context).blkOrWht,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      textAlign: TextAlign.start,
                                                                                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      validator: _model.textFieldCurrbalTextControllerValidator.asValidator(context),
                                                                                      inputFormatters: [
                                                                                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Switch.adaptive(
                                                                                      value: _model.switchManualCurrBalValue!,
                                                                                      onChanged: (newValue) async {
                                                                                        safeSetState(() => _model.switchManualCurrBalValue = newValue);
                                                                                        if (newValue) {
                                                                                          FFAppState().BoolCurrBal = true;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          FFAppState().BoolCurrBal = false;
                                                                                          safeSetState(() {});
                                                                                          _model.actionOutputValidateFormCurrBalSwitch = true;
                                                                                          if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                            safeSetState(() => _model.actionOutputValidateFormCurrBalSwitch = false);
                                                                                            return;
                                                                                          }
                                                                                          if (_model.dropDownInstrumentValue == null) {
                                                                                            _model.actionOutputValidateFormCurrBalSwitch = false;
                                                                                            safeSetState(() {});
                                                                                            return;
                                                                                          }
                                                                                          _model.apiResultGetSizeSetCurrBal = await GetSizeCall.call(
                                                                                            currBal: FFAppState().BoolCurrBal == true ? double.tryParse(_model.textFieldCurrbalTextController.text) : 0.0,
                                                                                            dlyBal: FFAppState().BoolDlyBal == true ? double.tryParse(_model.textFieldDlybalTextController.text) : 0.0,
                                                                                            origBal: FFAppState().boolOrigBal == true ? double.tryParse(_model.textFieldOrigbalTextController.text) : 0.0,
                                                                                          );

                                                                                          if ((_model.apiResultGetSizeSetCurrBal?.succeeded ?? true)) {
                                                                                            FFAppState().OrderSettingsJson = (_model.apiResultGetSizeSetCurrBal?.jsonBody ?? '');
                                                                                            FFAppState().currBal = GetSizeCall.currBal(
                                                                                              (_model.apiResultGetSizeSetCurrBal?.jsonBody ?? ''),
                                                                                            )!;
                                                                                            FFAppState().dlyBal = GetSizeCall.dlyBal(
                                                                                              (_model.apiResultGetSizeSetCurrBal?.jsonBody ?? ''),
                                                                                            )!;
                                                                                            FFAppState().origBal = GetSizeCall.origBal(
                                                                                              (_model.apiResultGetSizeSetCurrBal?.jsonBody ?? ''),
                                                                                            )!;
                                                                                            FFAppState().sizeUnits = GetSizeCall.szUnits(
                                                                                              (_model.apiResultGetSizeSetCurrBal?.jsonBody ?? ''),
                                                                                            )!;
                                                                                            safeSetState(() {});
                                                                                            safeSetState(() {
                                                                                              _model.textFieldSizeUnitsTextController?.text = (_model.switchManualSizeUnitsValue == true
                                                                                                      ? FFAppState().sizeUnitsManual
                                                                                                      : GetSizeCall.szUnits(
                                                                                                          (_model.apiResultGetSizeSetCurrBal?.jsonBody ?? ''),
                                                                                                        )!)
                                                                                                  .toString();
                                                                                            });
                                                                                            safeSetState(() {
                                                                                              _model.textFieldCurrbalTextController?.text = FFAppState().currBal.toString();
                                                                                            });
                                                                                            safeSetState(() {
                                                                                              _model.textFieldDlybalTextController?.text = FFAppState().dlyBal.toString();
                                                                                            });
                                                                                            safeSetState(() {
                                                                                              _model.textFieldOrigbalTextController?.text = FFAppState().origBal.toString();
                                                                                            });
                                                                                          }

                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      activeColor: FlutterFlowTheme.of(context).primary,
                                                                                      activeTrackColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                  child: Container(
                                                                                    width: 220.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.textFieldDlybalTextController ??= TextEditingController(
                                                                                        text: GetSizeCall.dlyBal(
                                                                                          columnGetSizeResponse.jsonBody,
                                                                                        )?.toString(),
                                                                                      ),
                                                                                      focusNode: _model.textFieldDlybalFocusNode,
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      readOnly: FFAppState().BoolDlyBal == false,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelText: 'Morning Balance',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: '0.00',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            color: FlutterFlowTheme.of(context).blkOrWht,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      validator: _model.textFieldDlybalTextControllerValidator.asValidator(context),
                                                                                      inputFormatters: [
                                                                                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Switch.adaptive(
                                                                                  value: _model.switchManualDlyBalValue!,
                                                                                  onChanged: (newValue) async {
                                                                                    safeSetState(() => _model.switchManualDlyBalValue = newValue);
                                                                                    if (newValue) {
                                                                                      FFAppState().BoolDlyBal = true;
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      FFAppState().BoolDlyBal = false;
                                                                                      safeSetState(() {});
                                                                                      _model.actionOutputValidateFormDlyBalSwitch = true;
                                                                                      if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                        safeSetState(() => _model.actionOutputValidateFormDlyBalSwitch = false);
                                                                                        return;
                                                                                      }
                                                                                      if (_model.dropDownInstrumentValue == null) {
                                                                                        _model.actionOutputValidateFormDlyBalSwitch = false;
                                                                                        safeSetState(() {});
                                                                                        return;
                                                                                      }
                                                                                      _model.apiResultGetSizeSetDlyBal = await GetSizeCall.call(
                                                                                        currBal: FFAppState().BoolCurrBal == true ? double.tryParse(_model.textFieldCurrbalTextController.text) : 0.0,
                                                                                        dlyBal: FFAppState().BoolDlyBal == true ? double.tryParse(_model.textFieldDlybalTextController.text) : 0.0,
                                                                                        origBal: FFAppState().boolOrigBal == true ? double.tryParse(_model.textFieldOrigbalTextController.text) : 0.0,
                                                                                      );

                                                                                      if ((_model.apiResultGetSizeSetDlyBal?.succeeded ?? true)) {
                                                                                        FFAppState().OrderSettingsJson = getJsonField(
                                                                                          (_model.apiResultGetSizeSetDlyBal?.jsonBody ?? ''),
                                                                                          r'''$''',
                                                                                        );
                                                                                        FFAppState().currBal = GetSizeCall.currBal(
                                                                                          (_model.apiResultGetSizeSetDlyBal?.jsonBody ?? ''),
                                                                                        )!;
                                                                                        FFAppState().dlyBal = GetSizeCall.dlyBal(
                                                                                          (_model.apiResultGetSizeSetDlyBal?.jsonBody ?? ''),
                                                                                        )!;
                                                                                        FFAppState().origBal = GetSizeCall.dlyBal(
                                                                                          (_model.apiResultGetSizeSetDlyBal?.jsonBody ?? ''),
                                                                                        )!;
                                                                                        FFAppState().sizeUnits = GetSizeCall.szUnits(
                                                                                          (_model.apiResultGetSizeSetDlyBal?.jsonBody ?? ''),
                                                                                        )!;
                                                                                        safeSetState(() {});
                                                                                        safeSetState(() {
                                                                                          _model.textFieldSizeUnitsTextController?.text = (_model.switchManualSizeUnitsValue == true
                                                                                                  ? FFAppState().sizeUnitsManual
                                                                                                  : GetSizeCall.szUnits(
                                                                                                      (_model.apiResultGetSizeSetDlyBal?.jsonBody ?? ''),
                                                                                                    )!)
                                                                                              .toString();
                                                                                        });
                                                                                        safeSetState(() {
                                                                                          _model.textFieldCurrbalTextController?.text = FFAppState().currBal.toString();
                                                                                        });
                                                                                        safeSetState(() {
                                                                                          _model.textFieldDlybalTextController?.text = FFAppState().dlyBal.toString();
                                                                                        });
                                                                                        safeSetState(() {
                                                                                          _model.textFieldOrigbalTextController?.text = FFAppState().origBal.toString();
                                                                                        });
                                                                                      }

                                                                                      safeSetState(() {});
                                                                                    }
                                                                                  },
                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                  inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                  inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                  child: Container(
                                                                                    width: 220.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.textFieldOrigbalTextController ??= TextEditingController(
                                                                                        text: GetSizeCall.origBal(
                                                                                          columnGetSizeResponse.jsonBody,
                                                                                        )?.toString(),
                                                                                      ),
                                                                                      focusNode: _model.textFieldOrigbalFocusNode,
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      readOnly: FFAppState().boolOrigBal == false,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelText: 'Original Balance',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: '0.00',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            color: FlutterFlowTheme.of(context).blkOrWht,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      validator: _model.textFieldOrigbalTextControllerValidator.asValidator(context),
                                                                                      inputFormatters: [
                                                                                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Switch.adaptive(
                                                                                  value: _model.switchManualOrigBalValue!,
                                                                                  onChanged: (newValue) async {
                                                                                    safeSetState(() => _model.switchManualOrigBalValue = newValue);
                                                                                    if (newValue) {
                                                                                      FFAppState().boolOrigBal = true;
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      FFAppState().boolOrigBal = false;
                                                                                      safeSetState(() {});
                                                                                      _model.actionOutputValidateFormOrigBalSwitch = true;
                                                                                      if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                        safeSetState(() => _model.actionOutputValidateFormOrigBalSwitch = false);
                                                                                        return;
                                                                                      }
                                                                                      if (_model.dropDownInstrumentValue == null) {
                                                                                        _model.actionOutputValidateFormOrigBalSwitch = false;
                                                                                        safeSetState(() {});
                                                                                        return;
                                                                                      }
                                                                                      _model.apiResultGetSizeSetOrigBal = await GetSizeCall.call(
                                                                                        currBal: FFAppState().BoolCurrBal == true ? double.tryParse(_model.textFieldCurrbalTextController.text) : 0.0,
                                                                                        dlyBal: FFAppState().BoolDlyBal == true ? double.tryParse(_model.textFieldDlybalTextController.text) : 0.0,
                                                                                        origBal: FFAppState().boolOrigBal == true ? double.tryParse(_model.textFieldOrigbalTextController.text) : 0.0,
                                                                                      );

                                                                                      if ((_model.apiResultGetSizeSetOrigBal?.succeeded ?? true)) {
                                                                                        FFAppState().OrderSettingsJson = getJsonField(
                                                                                          (_model.apiResultGetSizeSetOrigBal?.jsonBody ?? ''),
                                                                                          r'''$''',
                                                                                        );
                                                                                        FFAppState().currBal = GetSizeCall.currBal(
                                                                                          (_model.apiResultGetSizeSetOrigBal?.jsonBody ?? ''),
                                                                                        )!;
                                                                                        FFAppState().dlyBal = GetSizeCall.dlyBal(
                                                                                          (_model.apiResultGetSizeSetOrigBal?.jsonBody ?? ''),
                                                                                        )!;
                                                                                        FFAppState().origBal = GetSizeCall.origBal(
                                                                                          (_model.apiResultGetSizeSetOrigBal?.jsonBody ?? ''),
                                                                                        )!;
                                                                                        FFAppState().sizeUnits = GetSizeCall.szUnits(
                                                                                          (_model.apiResultGetSizeSetOrigBal?.jsonBody ?? ''),
                                                                                        )!;
                                                                                        safeSetState(() {});
                                                                                        safeSetState(() {
                                                                                          _model.textFieldSizeUnitsTextController?.text = (_model.switchManualSizeUnitsValue == true
                                                                                                  ? FFAppState().sizeUnitsManual
                                                                                                  : GetSizeCall.szUnits(
                                                                                                      (_model.apiResultGetSizeSetOrigBal?.jsonBody ?? ''),
                                                                                                    )!)
                                                                                              .toString();
                                                                                        });
                                                                                        safeSetState(() {
                                                                                          _model.textFieldCurrbalTextController?.text = FFAppState().currBal.toString();
                                                                                        });
                                                                                        safeSetState(() {
                                                                                          _model.textFieldDlybalTextController?.text = FFAppState().dlyBal.toString();
                                                                                        });
                                                                                        safeSetState(() {
                                                                                          _model.textFieldOrigbalTextController?.text = FFAppState().origBal.toString();
                                                                                        });
                                                                                      }

                                                                                      safeSetState(() {});
                                                                                    }
                                                                                  },
                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                  inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                  inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          ExpandableNotifier(
                                                                        controller:
                                                                            _model.expandableExpandableController1,
                                                                        child:
                                                                            ExpandablePanel(
                                                                          header:
                                                                              Text(
                                                                            'Show More Settings',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                          ),
                                                                          collapsed:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          expanded:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.stretch,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Instrument:',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(),
                                                                                          ),
                                                                                          FlutterFlowDropDown<String>(
                                                                                            controller: _model.dropDownInstrumentValueController ??= FormFieldController<String>(
                                                                                              _model.dropDownInstrumentValue ??= 'EURUSD',
                                                                                            ),
                                                                                            options: FFAppState().instruments,
                                                                                            onChanged: (val) => safeSetState(() => _model.dropDownInstrumentValue = val),
                                                                                            width: 130.0,
                                                                                            height: 40.0,
                                                                                            searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            hintText: 'Select...',
                                                                                            searchHintText: 'Search...',
                                                                                            icon: Icon(
                                                                                              Icons.keyboard_arrow_down_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 2.0,
                                                                                            borderColor: Colors.transparent,
                                                                                            borderWidth: 0.0,
                                                                                            borderRadius: 8.0,
                                                                                            margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                            hidesUnderline: true,
                                                                                            isOverButton: false,
                                                                                            isSearchable: true,
                                                                                            isMultiSelect: false,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Switch.adaptive(
                                                                                              value: _model.switchManualInstrumentValue!,
                                                                                              onChanged: (newValue) async {
                                                                                                safeSetState(() => _model.switchManualInstrumentValue = newValue);
                                                                                              },
                                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                                              activeTrackColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                              inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                              inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 5.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Broker:',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          FlutterFlowRadioButton(
                                                                                            options: [
                                                                                              'Dx',
                                                                                              'Oanda',
                                                                                              'None'
                                                                                            ].toList(),
                                                                                            onChanged: (val) => safeSetState(() {}),
                                                                                            controller: _model.radioButtonBrokerValueController ??= FormFieldController<String>('Oanda'),
                                                                                            optionHeight: 30.0,
                                                                                            textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            buttonPosition: RadioButtonPosition.left,
                                                                                            direction: Axis.horizontal,
                                                                                            radioButtonColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                            inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            toggleable: false,
                                                                                            horizontalAlignment: WrapAlignment.start,
                                                                                            verticalAlignment: WrapCrossAlignment.start,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Switch.adaptive(
                                                                                              value: _model.switchManualBrokerValue!,
                                                                                              onChanged: (newValue) async {
                                                                                                safeSetState(() => _model.switchManualBrokerValue = newValue);
                                                                                              },
                                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                                              activeTrackColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                              inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                              inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 5.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Type:',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                        FlutterFlowRadioButton(
                                                                                          options: [
                                                                                            'Market',
                                                                                            'Stop',
                                                                                            'Limit'
                                                                                          ].toList(),
                                                                                          onChanged: (val) => safeSetState(() {}),
                                                                                          controller: _model.radioButtonOrderTypeValueController ??= FormFieldController<String>('Market'),
                                                                                          optionHeight: 30.0,
                                                                                          textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          buttonPosition: RadioButtonPosition.left,
                                                                                          direction: Axis.horizontal,
                                                                                          radioButtonColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                          inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          toggleable: false,
                                                                                          horizontalAlignment: WrapAlignment.start,
                                                                                          verticalAlignment: WrapCrossAlignment.start,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: Switch.adaptive(
                                                                                            value: _model.switchManualTypeValue!,
                                                                                            onChanged: (newValue) async {
                                                                                              safeSetState(() => _model.switchManualTypeValue = newValue);
                                                                                            },
                                                                                            activeColor: FlutterFlowTheme.of(context).primary,
                                                                                            activeTrackColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                            inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                            inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Divider(
                                                                                thickness: 1.0,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          theme:
                                                                              ExpandableThemeData(
                                                                            tapHeaderToExpand:
                                                                                true,
                                                                            tapBodyToExpand:
                                                                                false,
                                                                            tapBodyToCollapse:
                                                                                false,
                                                                            headerAlignment:
                                                                                ExpandablePanelHeaderAlignment.center,
                                                                            hasIcon:
                                                                                true,
                                                                            expandIcon:
                                                                                Icons.keyboard_arrow_left,
                                                                            collapseIcon:
                                                                                Icons.keyboard_arrow_down,
                                                                            iconColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          ExpandableNotifier(
                                                                        controller:
                                                                            _model.expandableExpandableController2,
                                                                        child:
                                                                            ExpandablePanel(
                                                                          header:
                                                                              Text(
                                                                            'Show Math Explaination',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                          ),
                                                                          collapsed:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          expanded:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.stretch,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final mathStr = getJsonField(
                                                                                    FFAppState().OrderSettingsJson,
                                                                                    r'''$.body.math_ls_str''',
                                                                                  ).toList();

                                                                                  return ListView.builder(
                                                                                    padding: EdgeInsets.zero,
                                                                                    shrinkWrap: true,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    itemCount: mathStr.length,
                                                                                    itemBuilder: (context, mathStrIndex) {
                                                                                      final mathStrItem = mathStr[mathStrIndex];
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          SelectionArea(
                                                                                              child: Text(
                                                                                            getJsonField(
                                                                                              mathStrItem,
                                                                                              r'''$''',
                                                                                            ).toString(),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          )),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          theme:
                                                                              ExpandableThemeData(
                                                                            tapHeaderToExpand:
                                                                                true,
                                                                            tapBodyToExpand:
                                                                                false,
                                                                            tapBodyToCollapse:
                                                                                false,
                                                                            headerAlignment:
                                                                                ExpandablePanelHeaderAlignment.center,
                                                                            hasIcon:
                                                                                true,
                                                                            expandIcon:
                                                                                Icons.keyboard_arrow_left,
                                                                            collapseIcon:
                                                                                Icons.keyboard_arrow_down,
                                                                            iconColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          ExpandableNotifier(
                                                                        controller:
                                                                            _model.expandableExpandableController3,
                                                                        child:
                                                                            ExpandablePanel(
                                                                          header:
                                                                              Text(
                                                                            'Show Json',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                          ),
                                                                          collapsed:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          expanded:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.stretch,
                                                                            children: [
                                                                              SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'apiResultGetSize_SetButton (on click):',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          'UNITS: ',
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        )),
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          GetSizeCall.szUnits(
                                                                                            (_model.apiResultGetSizeSetButton?.jsonBody ?? ''),
                                                                                          ).toString(),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                    SelectionArea(
                                                                                        child: Text(
                                                                                      getJsonField(
                                                                                        (_model.apiResultGetSizeSetButton?.jsonBody ?? ''),
                                                                                        r'''$''',
                                                                                      ).toString(),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    )),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Divider(),
                                                                                    Text(
                                                                                      'Get Size Response (Query from Column)',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          'UNITS: ',
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        )),
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          formatNumber(
                                                                                            GetSizeCall.szUnits(
                                                                                              columnGetSizeResponse.jsonBody,
                                                                                            ),
                                                                                            formatType: FormatType.decimal,
                                                                                            decimalType: DecimalType.periodDecimal,
                                                                                          ),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                    SelectionArea(
                                                                                        child: Text(
                                                                                      getJsonField(
                                                                                        columnGetSizeResponse.jsonBody,
                                                                                        r'''$''',
                                                                                      ).toString(),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    )),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          theme:
                                                                              ExpandableThemeData(
                                                                            tapHeaderToExpand:
                                                                                true,
                                                                            tapBodyToExpand:
                                                                                false,
                                                                            tapBodyToCollapse:
                                                                                false,
                                                                            headerAlignment:
                                                                                ExpandablePanelHeaderAlignment.center,
                                                                            hasIcon:
                                                                                true,
                                                                            expandIcon:
                                                                                Icons.keyboard_arrow_left,
                                                                            collapseIcon:
                                                                                Icons.keyboard_arrow_down,
                                                                            iconColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Trade Grade:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                      ),
                                                                      Slider(
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).purpCircBorder,
                                                                        inactiveColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        min:
                                                                            1.0,
                                                                        max:
                                                                            5.0,
                                                                        value: _model.sliderValue1 ??=
                                                                            3.0,
                                                                        label: _model
                                                                            .sliderValue1
                                                                            ?.toStringAsFixed(0),
                                                                        divisions:
                                                                            4,
                                                                        onChanged:
                                                                            (newValue) {
                                                                          newValue =
                                                                              double.parse(newValue.toStringAsFixed(0));
                                                                          safeSetState(() =>
                                                                              _model.sliderValue1 = newValue);
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Timing:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                      ),
                                                                      Slider(
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).purpCircBorder,
                                                                        inactiveColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        min:
                                                                            1.0,
                                                                        max:
                                                                            5.0,
                                                                        value: _model.sliderValue2 ??=
                                                                            3.0,
                                                                        label: _model
                                                                            .sliderValue2
                                                                            ?.toStringAsFixed(0),
                                                                        divisions:
                                                                            4,
                                                                        onChanged:
                                                                            (newValue) {
                                                                          newValue =
                                                                              double.parse(newValue.toStringAsFixed(0));
                                                                          safeSetState(() =>
                                                                              _model.sliderValue2 = newValue);
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Auto Sizers',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            5.0,
                                                                            5.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              ListView(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            children: [
                                                                              Wrap(
                                                                                spacing: 0.0,
                                                                                runSpacing: 0.0,
                                                                                alignment: WrapAlignment.start,
                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                direction: Axis.horizontal,
                                                                                runAlignment: WrapAlignment.start,
                                                                                verticalDirection: VerticalDirection.down,
                                                                                clipBehavior: Clip.none,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Theme(
                                                                                        data: ThemeData(
                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                            visualDensity: VisualDensity.compact,
                                                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(1.0),
                                                                                            ),
                                                                                          ),
                                                                                          unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                        ),
                                                                                        child: Checkbox(
                                                                                          value: _model.checkboxValue1 ??= false,
                                                                                          onChanged: (newValue) async {
                                                                                            safeSetState(() => _model.checkboxValue1 = newValue!);
                                                                                          },
                                                                                          side: BorderSide(
                                                                                            width: 2,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          ),
                                                                                          activeColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                          checkColor: FlutterFlowTheme.of(context).info,
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                        child: Text(
                                                                                          'setchild',
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            5.0,
                                                                            5.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Tags:',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Switch.adaptive(
                                                                                value: _model.switchValue1!,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.switchValue1 = newValue);
                                                                                  if (newValue) {
                                                                                    FFAppState().displayTags = true;
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    FFAppState().displayTags = false;
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                },
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                activeTrackColor: FlutterFlowTheme.of(context).purpCircFill,
                                                                                inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Order Logs:',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Switch.adaptive(
                                                                                value: _model.switchValue2!,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.switchValue2 = newValue);
                                                                                  if (newValue) {
                                                                                    FFAppState().displayLogs = true;
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    FFAppState().displayLogs = false;
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                },
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                activeTrackColor: FlutterFlowTheme.of(context).purpCircFill,
                                                                                inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          if (FFAppState()
                                                                  .displayTags ==
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: (_model
                                                                              .apiRequestCompleter ??= Completer<ApiCallResponse>()
                                                                            ..complete(SendInputGetResponseCall.call(
                                                                              username: currentUserUid,
                                                                            )))
                                                                          .future,
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 40.0,
                                                                              height: 40.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).purpCircBorder,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final listViewSendInputGetResponseResponse =
                                                                            snapshot.data!;

                                                                        return Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final eaObj =
                                                                                getJsonField(
                                                                              listViewSendInputGetResponseResponse.jsonBody,
                                                                              r'''$.body.order_tags''',
                                                                            ).toList();

                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: eaObj.length,
                                                                              itemBuilder: (context, eaObjIndex) {
                                                                                final eaObjItem = eaObj[eaObjIndex];
                                                                                return Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                getJsonField(
                                                                                                  eaObjItem,
                                                                                                  r'''$.name''',
                                                                                                ).toString(),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        ListView(
                                                                                          padding: EdgeInsets.zero,
                                                                                          shrinkWrap: true,
                                                                                          scrollDirection: Axis.vertical,
                                                                                          children: [
                                                                                            Builder(
                                                                                              builder: (context) {
                                                                                                final li = getJsonField(
                                                                                                  eaObjItem,
                                                                                                  r'''$.list''',
                                                                                                ).toList();

                                                                                                return Wrap(
                                                                                                  spacing: 0.0,
                                                                                                  runSpacing: 0.0,
                                                                                                  alignment: WrapAlignment.start,
                                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                  direction: Axis.horizontal,
                                                                                                  runAlignment: WrapAlignment.start,
                                                                                                  verticalDirection: VerticalDirection.down,
                                                                                                  clipBehavior: Clip.none,
                                                                                                  children: List.generate(li.length, (liIndex) {
                                                                                                    final liItem = li[liIndex];
                                                                                                    return Row(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Theme(
                                                                                                          data: ThemeData(
                                                                                                            checkboxTheme: CheckboxThemeData(
                                                                                                              visualDensity: VisualDensity.compact,
                                                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                              shape: RoundedRectangleBorder(
                                                                                                                borderRadius: BorderRadius.circular(1.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                            unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          child: Checkbox(
                                                                                                            value: _model.checkboxValueMap2[liItem] ??= false,
                                                                                                            onChanged: (newValue) async {
                                                                                                              safeSetState(() => _model.checkboxValueMap2[liItem] = newValue!);
                                                                                                            },
                                                                                                            side: BorderSide(
                                                                                                              width: 2,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            ),
                                                                                                            activeColor: FlutterFlowTheme.of(context).purpCircBorder,
                                                                                                            checkColor: FlutterFlowTheme.of(context).info,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                          child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              getJsonField(
                                                                                                                liItem,
                                                                                                                r'''$''',
                                                                                                              )?.toString(),
                                                                                                              'def',
                                                                                                            ),
                                                                                                            textAlign: TextAlign.start,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  }),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                                  .displayLogs ==
                                                              true)
                                                            SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        '------START------',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        'ORDER',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            (_model.apiResultSell?.succeeded ?? true) == true
                                                                                ? 'Api Call Sucessful'
                                                                                : 'Api Call Failed',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          if ((_model.apiResultBUY?.statusCode ?? 200) !=
                                                                              200)
                                                                            Text(
                                                                              (_model.apiResultBUY?.succeeded ?? true) == true ? 'Api Call Sucessful' : 'Api Call Failed',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                      SelectionArea(
                                                                          child:
                                                                              Text(
                                                                        (_model.apiResultBUY?.bodyText ??
                                                                            ''),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      )),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            (_model.apiResultBUY?.jsonBody ?? '').toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          )),
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            '----------------',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          )),
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            (_model.apiResultSell?.bodyText ??
                                                                                ''),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          )),
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            (_model.apiResultSell?.jsonBody ?? '').toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          )),
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            (_model.apiResultSell?.jsonBody ?? '').toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          )),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'Logs',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                        fontSize: 18.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final logDict = getJsonField(
                                                                                (_model.apiResultSell?.jsonBody ?? ''),
                                                                                r'''$.logs''',
                                                                              ).toList();

                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: logDict.length,
                                                                                itemBuilder: (context, logDictIndex) {
                                                                                  final logDictItem = logDict[logDictIndex];
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          logDictIndex.toString(),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          final respVal = getJsonField(
                                                                                            logDictItem,
                                                                                            r'''$.*.*''',
                                                                                          ).toList();

                                                                                          return ListView.builder(
                                                                                            padding: EdgeInsets.zero,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: respVal.length,
                                                                                            itemBuilder: (context, respValIndex) {
                                                                                              final respValItem = respVal[respValIndex];
                                                                                              return Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Default',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'Order',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                        fontSize: 18.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final orderRespCat = (_model.apiResultSell?.jsonBody ?? '').toList();

                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: orderRespCat.length,
                                                                                itemBuilder: (context, orderRespCatIndex) {
                                                                                  final orderRespCatItem = orderRespCat[orderRespCatIndex];
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          orderRespCatIndex.toString(),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          final respVal = getJsonField(
                                                                                            orderRespCatItem,
                                                                                            r'''$.*.*''',
                                                                                          ).toList();

                                                                                          return ListView.builder(
                                                                                            padding: EdgeInsets.zero,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: respVal.length,
                                                                                            itemBuilder: (context, respValIndex) {
                                                                                              final respValItem = respVal[respValIndex];
                                                                                              return Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    getJsonField(
                                                                                                      respValItem,
                                                                                                      r'''$.*["initial_change"]''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                '------END------',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: 20.0,
                                                                                  decoration: BoxDecoration(),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          Divider(
                                                            thickness: 2.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
