import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/intro_bloc.dart';

void showDisclaimerDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text(
            'About This App & Data Privacy',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ),
          ),
          content: SingleChildScrollView(
            child: Text(
              "This app is a personalised project built for individual use. By continuing, you acknowledge that you are choosing to use this app of your own accord.\n\nYour health data is stored locally on your device and is not transmitted to any external server, except when you choose to use the AI Chatbot feature, at which point your reading data is sent to Google's Gemini API for analysis.\n\nBy using this app, you accept these terms.",
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                height: 1.5,
              ),
            ),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.nhsBlue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  context
                      .read<IntroBloc>()
                      .add(const IntroEvent.acceptDisclaimer());
                },
                child: Text(
                  'I Understand & Continue',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
