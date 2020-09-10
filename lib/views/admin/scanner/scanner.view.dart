import 'package:auto_route/auto_route.dart';
import 'package:dsckssem/widgets/dailog.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
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
  String _scanBarcode = "";

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Barcode scan')),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            alignment: Alignment.center,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () async {
                    await scanQR();
                    if (_scanBarcode.isNotEmpty &&
                        _scanBarcode != 'Failed to get platform version.') {
                      final qr = _scanBarcode.split(" ");
                      await confirmAttendee(qr);
                      setState(() {
                        _scanBarcode = "";
                      });
                    }
                    context.read<ScannerVM>().newScan();
                  },
                  child: Text("Start QR scan"),
                ),
                // if (_scanBarcode.isNotEmpty)
                //   RaisedButton(
                //     onPressed: () async {},
                //     child: Text("Verify"),
                //   ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> confirmAttendee(List<String> qr) async {
    showBlockingDialog(context);
    final res =
        await context.read<ScannerVM>().confirmAttendee(eid: qr[0], uid: qr[1]);
    context.rootNavigator.pop();
    if (res)
      Flushbar(
        title: "Confirmed",
        message: "Succesfully Registered",
        flushbarStyle: FlushbarStyle.GROUNDED,
        backgroundColor: Colors.black,
        duration: Duration(seconds: 2),
      )..show(context);
    if (!res)
      Flushbar(
        title: "Error",
        message: "Retry",
        flushbarStyle: FlushbarStyle.GROUNDED,
        backgroundColor: Colors.black,
        duration: Duration(seconds: 2),
      )..show(context);
  }
}
