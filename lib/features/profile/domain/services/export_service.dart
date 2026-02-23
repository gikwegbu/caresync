import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import '../../../../features/health_metrics/domain/entities/health_metric.dart';

class ExportService {
  Future<void> exportToCsv(List<HealthMetric> metrics) async {
    final List<List<dynamic>> csvData = [
      ['Date', 'Type', 'Value', 'Unit', 'Notes'],
    ];

    for (var m in metrics) {
      csvData.add([
        m.recordedAt.toIso8601String(),
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
    final List<Map<String, dynamic>> jsonList = metrics
        .map((m) => {
              'date': m.recordedAt.toIso8601String(),
              'type': m.type,
              'value': m.value,
              'unit': m.unit,
              'notes': m.notes,
            })
        .toList();

    final String jsonStr = jsonEncode(jsonList);
    final File file = await _getTempFile('health_data.json');
    await file.writeAsString(jsonStr);
    await _shareFile(file.path, 'health_data.json');
  }

  Future<void> exportToPdf(List<HealthMetric> metrics) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(
                level: 0,
                child: pw.Text('Health Data Report'),
              ),
              pw.SizedBox(height: 20),
              pw.TableHelper.fromTextArray(
                headers: ['Date', 'Type', 'Value', 'Notes'],
                data: metrics
                    .map((m) => [
                          m.recordedAt.toString().split(' ')[0],
                          m.type,
                          '${m.value} ${m.unit ?? ''}',
                          m.notes ?? '',
                        ])
                    .toList(),
              ),
            ],
          );
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
