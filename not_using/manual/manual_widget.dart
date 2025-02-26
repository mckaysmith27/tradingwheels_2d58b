import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/not_using/field_plus_switch/field_plus_switch_widget.dart';
import 'package:flutter/material.dart';
import 'manual_model.dart';
export 'manual_model.dart';

class ManualWidget extends StatefulWidget {
  const ManualWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final bool? parameter1;
  final dynamic parameter2;

  @override
  State<ManualWidget> createState() => _ManualWidgetState();
}

class _ManualWidgetState extends State<ManualWidget> {
  late ManualModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManualModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final manualobj = widget.parameter2?.toList() ?? [];

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: manualobj.length,
          itemBuilder: (context, manualobjIndex) {
            final manualobjItem = manualobj[manualobjIndex];
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Curr.entAcct. Bal.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      safeSetState(() {});
                    },
                    child: FieldPlusSwitchWidget(
                      key: Key(
                          'Keyeb5_${manualobjIndex}_of_${manualobj.length}'),
                      parameter1: widget.parameter1,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
