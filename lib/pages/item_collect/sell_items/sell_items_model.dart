import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/items/item_1/item1_widget.dart';
import 'sell_items_widget.dart' show SellItemsWidget;
import 'package:flutter/material.dart';

class SellItemsModel extends FlutterFlowModel<SellItemsWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for Item_1 dynamic component.
  late FlutterFlowDynamicModels<Item1Model> item1Models1;
  // Models for Item_1 dynamic component.
  late FlutterFlowDynamicModels<Item1Model> item1Models2;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    item1Models1 = FlutterFlowDynamicModels(() => Item1Model());
    item1Models2 = FlutterFlowDynamicModels(() => Item1Model());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    item1Models1.dispose();
    item1Models2.dispose();
    navBarModel.dispose();
  }
}
