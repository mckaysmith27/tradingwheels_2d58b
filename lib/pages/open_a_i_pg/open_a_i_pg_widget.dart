import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/is_using/message/message_widget.dart';
import '/is_using/upload_c_s_vs/upload_c_s_vs_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'open_a_i_pg_model.dart';
export 'open_a_i_pg_model.dart';

class OpenAIPgWidget extends StatefulWidget {
  const OpenAIPgWidget({super.key});

  static String routeName = 'openAI_pg';
  static String routePath = '/ai_data_analysis';

  @override
  State<OpenAIPgWidget> createState() => _OpenAIPgWidgetState();
}

class _OpenAIPgWidgetState extends State<OpenAIPgWidget> {
  late OpenAIPgModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpenAIPgModel());

    _model.switchValue = false;
    _model.promptFieldTextController ??= TextEditingController();
    _model.promptFieldFocusNode ??= FocusNode();

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Text(
                    'AI Data Analyzer & Manipulator',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ))
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Text(
                    'AI Analyzer',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'show',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                        Text(
                          'data',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Switch.adaptive(
                    value: _model.switchValue!,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.switchValue = newValue);
                      if (newValue) {
                        FFAppState().showColumn = true;
                        safeSetState(() {});
                      } else {
                        FFAppState().showColumn = false;
                        safeSetState(() {});
                      }
                    },
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).inputLineFoc,
                    inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                    inactiveThumbColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                ],
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 840,
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final messageitem =
                                                _model.messages.toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              reverse: true,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: messageitem.length,
                                              itemBuilder:
                                                  (context, messageitemIndex) {
                                                final messageitemItem =
                                                    messageitem[
                                                        messageitemIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: MessageWidget(
                                                    key: Key(
                                                        'Keyaa4_${messageitemIndex}_of_${messageitem.length}'),
                                                    messages: messageitemItem,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 30.0),
                                          child: TextFormField(
                                            controller: _model
                                                .promptFieldTextController,
                                            focusNode:
                                                _model.promptFieldFocusNode,
                                            onFieldSubmitted: (_) async {
                                              if (_model.chatRef != null) {
                                                // DB - Message (User)

                                                var messagesRecordReference1 =
                                                    MessagesRecord.createDoc(
                                                        _model.chatRef!);
                                                await messagesRecordReference1
                                                    .set(
                                                        createMessagesRecordData(
                                                  content: _model
                                                      .promptFieldTextController
                                                      .text,
                                                  role: Role.user,
                                                  created: getCurrentTimestamp,
                                                ));
                                                _model.ongoingChatNewMessage =
                                                    MessagesRecord.getDocumentFromData(
                                                        createMessagesRecordData(
                                                          content: _model
                                                              .promptFieldTextController
                                                              .text,
                                                          role: Role.user,
                                                          created:
                                                              getCurrentTimestamp,
                                                        ),
                                                        messagesRecordReference1);
                                                safeSetState(() {
                                                  _model
                                                      .promptFieldTextController
                                                      ?.clear();
                                                });
                                                _model.ongoingChatUserMessage =
                                                    await queryMessagesRecordOnce(
                                                  parent: _model.chatRef,
                                                  queryBuilder:
                                                      (messagesRecord) =>
                                                          messagesRecord
                                                              .orderBy(
                                                                  'created',
                                                                  descending:
                                                                      true),
                                                );
                                                // UI Update - Messages
                                                _model.messages = _model
                                                    .ongoingChatUserMessage!
                                                    .toList()
                                                    .cast<MessagesRecord>();
                                                safeSetState(() {});
                                                // API Call
                                                _model.ongoingChatResponse =
                                                    await OpenAIAPIGroup
                                                        .createChatCompletionCall
                                                        .call(
                                                  promptJson: functions
                                                      .listMessagesToListJSON(
                                                          _model.messages
                                                              .toList()),
                                                );

                                                if ((_model.ongoingChatResponse
                                                        ?.succeeded ??
                                                    true)) {
                                                  // DB - Message (assistant)

                                                  var messagesRecordReference2 =
                                                      MessagesRecord.createDoc(
                                                          _model.chatRef!);
                                                  await messagesRecordReference2
                                                      .set(
                                                          createMessagesRecordData(
                                                    content:
                                                        valueOrDefault<String>(
                                                      GptResponseStruct
                                                              .maybeFromMap((_model
                                                                      .ongoingChatResponse
                                                                      ?.jsonBody ??
                                                                  ''))
                                                          ?.choices
                                                          .firstOrNull
                                                          ?.message
                                                          .content,
                                                      'message',
                                                    ),
                                                    role: Role.assistant,
                                                    created:
                                                        getCurrentTimestamp,
                                                  ));
                                                  _model.ongoingChatAssistantDoc =
                                                      MessagesRecord
                                                          .getDocumentFromData(
                                                              createMessagesRecordData(
                                                                content:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  GptResponseStruct.maybeFromMap(
                                                                          (_model.ongoingChatResponse?.jsonBody ??
                                                                              ''))
                                                                      ?.choices
                                                                      .firstOrNull
                                                                      ?.message
                                                                      .content,
                                                                  'message',
                                                                ),
                                                                role: Role
                                                                    .assistant,
                                                                created:
                                                                    getCurrentTimestamp,
                                                              ),
                                                              messagesRecordReference2);
                                                  // DB - Collection (Messages)
                                                  _model.ongoingChatAllMessages =
                                                      await queryMessagesRecordOnce(
                                                    parent: _model.chatRef,
                                                    queryBuilder:
                                                        (messagesRecord) =>
                                                            messagesRecord
                                                                .orderBy(
                                                                    'created',
                                                                    descending:
                                                                        true),
                                                  );
                                                  // UI Update (Messages)
                                                  _model.messages = _model
                                                      .ongoingChatAllMessages!
                                                      .toList()
                                                      .cast<MessagesRecord>();
                                                  safeSetState(() {});
                                                }
                                              } else {
                                                // DB - ChatDoc Creation

                                                var chatsRecordReference =
                                                    ChatsRecord.collection
                                                        .doc();
                                                await chatsRecordReference
                                                    .set(createChatsRecordData(
                                                  uid: currentUserReference,
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                ));
                                                _model.newChatDoc = ChatsRecord
                                                    .getDocumentFromData(
                                                        createChatsRecordData(
                                                          uid:
                                                              currentUserReference,
                                                          timestamp:
                                                              getCurrentTimestamp,
                                                        ),
                                                        chatsRecordReference);
                                                // State - ChatDoc
                                                _model.chatRef = _model
                                                    .newChatDoc?.reference;
                                                // DB - Message (User)

                                                var messagesRecordReference3 =
                                                    MessagesRecord.createDoc(
                                                        _model.chatRef!);
                                                await messagesRecordReference3
                                                    .set(
                                                        createMessagesRecordData(
                                                  content: _model
                                                      .promptFieldTextController
                                                      .text,
                                                  role: Role.user,
                                                  created: getCurrentTimestamp,
                                                ));
                                                _model.newChatNewMessage =
                                                    MessagesRecord.getDocumentFromData(
                                                        createMessagesRecordData(
                                                          content: _model
                                                              .promptFieldTextController
                                                              .text,
                                                          role: Role.user,
                                                          created:
                                                              getCurrentTimestamp,
                                                        ),
                                                        messagesRecordReference3);
                                                safeSetState(() {
                                                  _model
                                                      .promptFieldTextController
                                                      ?.clear();
                                                });
                                                // UI Update - Messages
                                                _model.addToMessages(
                                                    _model.newChatNewMessage!);
                                                safeSetState(() {});
                                                // API Call
                                                _model.newChatResponse =
                                                    await OpenAIAPIGroup
                                                        .createChatCompletionCall
                                                        .call(
                                                  promptJson: functions
                                                      .listMessagesToListJSON(
                                                          _model.messages
                                                              .toList()),
                                                );

                                                if ((_model.newChatResponse
                                                        ?.succeeded ??
                                                    true)) {
                                                  // DB - Message (assistant)

                                                  var messagesRecordReference4 =
                                                      MessagesRecord.createDoc(
                                                          _model.chatRef!);
                                                  await messagesRecordReference4
                                                      .set(
                                                          createMessagesRecordData(
                                                    content: GptResponseStruct
                                                            .maybeFromMap((_model
                                                                    .newChatResponse
                                                                    ?.jsonBody ??
                                                                ''))
                                                        ?.choices
                                                        .firstOrNull
                                                        ?.message
                                                        .content,
                                                    role: Role.assistant,
                                                    created:
                                                        getCurrentTimestamp,
                                                  ));
                                                  _model.newChatAssistantDoc =
                                                      MessagesRecord
                                                          .getDocumentFromData(
                                                              createMessagesRecordData(
                                                                content: GptResponseStruct.maybeFromMap(
                                                                        (_model.newChatResponse?.jsonBody ??
                                                                            ''))
                                                                    ?.choices
                                                                    .firstOrNull
                                                                    ?.message
                                                                    .content,
                                                                role: Role
                                                                    .assistant,
                                                                created:
                                                                    getCurrentTimestamp,
                                                              ),
                                                              messagesRecordReference4);
                                                  // DB - Collection (Messages)
                                                  _model.newChatAllMessages =
                                                      await queryMessagesRecordOnce(
                                                    parent: _model.chatRef,
                                                    queryBuilder:
                                                        (messagesRecord) =>
                                                            messagesRecord
                                                                .orderBy(
                                                                    'created',
                                                                    descending:
                                                                        true),
                                                  );
                                                  // UI Update (Messages)
                                                  _model.messages = _model
                                                      .newChatAllMessages!
                                                      .toList()
                                                      .cast<MessagesRecord>();
                                                  safeSetState(() {});
                                                }
                                              }

                                              safeSetState(() {});
                                            },
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Ask me something...',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                            validator: _model
                                                .promptFieldTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (FFAppState().showColumn == true)
                                Expanded(
                                  flex: 328,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Form(
                                            key: _model.formKey,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: Color(0x00000000),
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableExpandableController1,
                                                      child: ExpandablePanel(
                                                        header: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'CSV Files',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 2.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      borderRadius:
                                                                          0.0,
                                                                      buttonSize:
                                                                          50.0,
                                                                      hoverColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .inputLineFoc,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .upload_file,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            35.0,
                                                                      ),
                                                                      showLoadingIndicator:
                                                                          true,
                                                                      onPressed:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          barrierColor:
                                                                              FlutterFlowTheme.of(context).purpCircBorder,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return WebViewAware(
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(context).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: UploadCSVsWidget(),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      borderRadius:
                                                                          0.0,
                                                                      buttonSize:
                                                                          50.0,
                                                                      hoverColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .inputLineFoc,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .merge_type_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            35.0,
                                                                      ),
                                                                      showLoadingIndicator:
                                                                          true,
                                                                      onPressed:
                                                                          () async {
                                                                        FFAppState().batchid =
                                                                            getCurrentTimestamp.toString();
                                                                        FFAppState()
                                                                            .index = 0;
                                                                        FFAppState().UploadedCsvTimestampStrs =
                                                                            [];
                                                                        FFAppState().selectedDocuments =
                                                                            [];
                                                                        FFAppState().type = _model
                                                                            .checkboxCheckedItems
                                                                            .firstOrNull!
                                                                            .type;
                                                                        FFAppState().selectedDocuments = FFAppState()
                                                                            .selectedDocuments
                                                                            .toList()
                                                                            .cast<DocumentReference>();
                                                                        while (functions.indexChecker(
                                                                            FFAppState().index,
                                                                            _model.checkboxCheckedItems.length)!) {
                                                                          FFAppState().index =
                                                                              FFAppState().index + 1;
                                                                          FFAppState().addToUploadedCsvDocStrs(FFAppState()
                                                                              .selectedDocuments
                                                                              .elementAtOrNull(FFAppState().index)!
                                                                              .id);
                                                                        }
                                                                        _model.cSVMergingComplet =
                                                                            await CSVMergingCall.call(
                                                                          docsList:
                                                                              FFAppState().UploadedCsvDocStrs,
                                                                        );

                                                                        Navigator.pop(
                                                                            context);

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      borderRadius:
                                                                          0.0,
                                                                      buttonSize:
                                                                          50.0,
                                                                      hoverColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .inputLineFoc,
                                                                      icon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .trashAlt,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                      showLoadingIndicator:
                                                                          true,
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'delete pressed ...');
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      borderRadius:
                                                                          0.0,
                                                                      buttonSize:
                                                                          50.0,
                                                                      hoverColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .inputLineFoc,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .deselect_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                      showLoadingIndicator:
                                                                          true,
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'deselect pressed ...');
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      borderRadius:
                                                                          0.0,
                                                                      buttonSize:
                                                                          50.0,
                                                                      hoverColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .inputLineFoc,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .question_mark,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                      showLoadingIndicator:
                                                                          true,
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'hint pressed ...');
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        collapsed: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            StreamBuilder<
                                                                List<
                                                                    CsvRecord>>(
                                                              stream:
                                                                  queryCsvRecord(
                                                                queryBuilder: (csvRecord) =>
                                                                    csvRecord
                                                                        .where(
                                                                          'creator',
                                                                          isEqualTo:
                                                                              currentUserReference,
                                                                        )
                                                                        .orderBy(
                                                                            'uploaded_time',
                                                                            descending:
                                                                                true),
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<CsvRecord>
                                                                    dBDataColumnCsvRecordList =
                                                                    snapshot
                                                                        .data!;

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      dBDataColumnCsvRecordList
                                                                          .length,
                                                                      (dBDataColumnIndex) {
                                                                    final dBDataColumnCsvRecord =
                                                                        dBDataColumnCsvRecordList[
                                                                            dBDataColumnIndex];
                                                                    return ListView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: double.infinity,
                                                                                color: Color(0x00000000),
                                                                                child: ExpandableNotifier(
                                                                                  initialExpanded: false,
                                                                                  child: ExpandablePanel(
                                                                                    header: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
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
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Theme(
                                                                                                  data: ThemeData(
                                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                                      visualDensity: VisualDensity.compact,
                                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                      shape: RoundedRectangleBorder(
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                  child: Checkbox(
                                                                                                    value: _model.checkboxValueMap[dBDataColumnCsvRecord] ??= false,
                                                                                                    onChanged: (newValue) async {
                                                                                                      safeSetState(() => _model.checkboxValueMap[dBDataColumnCsvRecord] = newValue!);
                                                                                                    },
                                                                                                    side: BorderSide(
                                                                                                      width: 2,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    activeColor: FlutterFlowTheme.of(context).inputLineFoc,
                                                                                                    checkColor: FlutterFlowTheme.of(context).info,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  'DocId: ',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                                SelectionArea(
                                                                                                    child: Text(
                                                                                                  dBDataColumnCsvRecord.reference.id,
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 20.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                )),
                                                                                                FlutterFlowIconButton(
                                                                                                  borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                  borderRadius: 10.0,
                                                                                                  borderWidth: 1.0,
                                                                                                  buttonSize: 40.0,
                                                                                                  icon: Icon(
                                                                                                    Icons.edit_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  onPressed: () {
                                                                                                    print('IconButton pressed ...');
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Wrap(
                                                                                              spacing: 0.0,
                                                                                              runSpacing: 0.0,
                                                                                              alignment: WrapAlignment.start,
                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.start,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Timestamp: ',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                                SelectionArea(
                                                                                                    child: Text(
                                                                                                  dBDataColumnCsvRecord.uploadedTime,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                )),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Wrap(
                                                                                              spacing: 0.0,
                                                                                              runSpacing: 0.0,
                                                                                              alignment: WrapAlignment.start,
                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.start,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Type:',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                                SelectionArea(
                                                                                                    child: Text(
                                                                                                  dBDataColumnCsvRecord.type,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                )),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Divider(
                                                                                          thickness: 1.0,
                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    collapsed: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                    expanded: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Content: ',
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                                FlutterFlowIconButton(
                                                                                                  borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                  borderRadius: 10.0,
                                                                                                  borderWidth: 1.0,
                                                                                                  buttonSize: 30.0,
                                                                                                  icon: Icon(
                                                                                                    Icons.edit_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                  onPressed: () {
                                                                                                    print('IconButton pressed ...');
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              dBDataColumnCsvRecord.content.maybeHandleOverflow(
                                                                                                maxChars: 1000,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    fontSize: 16.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    theme: ExpandableThemeData(
                                                                                      tapHeaderToExpand: true,
                                                                                      tapBodyToExpand: false,
                                                                                      tapBodyToCollapse: false,
                                                                                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                      hasIcon: true,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
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
                                                        expanded: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController2,
                                                            focusNode: _model
                                                                .textFieldFocusNode,
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Label here...',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            validator: _model
                                                                .textController2Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
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
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
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
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
