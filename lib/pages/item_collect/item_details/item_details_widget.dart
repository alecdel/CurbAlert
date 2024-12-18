import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'item_details_model.dart';
export 'item_details_model.dart';

class ItemDetailsWidget extends StatefulWidget {
  const ItemDetailsWidget({
    super.key,
    required this.item,
    this.chats,
  });

  final ItemsRecord? item;
  final ChatsRecord? chats;

  @override
  State<ItemDetailsWidget> createState() => _ItemDetailsWidgetState();
}

class _ItemDetailsWidgetState extends State<ItemDetailsWidget> {
  late ItemDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.item!.image,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.contain,
                  alignment: const Alignment(0.0, 0.0),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.item?.name,
                    'itemName',
                  ),
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Sora',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.item?.details,
                  'itemDetails',
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Sora',
                      letterSpacing: 0.0,
                    ),
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowChoiceChips(
                        options: widget.item!.categories
                            .map((label) => ChipData(label))
                            .toList(),
                        onChanged: (widget.item!.categories.isNotEmpty)
                            ? null
                            : (val) => safeSetState(
                                () => _model.choiceChipsValues = val),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: FlutterFlowTheme.of(context).accent2,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                          iconSize: 18.0,
                          elevation: 0.0,
                          borderColor: FlutterFlowTheme.of(context).secondary,
                          borderWidth: 2.0,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 18.0,
                          elevation: 0.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        chipSpacing: 8.0,
                        rowSpacing: 8.0,
                        multiselect: true,
                        initialized: _model.choiceChipsValues != null,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      ),
                    ),
                  ],
                ),
              ),
              FFButtonWidget(
                key: const ValueKey('ClaimItem'),
                onPressed: () async {
                  logFirebaseEvent('ITEM_DETAILS_COMP_CLAIM_ITEM_BTN_ON_TAP');
                  logFirebaseEvent('Button_backend_call');

                  await widget.item!.reference.update(createItemsRecordData(
                    pickedUp: true,
                    pickedUpBy: currentUserUid,
                  ));
                  logFirebaseEvent('Button_backend_call');

                  await ChatsRecord.collection.doc().set({
                    ...createChatsRecordData(
                      date: getCurrentTimestamp,
                      createdbyRef: currentUserReference,
                      chatTitle: widget.item?.name,
                      recentUpdate: getCurrentTimestamp,
                      chatPhoto: widget.item?.image,
                      itemOwner: widget.item?.listingOwner,
                      enabled: true,
                      itemRef: widget.item?.reference,
                      ownerDisplayName: widget.item?.ownerDisplayName,
                      userDisplayName: currentUserDisplayName,
                    ),
                    ...mapToFirestore(
                      {
                        'members_ref': [currentUserUid],
                      },
                    ),
                  });
                  logFirebaseEvent('Button_google_analytics_event');
                  logFirebaseEvent(
                    'claimedItem',
                    parameters: {
                      'item_name': widget.item?.name,
                      'listingOwner': widget.item?.listingOwner,
                    },
                  );
                  logFirebaseEvent('Button_play_sound');
                  _model.soundPlayer ??= AudioPlayer();
                  if (_model.soundPlayer!.playing) {
                    await _model.soundPlayer!.stop();
                  }
                  _model.soundPlayer!.setVolume(1.0);
                  _model.soundPlayer!
                      .setAsset('assets/audios/ding-sound-effect_2.mp3')
                      .then((_) => _model.soundPlayer!.play());

                  logFirebaseEvent('Button_navigate_to');

                  context.goNamed('messages');
                },
                text: 'Claim Item',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
