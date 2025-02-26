import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'upload_c_s_vs_d_a1_model.dart';
export 'upload_c_s_vs_d_a1_model.dart';

class UploadCSVsDA1Widget extends StatefulWidget {
  const UploadCSVsDA1Widget({super.key});

  static String routeName = 'UploadCSVs_DA1';
  static String routePath = '/dataAnalysis1';

  @override
  State<UploadCSVsDA1Widget> createState() => _UploadCSVsDA1WidgetState();
}

class _UploadCSVsDA1WidgetState extends State<UploadCSVsDA1Widget> {
  late UploadCSVsDA1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadCSVsDA1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
