import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'upload_c_s_vs_model.dart';
export 'upload_c_s_vs_model.dart';

class UploadCSVsWidget extends StatefulWidget {
  const UploadCSVsWidget({super.key});

  @override
  State<UploadCSVsWidget> createState() => _UploadCSVsWidgetState();
}

class _UploadCSVsWidgetState extends State<UploadCSVsWidget> {
  late UploadCSVsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadCSVsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 270.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController ??=
                                FormFieldController<String>(null),
                            options: ['orders', 'ohlc'],
                            onChanged: (val) async {
                              safeSetState(() => _model.dropDownValue = val);
                              FFAppState().type = _model.dropDownValue!;
                              safeSetState(() {});
                            },
                            width: 300.0,
                            height: 56.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Data Type...',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).primaryText,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue ??= true,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.checkboxValue = newValue!);
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          activeColor:
                              FlutterFlowTheme.of(context).purpCircBorder,
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Text(
                        'I agree upload to Terms & Conditions',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FFButtonWidget(
              onPressed: ((_model.checkboxValue == false) ||
                      (_model.dropDownValue == null ||
                          _model.dropDownValue == ''))
                  ? null
                  : () async {
                      final selectedFiles = await selectFiles(
                        multiFile: true,
                      );
                      if (selectedFiles != null) {
                        safeSetState(() => _model.isDataUploading = true);
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
                              (f) async =>
                                  await uploadData(f.storagePath, f.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          _model.isDataUploading = false;
                        }
                        if (selectedUploadedFiles.length ==
                                selectedFiles.length &&
                            downloadUrls.length == selectedFiles.length) {
                          safeSetState(() {
                            _model.uploadedLocalFiles = selectedUploadedFiles;
                            _model.uploadedFileUrls = downloadUrls;
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

                      FFAppState().batchid = getCurrentTimestamp.toString();
                      FFAppState().index = 0;
                      FFAppState().type = _model.dropDownValue!;
                      FFAppState().UploadedCsvTimestampStrs = [];
                      while (functions.indexChecker(FFAppState().index,
                          _model.uploadedFileUrls.length)!) {
                        var csvRecordReference = CsvRecord.collection.doc();
                        await csvRecordReference.set(createCsvRecordData(
                          uploadedTime: getCurrentTimestamp.toString(),
                          creator: currentUserReference,
                          batchId: FFAppState().batchid,
                          fileName: _model.uploadedFileUrls
                              .elementAtOrNull(FFAppState().index),
                          type: FFAppState().type,
                          index: FFAppState().index,
                          quickName: random_data.randomString(
                            5,
                            7,
                            true,
                            true,
                            true,
                          ),
                        ));
                        _model.actionOutput1 = CsvRecord.getDocumentFromData(
                            createCsvRecordData(
                              uploadedTime: getCurrentTimestamp.toString(),
                              creator: currentUserReference,
                              batchId: FFAppState().batchid,
                              fileName: _model.uploadedFileUrls
                                  .elementAtOrNull(FFAppState().index),
                              type: FFAppState().type,
                              index: FFAppState().index,
                              quickName: random_data.randomString(
                                5,
                                7,
                                true,
                                true,
                                true,
                              ),
                            ),
                            csvRecordReference);
                        FFAppState().index = FFAppState().index + 1;
                        FFAppState().addToUploadedCsvTimestampStrs(
                            _model.actionOutput1!.uploadedTime);
                        FFAppState().addToUploadedCsvDocStrs(
                            _model.actionOutput1!.reference.id);
                      }
                      Navigator.pop(context);

                      safeSetState(() {});
                    },
              text: 'Upload File(s)',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Plus Jakarta Sans',
                      letterSpacing: 0.0,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                hoverColor: FlutterFlowTheme.of(context).purpCircBorder,
                hoverTextColor: FlutterFlowTheme.of(context).primaryBackground,
                hoverElevation: 2.0,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Cancel',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
