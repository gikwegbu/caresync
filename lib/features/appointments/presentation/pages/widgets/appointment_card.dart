import 'package:care_sync/features/appointments/domain/entities/appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/theme/app_colors.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final isCancelled = appointment.status == 'cancelled';

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isCancelled
              ? AppColors.error.withOpacity(0.3)
              : Colors.transparent,
        ),
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
              Chip(
                label: Text(
                  appointment.specialty,
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: isCancelled ? AppColors.error : AppColors.nhsBlue,
                  ),
                ),
                backgroundColor: isCancelled
                    ? AppColors.error.withOpacity(0.1)
                    : AppColors.nhsBlue.withOpacity(0.1),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                side: BorderSide.none,
              ),
              if (isCancelled)
                Text(
                  'CANCELLED',
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.error,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            appointment.doctorName,
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.calendar_today,
                  size: 14.w, color: AppColors.textSecondary),
              SizedBox(width: 4.w),
              Text(
                DateFormat('EEE, d MMM yyyy • HH:mm')
                    .format(appointment.dateTime),
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                  size: 14.w, color: AppColors.textSecondary),
              SizedBox(width: 4.w),
              Text(
                appointment.location,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
