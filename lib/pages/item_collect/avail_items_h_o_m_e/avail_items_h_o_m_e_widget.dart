import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/items/item_2/item2_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvailItemsHOMEModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'availItems_HOME'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Curb_Alert!_logo_no_bg.png',
                            width: 20.0,
                            height: 80.0,
                            fit: BoxFit.contain,
                            alignment: const Alignment(-1.0, -1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.sizeOf(context).height * 0.75,
                      maxHeight: MediaQuery.sizeOf(context).height * 0.75,
                    ),
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: StreamBuilder<List<ItemsRecord>>(
                        stream: queryItemsRecord(
                          queryBuilder: (itemsRecord) => itemsRecord
                              .where(
                                'pickedUp',
                                isEqualTo: false,
                              )
                              .where(
                                'listingOwner',
                                isNotEqualTo: currentUserUid,
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
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewItemsRecordList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewItemsRecord =
                                  listViewItemsRecordList[listViewIndex];
                              return Item2Widget(
                                key: Key(
                                    'Key7z2_${listViewIndex}_of_${listViewItemsRecordList.length}'),
                                item: listViewItemsRecord,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const NavBarWidget(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
