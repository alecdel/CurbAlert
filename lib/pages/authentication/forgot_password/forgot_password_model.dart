import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ForgotPassword-Email widget.
  FocusNode? forgotPasswordEmailFocusNode;
  TextEditingController? forgotPasswordEmailTextController;
  String? Function(BuildContext, String?)?
      forgotPasswordEmailTextControllerValidator;
  String? _forgotPasswordEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    forgotPasswordEmailTextControllerValidator =
        _forgotPasswordEmailTextControllerValidator;
  }

  @override
  void dispose() {
    forgotPasswordEmailFocusNode?.dispose();
    forgotPasswordEmailTextController?.dispose();
  }
}
