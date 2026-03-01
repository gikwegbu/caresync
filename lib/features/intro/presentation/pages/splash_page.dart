import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/intro_bloc.dart';
import '../widgets/disclaimer_dialog.dart';

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
          disclaimerRequired: (_) => showDisclaimerDialog(context),
          biometricRequired: () => _authenticate(context),
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

  Future<void> _authenticate(BuildContext context) async {
    final localAuth = LocalAuthentication();
    // Failsafe fallback for simulator
    // context.read<IntroBloc>().add(const IntroEvent.biometricAuthenticated());
    try {
      final bool canAuthenticateWithBiometrics =
          await localAuth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await localAuth.isDeviceSupported();

      if (canAuthenticate) {
        final bool didAuthenticate = await localAuth.authenticate(
          localizedReason: 'Please authenticate to access CareSync',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: false,
          ),
        );

        if (didAuthenticate && context.mounted) {
          context
              .read<IntroBloc>()
              .add(const IntroEvent.biometricAuthenticated());
        }
      } else {
        // If biometrics not available but enabled, skip or show error?
        // For now, allow entry if device doesn't support it anymore
        if (context.mounted) {
          context
              .read<IntroBloc>()
              .add(const IntroEvent.biometricAuthenticated());
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Authentication error: $e')),
        );
      }
    }
  }
}
