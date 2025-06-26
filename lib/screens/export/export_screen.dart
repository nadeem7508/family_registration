import 'dart:typed_data';
import 'package:family_registration/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import '../../providers/family_provider.dart';

class ExportScreen extends StatelessWidget {
  ExportScreen({super.key});

  final ScreenshotController screenshotController = ScreenshotController();

  Future<void> exportAsPdf(BuildContext context, String head, List<String> members) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Family Registry", style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Text("Head: $head", style: const pw.TextStyle(fontSize: 16)),
            pw.SizedBox(height: 10),
            ...members.map((m) => pw.Text(m, style: const pw.TextStyle(fontSize: 14))).toList(),
          ],
        ),
      ),
    );

    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }

  Future<void> exportAsImage() async {
    final Uint8List? imageBytes = await screenshotController.capture();
    if (imageBytes != null) {
      await Printing.sharePdf(bytes: imageBytes, filename: "family_tree_image.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FamilyProvider>(context);
    final head = provider.head;
    final members = provider.members;

    if (head == null) {
      return const Scaffold(
        body: Center(child: Text("No data available to export")),
      );
    }

    List<String> memberTexts = members.map((m) => "${m.relation}: ${m.name}").toList();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xFF2B0A5C),
        title: Text(
          'EXPORT OPTIONS ',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.white.withOpacity(0.3), height: 1.0),
        ),
      ),
      body: Container(
         height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 51, 4, 92),
              Color.fromARGB(255, 58, 11, 158),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Choose export format:", style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 16,
          ),),
               SizedBox(height: 20),
              SizedBox(width: double.infinity,
                child: ElevatedButton(
                  style: TElevatedButtonTheme.lightElevatedButtonTheme.style,
                  onPressed: () => exportAsPdf(context, head.name, memberTexts),
                  child: const Text("Export as PDF"),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(width: double.infinity,
                child: ElevatedButton(  style: TElevatedButtonTheme.lightElevatedButtonTheme.style,
                  onPressed: () => exportAsImage(),
                  child: const Text("Export as Image"),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const Text("Preview:", style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 16,
          ),),
              const SizedBox(height: 10),
              Screenshot(
                controller: screenshotController,
                child: Card(
                  color: Colors.grey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("👤 Head: ${head.name}", style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        ...members.map((m) => Text("👨‍👩‍👧‍👦 ${m.relation}: ${m.name}")),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
