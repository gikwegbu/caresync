import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/intro_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<IntroBloc>().add(const IntroEvent.checkStatus());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroBloc, IntroState>(
      listener: (context, state) {
        state.whenOrNull(
          required: () => context.go('/onboarding'),
          completed: () => context.go('/dashboard'),
          disclaimerRequired: () => _showDisclaimerDialog(context),
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.nhsBlue,
                AppColors.nhsLightBlue,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Placeholder (Heartbeat animation)
                Container(
                  width: 120.w,
                  height: 120.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      size: 60.w,
                      color: AppColors.nhsBlue,
                    ),
                  ),
                )
                    .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true))
                    .scale(
                      duration: 1.seconds,
                      begin: const Offset(0.9, 0.9),
                      end: const Offset(1.1, 1.1),
                      curve: Curves.easeInOut,
                    ),

                SizedBox(height: 24.h),

                Text(
                  'CareSync',
                  style: GoogleFonts.poppins(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.surface,
                    letterSpacing: 1.2,
                  ),
                ).animate().fadeIn(duration: 600.ms).moveY(begin: 20, end: 0),

                SizedBox(height: 8.h),

                Text(
                  'Your Health, Simplified',
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ).animate().fadeIn(delay: 300.ms, duration: 600.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDisclaimerDialog(BuildContext context) {
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
}
