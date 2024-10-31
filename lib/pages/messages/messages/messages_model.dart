import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/messages/conversation/conversation_widget.dart';
import 'messages_widget.dart' show MessagesWidget;
import 'package:flutter/material.dart';

class MessagesModel extends FlutterFlowModel<MessagesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for conversation component.
  late ConversationModel conversationModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    conversationModel = createModel(context, () => ConversationModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    conversationModel.dispose();
    navBarModel.dispose();
  }
}
