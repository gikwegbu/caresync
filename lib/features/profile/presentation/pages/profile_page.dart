import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
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
      backgroundColor: AppColors.background,
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
                  loaded: (p) => currentProfile = p,
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
            loaded: (profile) => SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  _buildHeader(profile),
                  SizedBox(height: 24.h),
                  _buildSection('Personal Details', [
                    _buildDetailRow('NHS Number', profile.nhsNumber),
                    _buildDetailRow('Date of Birth',
                        DateFormat('dd MMM yyyy').format(profile.dob)),
                    _buildDetailRow('GP Practice', profile.gpPractice),
                  ]),
                  SizedBox(height: 24.h),
                  _buildSection('Medical Conditions', [
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
                                      AppColors.nhsBlue.withOpacity(0.1),
                                ))
                            .toList(),
                      ),
                  ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(UserProfile profile) {
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
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          profile.fullName,
          style: GoogleFonts.poppins(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          '${profile.age} years old',
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
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
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          ...children,
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.inter(color: AppColors.textSecondary)),
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
}
