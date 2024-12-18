import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'promoter_score_survey_model.dart';
export 'promoter_score_survey_model.dart';

class PromoterScoreSurveyWidget extends StatefulWidget {
  const PromoterScoreSurveyWidget({super.key});

  @override
  State<PromoterScoreSurveyWidget> createState() =>
      _PromoterScoreSurveyWidgetState();
}

class _PromoterScoreSurveyWidgetState extends State<PromoterScoreSurveyWidget> {
  late PromoterScoreSurveyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromoterScoreSurveyModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Based on your experience with CurbAlert! so far, how likely are you to recommend this app to a friend or colleague? ',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(null),
                  options: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
                  onChanged: (val) =>
                      safeSetState(() => _model.dropDownValue = val),
                  width: 200.0,
                  height: 40.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  hintText: 'Select...',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ].divide(const SizedBox(width: 12.0)),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('PROMOTER_SCORE_SURVEY_SAVE_BTN_ON_TAP');
                logFirebaseEvent('Button_google_analytics_event');
                logFirebaseEvent(
                  'nps',
                  parameters: {
                    'score': _model.dropDownValue,
                  },
                );
                if (_model.dropDownValue != null &&
                    _model.dropDownValue != '') {
                  logFirebaseEvent('Button_backend_call');

                  await currentUserReference!.update(createUsersRecordData(
                    netPromoterScore: _model.dropDownValue,
                  ));
                } else {
                  return;
                }

                logFirebaseEvent('Button_bottom_sheet');
                Navigator.pop(context);
              },
              text: 'Save',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
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
          ].divide(const SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
