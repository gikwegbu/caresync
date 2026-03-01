import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../../../health_metrics/domain/entities/health_metric.dart';
import '../../../health_metrics/presentation/bloc/health_metric_bloc.dart';
import '../../domain/services/export_service.dart';
import '../../domain/entities/user_profile.dart';
import '../bloc/profile_bloc.dart';
import 'widgets/edit_profile_sheet.dart'; // Will create this

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
  }

  @override
  Widget build(BuildContext context) {
    return const _ProfileView();
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                return Icon(
                  themeMode == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                );
              },
            ),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              final state = context.read<ProfileBloc>().state;
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              if (!isLoading) {
                // Prevent edit while loading
                // We need current profile to edit
                UserProfile? currentProfile;
                state.maybeWhen(
                  loaded: (p, _) => currentProfile = p,
                  orElse: () {},
                );
                _showEditSheet(context, currentProfile);
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text('Error: $msg')),
            empty: () => Center(
                child: Text('No profile yet. Tap edit to create.',
                    style: GoogleFonts.inter())),
            loaded: (profile, isBiometricEnabled) => SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  _buildHeader(context, profile),
                  SizedBox(height: 24.h),
                  _buildSection(context, 'Personal Details', [
                    _buildDetailRow(context, 'NHS Number', profile.nhsNumber),
                    _buildDetailRow(context, 'Date of Birth',
                        DateFormat('dd MMM yyyy').format(profile.dob)),
                    _buildDetailRow(context, 'GP Practice', profile.gpPractice),
                  ]),
                  SizedBox(height: 24.h),
                  _buildSection(context, 'Security', [
                    _buildBiometricToggle(context, profile, isBiometricEnabled),
                  ]),
                  SizedBox(height: 24.h),
                  _buildSection(context, 'Medical Conditions', [
                    if (profile.medicalConditions.isEmpty)
                      Text('None listed',
                          style: GoogleFonts.inter(color: Colors.grey))
                    else
                      Wrap(
                        spacing: 8.w,
                        children: profile.medicalConditions
                            .map((c) => Chip(
                                  label: Text(c,
                                      style:
                                          GoogleFonts.inter(fontSize: 12.sp)),
                                  backgroundColor:
                                      AppColors.nhsBlue.withValues(alpha: 0.1),
                                ))
                            .toList(),
                      ),
                  ]),
                  SizedBox(height: 24.h),
                  _buildPrivacySection(context),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.nhsBlue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () => _showExportSheet(context),
                      icon: const Icon(Icons.download),
                      label: Text(
                        'Export Health Data',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, UserProfile profile) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundColor: AppColors.nhsBlue,
          child: Text(
            profile.firstName[0] + profile.lastName[0],
            style: GoogleFonts.poppins(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          profile.fullName,
          style: GoogleFonts.poppins(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Text(
          '${profile.age} years old',
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildSection(
      BuildContext context, String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 16.h),
          ...children,
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.inter(
                  color: Theme.of(context).colorScheme.onSurfaceVariant)),
          Text(value, style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  void _showEditSheet(BuildContext context, UserProfile? currentProfile) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => EditProfileSheet(profile: currentProfile),
    );
  }

  Widget _buildBiometricToggle(
      BuildContext context, UserProfile profile, bool isEnabled) {
    return SwitchListTile(
      title: Text(
        'Biometric Authentication',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        'Require fingerprint or FaceID to open the app',
        style: GoogleFonts.inter(
          fontSize: 12.sp,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      value: isEnabled,
      activeThumbColor: AppColors.nhsBlue,
      contentPadding: EdgeInsets.zero,
      onChanged: (value) {
        context.read<ProfileBloc>().add(ProfileEvent.toggleBiometric(value));
      },
    );
  }

  Widget _buildPrivacySection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          'About This App & Data Privacy',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        iconColor: AppColors.nhsBlue,
        childrenPadding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        children: [
          Text(
            "This app is a personalised project built for individual use. By continuing, you acknowledge that you are choosing to use this app of your own accord.\n\nYour health data is stored locally on your device and is not transmitted to any external server, except when you choose to use the AI Chatbot feature, at which point your reading data is sent to Google's Gemini API for analysis.\n\nBy using this app, you accept these terms.",
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  void _showExportSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (bottomSheetContext) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Export Data',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Choose a format to export your health readings.',
                  style: GoogleFonts.inter(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 24.h),
                _buildExportOption(
                  context: context,
                  icon: Icons.table_chart,
                  title: 'CSV format',
                  subtitle: 'Spreadsheet format',
                  onTap: () async {
                    Navigator.pop(bottomSheetContext);
                    await _exportData(context, 'csv');
                  },
                ),
                _buildExportOption(
                  context: context,
                  icon: Icons.picture_as_pdf,
                  title: 'PDF Document',
                  subtitle: 'Formatted report',
                  onTap: () async {
                    Navigator.pop(bottomSheetContext);
                    await _exportData(context, 'pdf');
                  },
                ),
                _buildExportOption(
                  context: context,
                  icon: Icons.data_object,
                  title: 'JSON format',
                  subtitle: 'Raw structured data',
                  onTap: () async {
                    Navigator.pop(bottomSheetContext);
                    await _exportData(context, 'json');
                  },
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildExportOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.nhsBlue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: AppColors.nhsBlue),
      ),
      title:
          Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: GoogleFonts.inter(fontSize: 12.sp)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Future<void> _exportData(BuildContext context, String format) async {
    // 1. Get health metrics
    final state = context.read<HealthMetricBloc>().state;
    List<HealthMetric> metrics = [];
    state.maybeWhen(
      loaded: (m) => metrics = m,
      orElse: () {},
    );

    if (metrics.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No health data available to export.')),
      );
      return;
    }

    // 2. Select Date Range
    final firstDate = metrics
        .map((m) => m.recordedAt)
        .reduce((a, b) => a.isBefore(b) ? a : b);
    final lastDate = DateTime.now();

    if (!context.mounted) return;
    final DateTimeRange? pickedRange = await showDateRangePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDateRange: DateTimeRange(
        start: firstDate,
        end: lastDate,
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppColors.nhsBlue,
                  onPrimary: Colors.white,
                ),
          ),
          child: child!,
        );
      },
    );

    if (pickedRange == null) return;

    // 3. Filter metrics
    final filteredMetrics = metrics
        .where((m) =>
            m.recordedAt.isAfter(
                pickedRange.start.subtract(const Duration(seconds: 1))) &&
            m.recordedAt.isBefore(pickedRange.end.add(const Duration(days: 1))))
        .toList();

    if (filteredMetrics.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('No health data found for the selected range.')),
        );
      }
      return;
    }

    // 4. Export and Share
    try {
      final exportService = ExportService();
      if (format == 'csv') {
        await exportService.exportToCsv(filteredMetrics);
      } else if (format == 'pdf') {
        await exportService.exportToPdf(filteredMetrics);
      } else if (format == 'json') {
        await exportService.exportToJson(filteredMetrics);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to export data: $e')),
        );
      }
    }
  }
}
