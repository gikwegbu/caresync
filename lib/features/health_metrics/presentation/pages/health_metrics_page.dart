import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/health_metric.dart';
import '../bloc/health_metric_bloc.dart';
import 'widgets/log_metric_sheet.dart'; // Will create this

class HealthMetricsPage extends StatefulWidget {
  const HealthMetricsPage({super.key});

  @override
  State<HealthMetricsPage> createState() => _HealthMetricsPageState();
}

class _HealthMetricsPageState extends State<HealthMetricsPage> {
  @override
  void initState() {
    super.initState();
    context.read<HealthMetricBloc>().add(const HealthMetricEvent.loadMetrics());
  }

  @override
  Widget build(BuildContext context) {
    return const _HealthMetricsView();
  }
}

class _HealthMetricsView extends StatelessWidget {
  const _HealthMetricsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Health Metrics',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: BlocBuilder<HealthMetricBloc, HealthMetricState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text('Error: $msg')),
            loaded: (metrics) {
              if (metrics.isEmpty) {
                return Center(
                    child: Text('No metrics logged yet',
                        style: GoogleFonts.inter()));
              }
              // Group by type for simpler display or just list them all
              return ListView.separated(
                padding: EdgeInsets.all(16.w),
                itemCount: metrics.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  return _MetricCard(metric: metrics[index]);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showLogSheet(context),
        backgroundColor: AppColors.nhsBlue,
        icon: const Icon(Icons.add),
        label: Text('Log Metric',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
      ),
    );
  }

  void _showLogSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const LogMetricSheet(),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final HealthMetric metric;

  const _MetricCard({required this.metric});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;

    switch (metric.type) {
      case 'Blood Pressure':
        icon = Icons.favorite;
        color = Colors.red;
        break;
      case 'Heart Rate':
        icon = Icons.monitor_heart;
        color = Colors.pink;
        break;
      case 'Weight':
        icon = Icons.monitor_weight;
        color = Colors.blue;
        break;
      default:
        icon = Icons.health_and_safety;
        color = AppColors.nhsBlue;
    }

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24.w),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  metric.type,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  DateFormat('MMM d, HH:mm').format(metric.recordedAt),
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            metric.displayValue,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
