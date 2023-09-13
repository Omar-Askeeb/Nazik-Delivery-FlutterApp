import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package_l_ist_q_r_model.dart';
export 'package_l_ist_q_r_model.dart';

class PackageLIstQRWidget extends StatefulWidget {
  const PackageLIstQRWidget({
    Key? key,
    required this.packageID,
  }) : super(key: key);

  final PackagesRecord? packageID;

  @override
  _PackageLIstQRWidgetState createState() => _PackageLIstQRWidgetState();
}

class _PackageLIstQRWidgetState extends State<PackageLIstQRWidget> {
  late PackageLIstQRModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PackageLIstQRModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              BarcodeWidget(
                data: widget.packageID!.packageId,
                barcode: Barcode.qrCode(),
                width: 200.0,
                height: 200.0,
                color: FlutterFlowTheme.of(context).primaryText,
                backgroundColor: Colors.transparent,
                errorBuilder: (_context, _error) => SizedBox(
                  width: 200.0,
                  height: 200.0,
                ),
                drawText: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
