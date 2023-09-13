import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/qrcodeview_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PackageNewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for recieverName widget.
  TextEditingController? recieverNameController1;
  String? Function(BuildContext, String?)? recieverNameController1Validator;
  // State field(s) for recieverPhone widget.
  TextEditingController? recieverPhoneController1;
  String? Function(BuildContext, String?)? recieverPhoneController1Validator;
  // State field(s) for recieverPhone widget.
  TextEditingController? recieverPhoneController2;
  String? Function(BuildContext, String?)? recieverPhoneController2Validator;
  // State field(s) for recieverName widget.
  TextEditingController? recieverNameController2;
  String? Function(BuildContext, String?)? recieverNameController2Validator;
  // State field(s) for recieverPhone widget.
  TextEditingController? recieverPhoneController3;
  String? Function(BuildContext, String?)? recieverPhoneController3Validator;
  // State field(s) for recieverPhone widget.
  TextEditingController? recieverPhoneController4;
  String? Function(BuildContext, String?)? recieverPhoneController4Validator;
  // State field(s) for senderOffice widget.
  String? senderOfficeValue;
  FormFieldController<String>? senderOfficeValueController;
  // State field(s) for recieverOffice widget.
  String? recieverOfficeValue;
  FormFieldController<String>? recieverOfficeValueController;
  // State field(s) for packageType widget.
  String? packageTypeValue;
  FormFieldController<String>? packageTypeValueController;
  DateTime? datePicked1;
  // State field(s) for back widget.
  TextEditingController? backController;
  String? Function(BuildContext, String?)? backControllerValidator;
  // State field(s) for notes widget.
  TextEditingController? notesController;
  String? Function(BuildContext, String?)? notesControllerValidator;
  // State field(s) for phone_receiverName widget.
  TextEditingController? phoneReceiverNameController;
  String? Function(BuildContext, String?)? phoneReceiverNameControllerValidator;
  // State field(s) for phone_receiverPhone widget.
  TextEditingController? phoneReceiverPhoneController;
  String? Function(BuildContext, String?)?
      phoneReceiverPhoneControllerValidator;
  // State field(s) for phone_recieverLocation widget.
  TextEditingController? phoneRecieverLocationController1;
  String? Function(BuildContext, String?)?
      phoneRecieverLocationController1Validator;
  // State field(s) for phone_recieverName widget.
  TextEditingController? phoneRecieverNameController;
  String? Function(BuildContext, String?)? phoneRecieverNameControllerValidator;
  // State field(s) for phone_recieverPhone widget.
  TextEditingController? phoneRecieverPhoneController;
  String? Function(BuildContext, String?)?
      phoneRecieverPhoneControllerValidator;
  // State field(s) for phone_recieverLocation widget.
  TextEditingController? phoneRecieverLocationController2;
  String? Function(BuildContext, String?)?
      phoneRecieverLocationController2Validator;
  // State field(s) for phone_senderOffice widget.
  String? phoneSenderOfficeValue;
  FormFieldController<String>? phoneSenderOfficeValueController;
  // State field(s) for phone_recieverOffice widget.
  String? phoneRecieverOfficeValue;
  FormFieldController<String>? phoneRecieverOfficeValueController;
  // State field(s) for phone_packageType widget.
  String? phonePackageTypeValue;
  FormFieldController<String>? phonePackageTypeValueController;
  // State field(s) for breakable widget.
  String? breakableValue;
  FormFieldController<String>? breakableValueController;
  DateTime? datePicked2;
  // State field(s) for phone_back widget.
  TextEditingController? phoneBackController;
  String? Function(BuildContext, String?)? phoneBackControllerValidator;
  // State field(s) for phone_notes widget.
  TextEditingController? phoneNotesController;
  String? Function(BuildContext, String?)? phoneNotesControllerValidator;
  // State field(s) for packageIdText widget.
  TextEditingController? packageIdTextController;
  String? Function(BuildContext, String?)? packageIdTextControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    recieverNameController1?.dispose();
    recieverPhoneController1?.dispose();
    recieverPhoneController2?.dispose();
    recieverNameController2?.dispose();
    recieverPhoneController3?.dispose();
    recieverPhoneController4?.dispose();
    backController?.dispose();
    notesController?.dispose();
    phoneReceiverNameController?.dispose();
    phoneReceiverPhoneController?.dispose();
    phoneRecieverLocationController1?.dispose();
    phoneRecieverNameController?.dispose();
    phoneRecieverPhoneController?.dispose();
    phoneRecieverLocationController2?.dispose();
    phoneBackController?.dispose();
    phoneNotesController?.dispose();
    packageIdTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
