import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/messages/conversation/conversation_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'messages_widget.dart' show MessagesWidget;
import 'package:flutter/material.dart';

class MessagesModel extends FlutterFlowModel<MessagesWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for conversation dynamic component.
  late FlutterFlowDynamicModels<ConversationModel> conversationModels;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Query cache managers for this widget.

  final _chatsManager = StreamRequestManager<List<ChatsRecord>>();
  Stream<List<ChatsRecord>> chats({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ChatsRecord>> Function() requestFn,
  }) =>
      _chatsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChatsCache() => _chatsManager.clear();
  void clearChatsCacheKey(String? uniqueKey) =>
      _chatsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    conversationModels = FlutterFlowDynamicModels(() => ConversationModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    conversationModels.dispose();
    navBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearChatsCache();
  }
}
