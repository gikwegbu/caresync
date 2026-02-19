import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/appointment_bloc.dart';
import 'widgets/appointment_card.dart'; // Will create this next
import 'widgets/book_appointment_sheet.dart'; // Will create this

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<AppointmentBloc>()
        .add(const AppointmentEvent.loadAppointments());
  }

  @override
  Widget build(BuildContext context) {
    return const _AppointmentsView();
  }
}

class _AppointmentsView extends StatelessWidget {
  const _AppointmentsView();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            'Appointments',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          bottom: TabBar(
            labelColor: AppColors.nhsBlue,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.nhsBlue,
            labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
            tabs: const [
              Tab(text: 'Upcoming'),
              Tab(text: 'Past'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _AppointmentList(isUpcoming: true),
            _AppointmentList(isUpcoming: false),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showBookingSheet(context),
          backgroundColor: AppColors.nhsBlue,
          icon: const Icon(Icons.add),
          label: Text(
            'Book New',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  void _showBookingSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const BookAppointmentSheet(),
    );
  }
}

class _AppointmentList extends StatelessWidget {
  final bool isUpcoming;

  const _AppointmentList({required this.isUpcoming});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (msg) => Center(child: Text('Error: $msg')),
          loaded: (appointments) {
            final now = DateTime.now();
            final filtered = appointments.where((a) {
              final isFuture = a.dateTime.isAfter(now);
              // Also filter by status if needed, but for now date based
              return isUpcoming ? isFuture : !isFuture;
            }).toList();

            // Sort
            filtered.sort((a, b) => isUpcoming
                ? a.dateTime.compareTo(b.dateTime)
                : b.dateTime.compareTo(a.dateTime));

            if (filtered.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isUpcoming ? Icons.event_available : Icons.history,
                      size: 64.w,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      isUpcoming
                          ? 'No upcoming appointments'
                          : 'No past appointments',
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
                return AppointmentCard(appointment: filtered[index]);
              },
            );
          },
        );
      },
    );
  }
}
