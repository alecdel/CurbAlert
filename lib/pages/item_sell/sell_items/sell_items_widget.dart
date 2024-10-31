import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/items/item_1/item1_widget.dart';
import 'package:flutter/material.dart';
import 'sell_items_model.dart';
export 'sell_items_model.dart';

class SellItemsWidget extends StatefulWidget {
  const SellItemsWidget({super.key});

  @override
  State<SellItemsWidget> createState() => _SellItemsWidgetState();
}

class _SellItemsWidgetState extends State<SellItemsWidget> {
  late SellItemsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SellItemsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'sellItems'});
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: StreamBuilder<List<ItemsRecord>>(
                    stream: queryItemsRecord(
                      queryBuilder: (itemsRecord) => itemsRecord
                          .where(
                            'listingOwner',
                            isEqualTo: currentUserUid,
                          )
                          .orderBy('pickedUp'),
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
                      List<ItemsRecord> gridViewItemsRecordList =
                          snapshot.data!;

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewItemsRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewItemsRecord =
                              gridViewItemsRecordList[gridViewIndex];
                          return Item1Widget(
                            key: Key(
                                'Keyc8m_${gridViewIndex}_of_${gridViewItemsRecordList.length}'),
                            items: gridViewItemsRecord,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavBarWidget(),
                ),
              ),
            ].divide(const SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
