import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EnterName widget.
  FocusNode? enterNameFocusNode;
  TextEditingController? enterNameController;
  String? Function(BuildContext, String?)? enterNameControllerValidator;
  // State field(s) for EnterEmail widget.
  FocusNode? enterEmailFocusNode;
  TextEditingController? enterEmailController;
  String? Function(BuildContext, String?)? enterEmailControllerValidator;
  // State field(s) for EnterPassword widget.
  FocusNode? enterPasswordFocusNode;
  TextEditingController? enterPasswordController;
  late bool enterPasswordVisibility;
  String? Function(BuildContext, String?)? enterPasswordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    enterPasswordVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    enterNameFocusNode?.dispose();
    enterNameController?.dispose();

    enterEmailFocusNode?.dispose();
    enterEmailController?.dispose();

    enterPasswordFocusNode?.dispose();
    enterPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
