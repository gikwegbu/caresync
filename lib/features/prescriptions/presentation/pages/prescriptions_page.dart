import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/prescription.dart';
import '../bloc/prescription_bloc.dart';
import 'prescription_form_page.dart';

class PrescriptionsPage extends StatefulWidget {
  const PrescriptionsPage({super.key});

  @override
  State<PrescriptionsPage> createState() => _PrescriptionsPageState();
}

class _PrescriptionsPageState extends State<PrescriptionsPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<PrescriptionBloc>()
        .add(const PrescriptionEvent.loadPrescriptions());
  }

  @override
  Widget build(BuildContext context) {
    return const _PrescriptionsView();
  }
}

class _PrescriptionsView extends StatelessWidget {
  const _PrescriptionsView();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.nhsBlue,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'Prescriptions',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.7),
            indicatorColor: Colors.white,
            labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
            tabs: const [
              Tab(text: 'Active'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _PrescriptionList(isActive: true),
            _PrescriptionList(isActive: false),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrescriptionFormPage(),
              ),
            );
          },
          backgroundColor: AppColors.nhsBlue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _PrescriptionList extends StatelessWidget {
  final bool isActive;

  const _PrescriptionList({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrescriptionBloc, PrescriptionState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (msg) => Center(child: Text('Error: $msg')),
          loaded: (prescriptions) {
            final filtered = prescriptions.where((p) {
              final isCompleted = p.status == 'completed';
              return isActive ? !isCompleted : isCompleted;
            }).toList();

            if (filtered.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isActive ? Icons.medication : Icons.history,
                      size: 64.w,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      isActive
                          ? 'No active prescriptions'
                          : 'No prescription history',
                      style: GoogleFonts.inter(
                        color: AppColors.textSecondary,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              padding: EdgeInsets.all(16.w),
              itemCount: filtered.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                return _PrescriptionCard(prescription: filtered[index]);
              },
            );
          },
        );
      },
    );
  }
}

class _PrescriptionCard extends StatelessWidget {
  final Prescription prescription;

  const _PrescriptionCard({required this.prescription});

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  prescription.medicationName,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (prescription.status == 'active')
                Switch(
                  value: prescription.reminderEnabled,
                  onChanged: (val) {
                    context.read<PrescriptionBloc>().add(
                          PrescriptionEvent.toggleReminder(
                              prescription.id!, val),
                        );
                  },
                  activeColor: AppColors.nhsBlue,
                ),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: AppColors.textSecondary),
                onSelected: (value) {
                  if (value == 'edit') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PrescriptionFormPage(prescription: prescription),
                      ),
                    );
                  } else if (value == 'delete') {
                    _showDeleteConfirmation(context);
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit, size: 20),
                        SizedBox(width: 8),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, size: 20, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Delete', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            '${prescription.dosage} • ${prescription.frequency}',
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
            ),
          ),
          if (prescription.status == 'active') ...[
            SizedBox(height: 12.h),
            LinearProgressIndicator(
              value: 0.7, // Mock progress based on dates
              backgroundColor: AppColors.nhsBlue.withOpacity(0.1),
              valueColor: const AlwaysStoppedAnimation(AppColors.nhsBlue),
              borderRadius: BorderRadius.circular(4.r),
            ),
            SizedBox(height: 4.h),
            Text(
              '${prescription.daysRemaining} days remaining',
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: AppColors.nhsBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Prescription'),
        content:
            const Text('Are you sure you want to delete this prescription?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<PrescriptionBloc>().add(
                    PrescriptionEvent.deletePrescription(prescription.id!),
                  );
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
