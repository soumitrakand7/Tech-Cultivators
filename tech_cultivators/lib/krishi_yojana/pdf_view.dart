import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  String Name;
  final String reportUrl;
  PdfView(this.reportUrl, {Key? key, required this.Name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 30,
          title: Center(
            child: Text(Name),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        body: SafeArea(
            child: SfPdfViewer.network(reportUrl,
                controller: _pdfViewerController)));
  }
}
