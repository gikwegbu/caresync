import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/prescription.dart';
import '../bloc/prescription_bloc.dart';

class PrescriptionFormPage extends StatefulWidget {
  final Prescription? prescription;

  const PrescriptionFormPage({super.key, this.prescription});

  @override
  State<PrescriptionFormPage> createState() => _PrescriptionFormPageState();
}

class _PrescriptionFormPageState extends State<PrescriptionFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _dosageController;
  late TextEditingController _frequencyController;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.prescription?.medicationName ?? '');
    _dosageController =
        TextEditingController(text: widget.prescription?.dosage ?? '');
    _frequencyController =
        TextEditingController(text: widget.prescription?.frequency ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _frequencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.prescription != null;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Prescription' : 'New Prescription',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(
                controller: _nameController,
                label: 'Medication Name',
                hint: 'e.g., Amoxicillin',
                textCapitalization: TextCapitalization.words,
                validator: (v) =>
                    v?.isEmpty == true ? 'Please enter medication name' : null,
              ),
              SizedBox(height: 16.h),
              _buildTextField(
                controller: _dosageController,
                label: 'Dosage',
                hint: 'e.g., 500mg',
                validator: (v) =>
                    v?.isEmpty == true ? 'Please enter dosage' : null,
              ),
              SizedBox(height: 16.h),
              _buildTextField(
                controller: _frequencyController,
                label: 'Frequency',
                hint: 'e.g., 3 times a day',
                textCapitalization: TextCapitalization.sentences,
                validator: (v) =>
                    v?.isEmpty == true ? 'Please enter frequency' : null,
              ),
              SizedBox(height: 32.h),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.nhsBlue,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  isEditing ? 'Update Prescription' : 'Save Prescription',
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    String? Function(String?)? validator,
    int maxLines = 1,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          textCapitalization: textCapitalization,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(color: Colors.grey.shade400),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.nhsBlue, width: 2),
            ),
            contentPadding: EdgeInsets.all(16.w),
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final startDate = widget.prescription?.startDate ?? DateTime.now();
      // Defaulting to 30 days if not set, or keeping existing duration
      final endDate = widget.prescription?.endDate ??
          startDate.add(const Duration(days: 30));

      final prescription = Prescription(
        id: widget.prescription?.id,
        medicationName: _nameController.text,
        dosage: _dosageController.text,
        frequency: _frequencyController.text,
        startDate: startDate,
        endDate: endDate,
        status: widget.prescription?.status ?? 'active',
        reminderEnabled: widget.prescription?.reminderEnabled ?? true,
      );

      if (widget.prescription != null) {
        context
            .read<PrescriptionBloc>()
            .add(PrescriptionEvent.updatePrescription(prescription));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Prescription Updated Successfully')),
        );
      } else {
        context
            .read<PrescriptionBloc>()
            .add(PrescriptionEvent.addPrescription(prescription));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Prescription Added Successfully')),
        );
      }
      Navigator.pop(context);
    }
  }
}
