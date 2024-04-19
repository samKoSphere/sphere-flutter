import 'package:flutter/material.dart';
import 'package:scan/scan.dart';
import 'package:sphere/common/widgets/appbar/appbar.dart';

class QrScan extends StatefulWidget {
  const QrScan({super.key});
  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  ScanController controller = ScanController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('掃一掃'),
      ),
      body: ScanView(
        controller: controller,
        onCapture: (data) {},
      ),
    );
  }
}
