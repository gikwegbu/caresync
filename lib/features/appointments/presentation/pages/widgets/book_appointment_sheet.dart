import 'package:care_sync/features/appointments/domain/entities/appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../bloc/appointment_bloc.dart';

class BookAppointmentSheet extends StatefulWidget {
  final Appointment? appointment;

  const BookAppointmentSheet({super.key, this.appointment});

  @override
  State<BookAppointmentSheet> createState() => _BookAppointmentSheetState();
}

class _BookAppointmentSheetState extends State<BookAppointmentSheet> {
  // Form State
  late String _selectedType;
  late DateTime _selectedDate;
  late String _selectedTime;
  late TextEditingController _notesController;

  // Steps: 0=Type, 1=Date, 2=Time/Notes, 3=Confirm
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    if (widget.appointment != null) {
      _selectedType = widget.appointment!.specialty;
      _selectedDate = widget.appointment!.dateTime;
      _selectedTime = DateFormat('HH:mm').format(widget.appointment!.dateTime);
      _notesController = TextEditingController(text: widget.appointment!.notes);
    } else {
      _selectedType = 'GP';
      _selectedDate = DateTime.now().add(const Duration(days: 1));
      _selectedTime = '09:00';
      _notesController = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.85.sh,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: _buildStepContent(),
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          if (_currentStep > 0)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => setState(() => _currentStep--),
            )
          else
            const SizedBox(width: 48), // Spacer

          Expanded(
            child: Text(
              widget.appointment != null
                  ? 'Edit Appointment'
                  : 'Book Appointment',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildTypeStep();
      case 1:
        return _buildDateStep();
      case 2:
        return _buildTimeNotesStep();
      case 3:
        return _buildConfirmStep();
      default:
        return const SizedBox();
    }
  }

  Widget _buildTypeStep() {
    final types = [
      'GP',
      'Specialist',
      'Dental',
      'Mental Health',
      'Physiotherapy'
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Appointment Type',
          style: GoogleFonts.getFont('Inter',
              fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.h),
        ...types.map((type) => RadioListTile<String>(
              title: Text(type),
              value: type,
              groupValue: _selectedType,
              activeColor: AppColors.nhsBlue,
              onChanged: (val) => setState(() => _selectedType = val!),
              contentPadding: EdgeInsets.zero,
            )),
      ],
    );
  }

  Widget _buildDateStep() {
    return Column(
      children: [
        Text(
          'Select Date',
          style: GoogleFonts.getFont('Inter',
              fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24.h),
        CalendarDatePicker(
          initialDate: _selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 90)),
          onDateChanged: (date) => setState(() => _selectedDate = date),
        ),
      ],
    );
  }

  Widget _buildTimeNotesStep() {
    final times = [
      '09:00',
      '09:30',
      '10:00',
      '10:30',
      '11:00',
      '14:00',
      '14:30',
      '15:00'
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Available Slots',
            style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: times
              .map((time) => ChoiceChip(
                    label: Text(time),
                    selected: _selectedTime == time,
                    onSelected: (selected) =>
                        setState(() => _selectedTime = time),
                    selectedColor: AppColors.nhsBlue,
                    labelStyle: TextStyle(
                        color: _selectedTime == time
                            ? Colors.white
                            : Colors.black),
                  ))
              .toList(),
        ),
        SizedBox(height: 24.h),
        Text('Notes (Optional)',
            style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
        SizedBox(height: 8.h),
        TextField(
          controller: _notesController,
          maxLines: 3,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Describe your symptoms or reason for visit...',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmStep() {
    return Column(
      children: [
        Icon(Icons.check_circle_outline, size: 80.w, color: AppColors.nhsGreen),
        SizedBox(height: 16.h),
        Text('Confirm Booking',
            style: GoogleFonts.poppins(
                fontSize: 22.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 24.h),
        _buildSummaryRow('Type', _selectedType),
        _buildSummaryRow(
            'Date', DateFormat('EEE, d MMM').format(_selectedDate)),
        _buildSummaryRow('Time', _selectedTime),
        _buildSummaryRow('Location',
            'City General Practice'), // Hardcoded for simplified flow
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.inter(color: Colors.grey)),
          Text(value, style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(
          onPressed: () {
            if (_currentStep < 3) {
              setState(() => _currentStep++);
            } else {
              _confirmBooking();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.nhsBlue,
            foregroundColor: Colors.white,
          ),
          child: Text(_currentStep == 3
              ? (widget.appointment != null
                  ? 'Confirm Update'
                  : 'Confirm & Book')
              : 'Continue'),
        ),
      ),
    );
  }

  void _confirmBooking() {
    // Parse time and date
    final timeParts = _selectedTime.split(':');
    final dateTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      int.parse(timeParts[0]),
      int.parse(timeParts[1]),
    );

    final appointment = Appointment(
      id: widget.appointment?.id,
      doctorName: 'Dr. Smith', // Placeholder logic
      specialty: _selectedType,
      dateTime: dateTime,
      location: 'City General Practice',
      status: 'upcoming',
      notes: _notesController.text,
    );

    if (widget.appointment != null) {
      context
          .read<AppointmentBloc>()
          .add(AppointmentEvent.updateAppointment(appointment));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Appointment Updated Successfully')),
      );
    } else {
      context
          .read<AppointmentBloc>()
          .add(AppointmentEvent.bookAppointment(appointment));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Appointment Booked Successfully')),
      );
    }
    Navigator.pop(context);
  }
}
