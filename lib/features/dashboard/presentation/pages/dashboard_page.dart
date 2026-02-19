import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/dashboard_cubit.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().loadDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    return const _DashboardView();
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => context.read<DashboardCubit>().loadDashboardData(),
          color: AppColors.nhsBlue,
          child: CustomScrollView(
            slivers: [
              _buildAppBar(context),
              _buildSummaryCards(context),
              _buildQuickActions(context),
              _buildRecentActivity(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(20.w),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getGreeting(),
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    state.maybeWhen(
                      loaded: (name, _, __, ___) => Text(
                        'Hi, $name',
                        style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      loading: () => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: 150.w,
                          height: 30.h,
                          color: Colors.white,
                        ),
                      ),
                      orElse: () => const SizedBox(),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 24.w,
                  backgroundColor: AppColors.nhsBlue.withOpacity(0.1),
                  child: InkWell(
                    onTap: () => context.push('/profile'),
                    child: Icon(Icons.person, color: AppColors.nhsBlue),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  Widget _buildSummaryCards(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 140.h,
          child: BlocBuilder<DashboardCubit, DashboardState>(
            builder: (context, state) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _SummaryCard(
                    title: 'Upcoming\nAppointments',
                    value: state.maybeWhen(
                      loaded: (_, count, __, ___) => count.toString(),
                      orElse: () => '-',
                    ),
                    icon: Icons.calendar_month,
                    color: AppColors.nhsBlue,
                    isLoading: state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    ),
                    onTap: () => context.push('/appointments'),
                  ),
                  SizedBox(width: 16.w),
                  _SummaryCard(
                    title: 'Active\nPrescriptions',
                    value: state.maybeWhen(
                      loaded: (_, __, count, ___) => count.toString(),
                      orElse: () => '-',
                    ),
                    icon: Icons.medication,
                    color: AppColors.nhsGreen,
                    isLoading: state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    ),
                    onTap: () => context.push('/prescriptions'),
                  ),
                  SizedBox(width: 16.w),
                  _SummaryCard(
                    title: 'Health\nMetrics',
                    value: state.maybeWhen(
                      loaded: (_, __, ___, metric) => metric,
                      orElse: () => '-',
                    ),
                    icon: Icons.favorite,
                    color: AppColors.nhsDarkBlue,
                    isLoading: state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    ),
                    onTap: () => context.push('/health-metrics'), // Fixed route
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(20.w),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _QuickActionButton(
                  icon: Icons.add_circle_outline,
                  label: 'Book GP',
                  onTap: () => context.push('/appointments'),
                ),
                _QuickActionButton(
                  icon: Icons.repeat,
                  label: 'Repeat Rx',
                  onTap: () => context.push('/prescriptions'),
                ),
                _QuickActionButton(
                  icon: Icons.monitor_heart_outlined,
                  label: 'Log BP',
                  onTap: () => context.push(
                      '/health-metrics'), // TODO: Open log sheet directly if possible
                ),
                _QuickActionButton(
                  icon: Icons.notifications,
                  label: 'Notifications',
                  onTap: () => context.push('/notifications'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Activity',
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 16.h),
            // Placeholder for list items
            Container(
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
                  CircleAvatar(
                    backgroundColor: AppColors.nhsGreen.withOpacity(0.1),
                    child: const Icon(Icons.check, color: AppColors.nhsGreen),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Prescription Ordered',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        'Amoxicillin 500mg',
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'Today',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final bool isLoading;
  final VoidCallback onTap;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140.w,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.white, size: 28.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLoading)
                  Shimmer.fromColors(
                    baseColor: Colors.white.withOpacity(0.5),
                    highlightColor: Colors.white.withOpacity(0.8),
                    child: Container(
                      width: 40.w,
                      height: 24.h,
                      color: Colors.white,
                    ),
                  )
                else
                  Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                SizedBox(height: 4.h),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: AppColors.nhsBlue, size: 24.w),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
