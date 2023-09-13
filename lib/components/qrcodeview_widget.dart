import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'qrcodeview_model.dart';
export 'qrcodeview_model.dart';

class QrcodeviewWidget extends StatefulWidget {
  const QrcodeviewWidget({
    Key? key,
    required this.packageID,
  }) : super(key: key);

  final String? packageID;

  @override
  _QrcodeviewWidgetState createState() => _QrcodeviewWidgetState();
}

class _QrcodeviewWidgetState extends State<QrcodeviewWidget> {
  late QrcodeviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QrcodeviewModel());

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
                data: widget.packageID!,
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
