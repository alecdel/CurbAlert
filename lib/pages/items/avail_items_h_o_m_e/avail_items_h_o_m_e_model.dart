import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/items/item_2/item2_widget.dart';
import 'avail_items_h_o_m_e_widget.dart' show AvailItemsHOMEWidget;
import 'package:flutter/material.dart';

class AvailItemsHOMEModel extends FlutterFlowModel<AvailItemsHOMEWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SEARCH widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Models for Item_2 dynamic component.
  late FlutterFlowDynamicModels<Item2Model> item2Models;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    item2Models = FlutterFlowDynamicModels(() => Item2Model());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    item2Models.dispose();
    navBarModel.dispose();
  }
}
