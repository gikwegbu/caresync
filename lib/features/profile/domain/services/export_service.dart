import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import '../../../../features/health_metrics/domain/entities/health_metric.dart';

import 'package:intl/intl.dart';

class ExportService {
  Future<void> exportToCsv(List<HealthMetric> metrics) async {
    // Sort by date descending
    metrics.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

    final List<List<dynamic>> csvData = [
      ['Date', 'Time', 'Type', 'Value', 'Unit', 'Notes'],
    ];

    for (var m in metrics) {
      csvData.add([
        DateFormat('yyyy-MM-dd').format(m.recordedAt),
        DateFormat('HH:mm').format(m.recordedAt),
        m.type,
        m.value,
        m.unit ?? '',
        m.notes ?? '',
      ]);
    }

    final String csvStr = const ListToCsvConverter().convert(csvData);
    final File file = await _getTempFile('health_data.csv');
    await file.writeAsString(csvStr);
    await _shareFile(file.path, 'health_data.csv');
  }

  Future<void> exportToJson(List<HealthMetric> metrics) async {
    // Sort by date descending
    metrics.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

    final Map<String, List<Map<String, dynamic>>> groupedData = {};

    for (var m in metrics) {
      final dateKey = DateFormat('yyyy-MM-dd').format(m.recordedAt);
      if (!groupedData.containsKey(dateKey)) {
        groupedData[dateKey] = [];
      }
      groupedData[dateKey]!.add({
        'time': DateFormat('HH:mm').format(m.recordedAt),
        'type': m.type,
        'value': m.value,
        'unit': m.unit,
        'notes': m.notes,
      });
    }

    final String jsonStr =
        const JsonEncoder.withIndent('  ').convert(groupedData);
    final File file = await _getTempFile('health_data.json');
    await file.writeAsString(jsonStr);
    await _shareFile(file.path, 'health_data.json');
  }

  Future<void> exportToPdf(List<HealthMetric> metrics) async {
    // Sort by date descending
    metrics.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

    final pdf = pw.Document();

    // Grouping for PDF
    final Map<String, List<HealthMetric>> groupedMetrics = {};
    for (var m in metrics) {
      final dateKey = DateFormat('dd MMM yyyy').format(m.recordedAt);
      if (!groupedMetrics.containsKey(dateKey)) {
        groupedMetrics[dateKey] = [];
      }
      groupedMetrics[dateKey]!.add(m);
    }

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          final List<pw.Widget> content = [
            pw.Header(
              level: 0,
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('CareSync Health Report',
                      style: pw.TextStyle(
                          fontSize: 24, fontWeight: pw.FontWeight.bold)),
                  pw.Text(DateFormat('dd/MM/yyyy').format(DateTime.now())),
                ],
              ),
            ),
            pw.SizedBox(height: 20),
          ];

          for (var entry in groupedMetrics.entries) {
            content.add(
              pw.Padding(
                padding: const pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Text(
                  entry.key,
                  style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue),
                ),
              ),
            );

            content.add(
              pw.TableHelper.fromTextArray(
                border: null,
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                headerDecoration:
                    const pw.BoxDecoration(color: PdfColors.grey300),
                headers: ['Time', 'Type', 'Value', 'Notes'],
                data: entry.value
                    .map((m) => [
                          DateFormat('HH:mm').format(m.recordedAt),
                          m.type,
                          '${m.value} ${m.unit ?? ''}',
                          m.notes ?? '',
                        ])
                    .toList(),
              ),
            );
          }

          return content;
        },
      ),
    );

    final File file = await _getTempFile('health_data.pdf');
    await file.writeAsBytes(await pdf.save());
    await _shareFile(file.path, 'health_data.pdf');
  }

  Future<File> _getTempFile(String fileName) async {
    final Directory directory = await getTemporaryDirectory();
    final String path = '${directory.path}/$fileName';
    return File(path);
  }

  Future<void> _shareFile(String path, String name) async {
    await Share.shareXFiles([XFile(path)], text: 'Exported $name');
  }
}
