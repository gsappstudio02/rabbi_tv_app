import 'package:flutter/material.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:rabbi_tv_app/models/cor_palete.dart';

class MagazinesPDFViewer extends StatefulWidget {
  const MagazinesPDFViewer({Key? key, required this.pdf_url}) : super(key: key);
  final String pdf_url;
  @override
  State<MagazinesPDFViewer> createState() => _MagazinesPDFViewerState();
}

class _MagazinesPDFViewerState extends State<MagazinesPDFViewer> {
  bool _isLoading = true;
  late PDFDocument document;
  loadDocument() async {document = await PDFDocument.fromURL(widget.pdf_url);

    setState(() => _isLoading = false);
  }
  @override
  void initState() {
    // TODO: implement init
    super.initState();
    loadDocument();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: Container(
          child: Row(
            children: [
              Text('Reader', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: _isLoading==true?Center(child: CircularProgressIndicator()):PDFViewer(

          document: document,
          backgroundColor: Pallette.backgroundColor,

        ),
      ),
    );
  }
}
