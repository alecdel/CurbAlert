import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'item_details_widget.dart' show ItemDetailsWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ItemDetailsModel extends FlutterFlowModel<ItemDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
