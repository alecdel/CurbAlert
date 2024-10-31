import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'avail_items_h_o_m_e_widget.dart' show AvailItemsHOMEWidget;
import 'package:flutter/material.dart';

class AvailItemsHOMEModel extends FlutterFlowModel<AvailItemsHOMEWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
