import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  final String reportUrl;
  PdfView(this.reportUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 243, 247),
        body: SfPdfViewer.network(reportUrl, controller: _pdfViewerController));
  }
}