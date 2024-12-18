import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/messages/message_bubbles/message_bubbles_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'chat_window_widget.dart' show ChatWindowWidget;
import 'package:flutter/material.dart';

class ChatWindowModel extends FlutterFlowModel<ChatWindowWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for MessageBubbles dynamic component.
  late FlutterFlowDynamicModels<MessageBubblesModel> messageBubblesModels;
  // State field(s) for SendMessage widget.
  FocusNode? sendMessageFocusNode;
  TextEditingController? sendMessageTextController;
  String? Function(BuildContext, String?)? sendMessageTextControllerValidator;

  /// Query cache managers for this widget.

  final _messagesManager = StreamRequestManager<List<ChatMessagesRecord>>();
  Stream<List<ChatMessagesRecord>> messages({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ChatMessagesRecord>> Function() requestFn,
  }) =>
      _messagesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMessagesCache() => _messagesManager.clear();
  void clearMessagesCacheKey(String? uniqueKey) =>
      _messagesManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    messageBubblesModels =
        FlutterFlowDynamicModels(() => MessageBubblesModel());
  }

  @override
  void dispose() {
    messageBubblesModels.dispose();
    sendMessageFocusNode?.dispose();
    sendMessageTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearMessagesCache();
  }
}
