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
        );
      },
      child: Scaffold(
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
                    color: Colors.white,
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
                    color: Colors.white,
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
}
