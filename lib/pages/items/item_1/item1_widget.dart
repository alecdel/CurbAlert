import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/items/edit_item_details/edit_item_details_widget.dart';
import 'package:flutter/material.dart';
import 'item1_model.dart';
export 'item1_model.dart';

class Item1Widget extends StatefulWidget {
  const Item1Widget({
    super.key,
    required this.items,
  });

  final ItemsRecord? items;

  @override
  State<Item1Widget> createState() => _Item1WidgetState();
}

class _Item1WidgetState extends State<Item1Widget> {
  late Item1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Item1Model());

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
      width: 250.0,
      height: 250.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondary,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 80.0,
              height: 70.0,
              decoration: const BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.items!.image,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget.items?.name,
                'Item',
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              widget.items!.pickedUp ? 'Claimed' : 'Unclaimed',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('ITEM_1_COMP_EDIT_DETAILS_BTN_ON_TAP');
                logFirebaseEvent('Button_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: EditItemDetailsWidget(
                        item: widget.items!,
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              text: 'Edit Details',
              options: FFButtonOptions(
                height: 20.0,
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondary,
                ),
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
