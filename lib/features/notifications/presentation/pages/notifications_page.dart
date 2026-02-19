import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock notifications
    final notifications = [
      {
        'title': 'Appointment Reminder',
        'body': 'You have an appointment with Dr. Smith tomorrow at 09:00',
        'time': '2 hours ago'
      },
      {
        'title': 'Prescription Due',
        'body': 'Time to take your Amoxicillin',
        'time': '5 hours ago'
      },
      {
        'title': 'Health Check',
        'body': 'Don\'t forget to log your blood pressure today',
        'time': '1 day ago'
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.w),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          final n = notifications[index];
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => Container(
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.r)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        n['title']!,
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        n['time']!,
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        n['body']!,
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          color: AppColors.textPrimary,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.nhsBlue,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            'Dismiss',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Container(
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
                      Text(
                        n['title']!,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                      Text(
                        n['time']!,
                        style: GoogleFonts.inter(
                            fontSize: 12.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    n['body']!,
                    style: GoogleFonts.inter(
                        fontSize: 14.sp, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
