import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/intro_bloc.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  bool _isLastPage = false;

  final List<OnboardingItem> _items = [
    OnboardingItem(
      title: 'Track Your Appointments',
      description:
          'Manage your GP and hospital appointments easily. Never miss a check-up again with smart reminders.',
      icon: Icons.calendar_month_rounded,
    ),
    OnboardingItem(
      title: 'Never Miss a Prescription',
      description:
          'Keep track of your medications and get notified when it\'s time to order a repeat prescription.',
      icon: Icons.medication_rounded,
    ),
    OnboardingItem(
      title: 'Monitor Your Health',
      description:
          'Log vital health metrics like blood pressure and weight. Visualize your progress over time.',
      icon: Icons.favorite_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroBloc, IntroState>(
      listener: (context, state) {
        state.mapOrNull(
          completed: (_) => context.go('/dashboard'),
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              // Skip Button
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: TextButton(
                    onPressed: () {
                      context
                          .read<IntroBloc>()
                          .add(const IntroEvent.complete());
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.inter(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _items.length,
                  onPageChanged: (index) {
                    setState(() {
                      _isLastPage = index == _items.length - 1;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _OnboardingSlide(item: _items[index]);
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: _items.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.nhsBlue,
                        dotColor: AppColors.nhsBlue.withOpacity(0.2),
                        dotHeight: 8.h,
                        dotWidth: 8.w,
                        expansionFactor: 3,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_isLastPage) {
                          context
                              .read<IntroBloc>()
                              .add(const IntroEvent.complete());
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(120.w, 48.h),
                      ),
                      child: Text(_isLastPage ? 'Get Started' : 'Next'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final IconData icon;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class _OnboardingSlide extends StatelessWidget {
  final OnboardingItem item;

  const _OnboardingSlide({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(40.w),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              item.icon,
              size: 80.w,
              color: AppColors.nhsBlue,
            ),
          )
              .animate()
              .scale(duration: 500.ms, curve: Curves.easeOutBack)
              .fadeIn(duration: 500.ms),
          SizedBox(height: 48.h),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ).animate().fadeIn(delay: 200.ms).moveY(begin: 20, end: 0),
          SizedBox(height: 16.h),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ).animate().fadeIn(delay: 300.ms).moveY(begin: 20, end: 0),
        ],
      ),
    );
  }
}
