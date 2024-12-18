import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/messages/message_bubbles/message_bubbles_widget.dart';
import 'package:flutter/material.dart';
import 'chat_window_model.dart';
export 'chat_window_model.dart';

class ChatWindowWidget extends StatefulWidget {
  const ChatWindowWidget({
    super.key,
    required this.chatRef,
    required this.chatTitle,
    required this.chatID,
    required this.itemRef,
  });

  final DocumentReference? chatRef;
  final ChatsRecord? chatTitle;
  final ChatsRecord? chatID;
  final DocumentReference? itemRef;

  @override
  State<ChatWindowWidget> createState() => _ChatWindowWidgetState();
}

class _ChatWindowWidgetState extends State<ChatWindowWidget> {
  late ChatWindowModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatWindowModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ChatWindow'});
    _model.sendMessageTextController ??= TextEditingController();
    _model.sendMessageFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Curb_Alert!_logo_no_bg.png',
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.chatTitle?.chatTitle,
                                  'chatTitle',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              FFButtonWidget(
                                key: const ValueKey('Button_d5j6'),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CHAT_WINDOW_PAGE_END_CHAT_BTN_ON_TAP');
                                  logFirebaseEvent('Button_alert_dialog');
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('End Chat'),
                                                content: const Text(
                                                    'This will delete the chat.  Please confirm this is what you want to do.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: const Text('Confirm'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    logFirebaseEvent('Button_alert_dialog');
                                    confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text('Item Claim'),
                                                  content: const Text(
                                                      'Was this item picked up?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: const Text('No'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: const Text('Yes'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      logFirebaseEvent('Button_backend_call');

                                      await widget.chatRef!
                                          .update(createChatsRecordData(
                                        enabled: false,
                                      ));
                                    } else {
                                      logFirebaseEvent('Button_backend_call');

                                      await widget.itemRef!
                                          .update(createItemsRecordData(
                                        pickedUp: false,
                                      ));
                                      logFirebaseEvent('Button_backend_call');

                                      await widget.chatRef!
                                          .update(createChatsRecordData(
                                        enabled: false,
                                      ));
                                    }

                                    logFirebaseEvent('Button_navigate_back');
                                    context.safePop();
                                  } else {
                                    return;
                                  }
                                },
                                text: 'End Chat',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  50.0, 0.0, 0.0, 0.0),
                              child: Container(
                                height: 100.0,
                                decoration: const BoxDecoration(),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.close,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'CHAT_WINDOW_PAGE_CloseChat_ON_TAP');
                                            logFirebaseEvent(
                                                'CloseChat_navigate_to');

                                            context.goNamed('messages');
                                          },
                                        ),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: StreamBuilder<List<ChatMessagesRecord>>(
                          stream: _model.messages(
                            uniqueQueryKey: widget.chatID?.reference.id,
                            requestFn: () => queryChatMessagesRecord(
                              parent: widget.chatRef,
                              queryBuilder: (chatMessagesRecord) =>
                                  chatMessagesRecord.orderBy('date',
                                      descending: true),
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
                            List<ChatMessagesRecord>
                                listViewChatMessagesRecordList = snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              reverse: true,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewChatMessagesRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewChatMessagesRecord =
                                    listViewChatMessagesRecordList[
                                        listViewIndex];
                                return wrapWithModel(
                                  model: _model.messageBubblesModels.getModel(
                                    listViewChatMessagesRecord.reference.id,
                                    listViewIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: MessageBubblesWidget(
                                    key: Key(
                                      'Keyywt_${listViewChatMessagesRecord.reference.id}',
                                    ),
                                    chatMessages: listViewChatMessagesRecord,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 300.0,
                      child: TextFormField(
                        key: const ValueKey('SendMessage_tw5m'),
                        controller: _model.sendMessageTextController,
                        focusNode: _model.sendMessageFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: false,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Message...',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsets.all(12.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.sendMessageTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  if (_model.sendMessageTextController.text != '')
                    FlutterFlowIconButton(
                      key: const ValueKey('IconButton_xg10'),
                      borderColor: FlutterFlowTheme.of(context).secondary,
                      borderRadius: 50.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.arrow_upward,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'CHAT_WINDOW_PAGE_arrow_upward_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_backend_call');

                        await ChatMessagesRecord.createDoc(widget.chatRef!)
                            .set({
                          ...createChatMessagesRecordData(
                            date: getCurrentTimestamp,
                            createdbyRef: currentUserReference,
                            message: _model.sendMessageTextController.text,
                          ),
                          ...mapToFirestore(
                            {
                              'seenby_ref': [
                                widget.chatID?.membersRef
                                    .contains(currentUserUid !=
                                            widget
                                                .chatID?.membersRef.firstOrNull
                                        ? widget
                                            .chatID?.membersRef.firstOrNull
                                        : widget
                                            .chatID?.membersRef.lastOrNull)
                                    .toString()
                              ],
                            },
                          ),
                        });
                        logFirebaseEvent('IconButton_backend_call');

                        await widget.chatRef!.update({
                          ...createChatsRecordData(
                            recentChatMessage:
                                _model.sendMessageTextController.text,
                          ),
                          ...mapToFirestore(
                            {
                              'members_ref': FieldValue.arrayUnion(
                                  [widget.chatID?.itemOwner]),
                            },
                          ),
                        });
                        logFirebaseEvent(
                            'IconButton_clear_text_fields_pin_codes');
                        safeSetState(() {
                          _model.sendMessageTextController?.clear();
                        });
                      },
                    ),
                ].divide(const SizedBox(width: 12.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
