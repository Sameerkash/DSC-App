import 'package:auto_route/auto_route.dart';
import 'package:dsckssem/widgets/dailog.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:provider/provider.dart';
import 'scanner.vm.dart';

class ScannerView extends StatefulWidget with AutoRouteWrapper {
  @override
  _ScannerViewState createState() => _ScannerViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return StateNotifierProvider<ScannerVM, ScannerState>(
      create: (_) => ScannerVM(),
      child: this,
    );
  }
}

class _ScannerViewState extends State<ScannerView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            context.watch<ScannerState>().map(
                loading: (_) => Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                confirmed: (_) => Expanded(
                      flex: 1,
                      child: Center(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "Scan New",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            context.read<ScannerVM>().newScan();
                            setState(() {
                              confirm = true;
                            });
                          },
                        ),
                      ),
                    ),
                error: (_) => Text("Error occured try again"))
          ],
        ),
      ),
    );
  }

  bool confirm = true;

  Future<void> confirmAttendee(List<String> qr) async {
    if (confirm) {
      showBlockingDialog(context);
      await context.read<ScannerVM>().confirmAttendee(eid: qr[0], uid: qr[1]);
      context.rootNavigator.pop();
      Flushbar(
        title: "Confirmed",
        message: "Succesfully Registered",
        flushbarStyle: FlushbarStyle.GROUNDED,
        backgroundColor: Colors.black,
        duration: Duration(seconds: 2),
      )..show(context);

      setState(() {
        confirm = false;
      });
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });

      final List<String> qr = qrText.split(" ");
      confirmAttendee(qr);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
