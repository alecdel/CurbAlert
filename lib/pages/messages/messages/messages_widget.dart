import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/messages/conversation/conversation_widget.dart';
import 'package:flutter/material.dart';
import 'messages_model.dart';
export 'messages_model.dart';

class MessagesWidget extends StatefulWidget {
  const MessagesWidget({
    super.key,
    this.seenbyRef,
  });

  final DocumentReference? seenbyRef;

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  late MessagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessagesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'messages'});
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Curb_Alert!_logo_no_bg.png',
                          width: 20.0,
                          height: 80.0,
                          fit: BoxFit.contain,
                          alignment: const Alignment(-1.0, -1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Text(
                    key: const ValueKey('Text_hesx'),
                    'Messages',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: StreamBuilder<List<ChatsRecord>>(
                    stream: _model.chats(
                      uniqueQueryKey: currentUserUid,
                      requestFn: () => queryChatsRecord(
                        queryBuilder: (chatsRecord) => chatsRecord
                            .where(
                              'members_ref',
                              arrayContains: currentUserUid,
                            )
                            .where(
                              'enabled',
                              isEqualTo: true,
                            )
                            .orderBy('recent_update', descending: true),
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
                      List<ChatsRecord> listViewChatsRecordList =
                          snapshot.data!;

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewChatsRecordList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewChatsRecord =
                              listViewChatsRecordList[listViewIndex];
                          return Container(
                            key: const ValueKey('conversation_52hj'),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MESSAGES_PAGE_Container_w3fo3vxc_ON_TAP');
                                logFirebaseEvent('conversation_navigate_to');

                                context.pushNamed(
                                  'ChatWindow',
                                  queryParameters: {
                                    'chatRef': serializeParam(
                                      listViewChatsRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                    'chatTitle': serializeParam(
                                      listViewChatsRecord,
                                      ParamType.Document,
                                    ),
                                    'chatID': serializeParam(
                                      listViewChatsRecord,
                                      ParamType.Document,
                                    ),
                                    'itemRef': serializeParam(
                                      listViewChatsRecord.itemRef,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'chatTitle': listViewChatsRecord,
                                    'chatID': listViewChatsRecord,
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 200),
                                    ),
                                  },
                                );

                                logFirebaseEvent('conversation_backend_call');

                                await widget.seenbyRef!.update({
                                  ...mapToFirestore(
                                    {
                                      'seenby_ref': FieldValue.arrayRemove(
                                          [currentUserUid]),
                                    },
                                  ),
                                });
                              },
                              child: wrapWithModel(
                                model: _model.conversationModels.getModel(
                                  listViewChatsRecord.chatTitle,
                                  listViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: ConversationWidget(
                                  key: Key(
                                    'Keyw3f_${listViewChatsRecord.chatTitle}',
                                  ),
                                  photoPath: valueOrDefault<String>(
                                    listViewChatsRecord.chatPhoto,
                                    '\"C:\\Users\\Jacob\\Downloads\\CurbAlertLogo.png\"',
                                  ),
                                  chatTitle: listViewChatsRecord.chatTitle,
                                  recentUpdate: dateTimeFormat("relative",
                                      listViewChatsRecord.recentUpdate!),
                                  message:
                                      listViewChatsRecord.recentChatMessage,
                                  seenbyRef:
                                      widget.seenbyRef != null ? false : true,
                                  membersRef: listViewChatsRecord.membersRef,
                                  ownerDisplayName:
                                      listViewChatsRecord.ownerDisplayName,
                                  userDisplayName:
                                      listViewChatsRecord.userDisplayName,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavBarWidget(),
                ),
              ),
            ].divide(const SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
