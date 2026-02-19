import 'package:care_sync/core/theme/app_colors.dart';
import 'package:care_sync/features/health_metrics/domain/entities/health_metric.dart';
import 'package:care_sync/features/health_metrics/presentation/bloc/health_metric_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LogMetricSheet extends StatefulWidget {
  const LogMetricSheet({super.key});

  @override
  State<LogMetricSheet> createState() => _LogMetricSheetState();
}

class _LogMetricSheetState extends State<LogMetricSheet> {
  String _selectedType = 'Blood Pressure';
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  final List<String> _types = [
    'Blood Pressure',
    'Heart Rate',
    'Weight',
    'Blood Sugar'
  ];
  final Map<String, String> _units = {
    'Blood Pressure': 'mmHg',
    'Heart Rate': 'bpm',
    'Weight': 'kg',
    'Blood Sugar': 'mmol/L',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 24.w,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Log Health Metric',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 24.h),
          DropdownButtonFormField<String>(
            value: _selectedType,
            decoration: const InputDecoration(
              labelText: 'Metric Type',
              border: OutlineInputBorder(),
            ),
            items: _types
                .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                .toList(),
            onChanged: (val) => setState(() => _selectedType = val!),
          ),
          SizedBox(height: 16.h),
          TextField(
            controller: _valueController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Value',
              suffixText: _units[_selectedType],
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.h),
          TextField(
            controller: _notesController,
            decoration: const InputDecoration(
              labelText: 'Notes (Optional)',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: _saveMetric,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.nhsBlue,
              padding: EdgeInsets.symmetric(vertical: 16.h),
            ),
            child: Text(
              'Save Metric',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _saveMetric() {
    if (_valueController.text.isEmpty) return;

    final value = double.tryParse(_valueController.text) ?? 0.0;

    final metric = HealthMetric(
      type: _selectedType,
      value: value,
      unit: _units[_selectedType],
      recordedAt: DateTime.now(),
      notes: _notesController.text,
    );

    context.read<HealthMetricBloc>().add(HealthMetricEvent.logMetric(metric));
    Navigator.pop(context);
  }
}
