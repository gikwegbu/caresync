import 'package:care_sync/features/dashboard/presentation/bloc/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'features/appointments/presentation/bloc/appointment_bloc.dart';
import 'features/health_metrics/presentation/bloc/health_metric_bloc.dart';
import 'features/intro/presentation/bloc/intro_bloc.dart';
import 'features/prescriptions/presentation/bloc/prescription_bloc.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const CareSyncApp());
}

class CareSyncApp extends StatelessWidget {
  const CareSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852), // iPhone 14 Pro dimensions
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ThemeCubit()),
            BlocProvider(create: (_) => getIt<DashboardCubit>()),
            BlocProvider(create: (_) => getIt<AppointmentBloc>()),
            BlocProvider(create: (_) => getIt<HealthMetricBloc>()),
            BlocProvider(create: (_) => getIt<IntroBloc>()),
            BlocProvider(create: (_) => getIt<PrescriptionBloc>()),
            BlocProvider(create: (_) => getIt<ProfileBloc>()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp.router(
                title: 'CareSync',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
                routerConfig: AppRouter.router,
              );
            },
          ),
        );
      },
    );
  }
}
