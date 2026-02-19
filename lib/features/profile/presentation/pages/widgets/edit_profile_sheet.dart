import 'package:care_sync/core/theme/app_colors.dart';
import 'package:care_sync/features/profile/domain/entities/user_profile.dart';
import 'package:care_sync/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileSheet extends StatefulWidget {
  final UserProfile? profile;

  const EditProfileSheet({super.key, this.profile});

  @override
  State<EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<EditProfileSheet> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _nhsNumberController;
  late TextEditingController _gpPracticeController;
  DateTime _dob = DateTime(1990, 1, 1);

  @override
  void initState() {
    super.initState();
    _firstNameController =
        TextEditingController(text: widget.profile?.firstName);
    _lastNameController = TextEditingController(text: widget.profile?.lastName);
    _nhsNumberController =
        TextEditingController(text: widget.profile?.nhsNumber);
    _gpPracticeController =
        TextEditingController(text: widget.profile?.gpPractice);
    if (widget.profile != null) {
      _dob = widget.profile!.dob;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 24.w,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24.w,
      ),
      height: 0.85.sh, // Make it tall
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  SizedBox(height: 24.h),
                  _buildTextField('First Name', _firstNameController,
                      textCapitalization: TextCapitalization.words),
                  SizedBox(height: 16.h),
                  _buildTextField('Last Name', _lastNameController,
                      textCapitalization: TextCapitalization.words),
                  SizedBox(height: 16.h),
                  _buildTextField('NHS Number', _nhsNumberController,
                      keyboardType: TextInputType.number),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: _dob,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        setState(() => _dob = date);
                      }
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: TextEditingController(
                            text:
                                "${_dob.day}/${_dob.month}/${_dob.year}"), // Simple format
                        decoration: const InputDecoration(
                          labelText: 'Date of Birth',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(height: 16.h),
                  _buildTextField('GP Practice', _gpPracticeController,
                      textCapitalization: TextCapitalization.words),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: _saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.nhsBlue,
                      minimumSize: Size(double.infinity, 50.h),
                    ),
                    child: Text(
                      'Save Profile',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Edit Profile',
          style:
              GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context)),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType? keyboardType,
      TextCapitalization textCapitalization = TextCapitalization.none}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  void _saveProfile() {
    // Basic validation
    if (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty) {
      return;
    }

    final profile = UserProfile(
      id: widget.profile?.id, // Keep existing ID if updating
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      dob: _dob,
      nhsNumber: _nhsNumberController.text,
      gpPractice: _gpPracticeController.text,
      medicalConditions: widget.profile?.medicalConditions ??
          [], // Preserve or logic to edit later
      emergencyContacts: widget.profile?.emergencyContacts ?? [],
    );

    context.read<ProfileBloc>().add(ProfileEvent.saveProfile(profile));
    Navigator.pop(context);
  }
}
