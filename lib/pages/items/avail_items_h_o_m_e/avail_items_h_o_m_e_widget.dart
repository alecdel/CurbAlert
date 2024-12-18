import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/items/item_2/item2_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'avail_items_h_o_m_e_model.dart';
export 'avail_items_h_o_m_e_model.dart';

class AvailItemsHOMEWidget extends StatefulWidget {
  const AvailItemsHOMEWidget({super.key});

  @override
  State<AvailItemsHOMEWidget> createState() => _AvailItemsHOMEWidgetState();
}

class _AvailItemsHOMEWidgetState extends State<AvailItemsHOMEWidget> {
  late AvailItemsHOMEModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvailItemsHOMEModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'availItems_HOME'});
    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Curb_Alert!_logo_no_bg.png',
                            width: 100.0,
                            fit: BoxFit.contain,
                            alignment: const Alignment(-1.0, -1.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              key: const ValueKey('SEARCH_3r33'),
                              controller: _model.searchTextController,
                              focusNode: _model.searchFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.searchTextController',
                                const Duration(milliseconds: 100),
                                () async {
                                  logFirebaseEvent(
                                      'AVAIL_ITEMS_H_O_M_E_SEARCH_ON_TEXTFIELD_');
                                  logFirebaseEvent('SEARCH_update_app_state');
                                  FFAppState().searchQuery =
                                      _model.searchTextController.text;
                                  safeSetState(() {});
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Search...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                prefixIcon: const Icon(
                                  Icons.search_rounded,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.searchTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        if (functions
                            .isLocationEnabled(currentUserLocationValue!))
                          StreamBuilder<List<ItemsRecord>>(
                            stream: FFAppState().availableitems(
                              requestFn: () => queryItemsRecord(
                                queryBuilder: (itemsRecord) => itemsRecord
                                    .where(
                                      'pickedUp',
                                      isEqualTo: false,
                                    )
                                    .where(
                                      'listingOwner',
                                      isNotEqualTo: currentUserUid != ''
                                          ? currentUserUid
                                          : null,
                                    ),
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<ItemsRecord> listViewItemsRecordList =
                                  snapshot.data!;

                              return ListView.separated(
                                key: const ValueKey('ListView_2o20'),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewItemsRecordList.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 10.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewItemsRecord =
                                      listViewItemsRecordList[listViewIndex];
                                  return Visibility(
                                    visible: functions.showSearchResult(
                                        _model.searchTextController.text,
                                        listViewItemsRecord.name),
                                    child: wrapWithModel(
                                      model: _model.item2Models.getModel(
                                        listViewItemsRecord.name,
                                        listViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: Item2Widget(
                                        key: Key(
                                          'Key7z2_${listViewItemsRecord.name}',
                                        ),
                                        item: listViewItemsRecord,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        if (!functions
                            .isLocationEnabled(currentUserLocationValue!))
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Please enable location permissions!',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Sora',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavBarWidget(
                    key: ValueKey('NavBar_y9o5'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
