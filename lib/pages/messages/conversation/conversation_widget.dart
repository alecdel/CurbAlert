import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'conversation_model.dart';
export 'conversation_model.dart';

class ConversationWidget extends StatefulWidget {
  const ConversationWidget({
    super.key,
    required this.photoPath,
    required this.chatTitle,
    required this.recentUpdate,
    this.message,
    bool? seenbyRef,
    required this.membersRef,
    this.ownerDisplayName,
    this.userDisplayName,
  }) : seenbyRef = seenbyRef ?? false;

  final String? photoPath;
  final String? chatTitle;
  final String? recentUpdate;
  final String? message;
  final bool seenbyRef;
  final List<String>? membersRef;
  final String? ownerDisplayName;
  final String? userDisplayName;

  @override
  State<ConversationWidget> createState() => _ConversationWidgetState();
}

class _ConversationWidgetState extends State<ConversationWidget> {
  late ConversationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConversationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondary,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: AuthUserStreamWidget(
                builder: (context) => Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        currentUserPhoto,
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(68.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondary,
                      width: 1.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                    child: Image.network(
                      valueOrDefault<String>(
                        widget.photoPath,
                        '\"C:\\Users\\Jacob\\Downloads\\CurbAlertLogo.png\"',
                      ),
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.chatTitle,
                          'chatTitle',
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.membersRef?.firstOrNull == currentUserUid
                              ? widget.ownerDisplayName
                              : widget.userDisplayName,
                          'displayName',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.recentUpdate,
                          'recentUpdate',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(const SizedBox(width: 12.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          valueOrDefault<String>(
                            widget.message,
                            'message',
                          ).maybeHandleOverflow(
                            maxChars: 32,
                            replacement: '…',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.circle_sharp,
              color: widget.seenbyRef
                  ? FlutterFlowTheme.of(context).secondaryText
                  : FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
          ].divide(const SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
