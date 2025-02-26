import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dark_light_switch_small_v3_model.dart';
export 'dark_light_switch_small_v3_model.dart';

class DarkLightSwitchSmallV3Widget extends StatefulWidget {
  const DarkLightSwitchSmallV3Widget({super.key});

  @override
  State<DarkLightSwitchSmallV3Widget> createState() =>
      _DarkLightSwitchSmallV3WidgetState();
}

class _DarkLightSwitchSmallV3WidgetState
    extends State<DarkLightSwitchSmallV3Widget> with TickerProviderStateMixin {
  late DarkLightSwitchSmallV3Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DarkLightSwitchSmallV3Model());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(-40.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(-40.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if ((Theme.of(context).brightness == Brightness.light) == true) {
              setDarkModeSetting(context, ThemeMode.dark);
              if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
                animationsMap['containerOnActionTriggerAnimation1']!
                    .controller
                    .forward(from: 0.0);
              }
            } else {
              setDarkModeSetting(context, ThemeMode.light);
              if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
                animationsMap['containerOnActionTriggerAnimation1']!
                    .controller
                    .reverse();
              }
            }
          },
          child: Container(
            width: 115.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? FlutterFlowTheme.of(context).secondaryBackground
                  : FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: valueOrDefault<Color>(
                  Theme.of(context).brightness == Brightness.light
                      ? FlutterFlowTheme.of(context).alternate
                      : FlutterFlowTheme.of(context).primaryBackground,
                  FlutterFlowTheme.of(context).alternate,
                ),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.9, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                      child: Icon(
                        Icons.wb_sunny_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                      child: Icon(
                        Icons.mode_night_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Container(
                      width: 36.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x430B0D0F),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                        shape: BoxShape.rectangle,
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation1']!,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if ((Theme.of(context).brightness == Brightness.light) == true) {
              setDarkModeSetting(context, ThemeMode.dark);
              if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
                animationsMap['containerOnActionTriggerAnimation1']!
                    .controller
                    .forward(from: 0.0);
              }
            } else {
              setDarkModeSetting(context, ThemeMode.light);
              if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
                animationsMap['containerOnActionTriggerAnimation1']!
                    .controller
                    .reverse();
              }
            }
          },
          child: Container(
            width: 115.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? FlutterFlowTheme.of(context).secondaryBackground
                  : FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: valueOrDefault<Color>(
                  Theme.of(context).brightness == Brightness.light
                      ? FlutterFlowTheme.of(context).alternate
                      : FlutterFlowTheme.of(context).primaryBackground,
                  FlutterFlowTheme.of(context).alternate,
                ),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.9, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                      child: Icon(
                        Icons.wb_sunny_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                      child: Icon(
                        Icons.mode_night_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Container(
                      width: 36.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x430B0D0F),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                        shape: BoxShape.rectangle,
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation2']!,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
