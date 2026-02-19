// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i5;

import 'core/database/database_module.dart' as _i38;
import 'core/network/api_client.dart' as _i12;
import 'core/network/network_module.dart' as _i37;
import 'features/appointments/data/datasources/appointment_local_datasource.dart'
    as _i15;
import 'features/appointments/data/repositories/appointment_repository_impl.dart'
    as _i17;
import 'features/appointments/domain/repositories/appointment_repository.dart'
    as _i16;
import 'features/appointments/domain/usecases/book_appointment.dart' as _i18;
import 'features/appointments/domain/usecases/cancel_appointment.dart' as _i19;
import 'features/appointments/domain/usecases/get_appointments.dart' as _i20;
import 'features/appointments/presentation/bloc/appointment_bloc.dart' as _i31;
import 'features/dashboard/presentation/bloc/dashboard_cubit.dart' as _i3;
import 'features/health_metrics/data/datasources/health_metric_local_datasource.dart'
    as _i23;
import 'features/health_metrics/data/repositories/health_metric_repository_impl.dart'
    as _i25;
import 'features/health_metrics/domain/repositories/health_metric_repository.dart'
    as _i24;
import 'features/health_metrics/domain/usecases/get_health_metrics.dart'
    as _i34;
import 'features/health_metrics/domain/usecases/log_health_metric.dart' as _i28;
import 'features/health_metrics/presentation/bloc/health_metric_bloc.dart'
    as _i35;
import 'features/intro/data/repositories/intro_repository_impl.dart' as _i27;
import 'features/intro/domain/repositories/intro_repository.dart' as _i26;
import 'features/intro/domain/usecases/check_onboarding_status.dart' as _i32;
import 'features/intro/domain/usecases/complete_onboarding.dart' as _i33;
import 'features/intro/presentation/bloc/intro_bloc.dart' as _i36;
import 'features/prescriptions/data/datasources/prescription_local_datasource.dart'
    as _i6;
import 'features/prescriptions/data/repositories/prescription_repository_impl.dart'
    as _i8;
import 'features/prescriptions/domain/repositories/prescription_repository.dart'
    as _i7;
import 'features/prescriptions/domain/usecases/get_prescriptions.dart' as _i21;
import 'features/prescriptions/domain/usecases/toggle_prescription_reminder.dart'
    as _i14;
import 'features/prescriptions/presentation/bloc/prescription_bloc.dart'
    as _i29;
import 'features/profile/data/datasources/profile_local_datasource.dart' as _i9;
import 'features/profile/data/repositories/profile_repository_impl.dart'
    as _i11;
import 'features/profile/domain/repositories/profile_repository.dart' as _i10;
import 'features/profile/domain/usecases/get_user_profile.dart' as _i22;
import 'features/profile/domain/usecases/save_user_profile.dart' as _i13;
import 'features/profile/presentation/bloc/profile_bloc.dart' as _i30;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final databaseModule = _$DatabaseModule();
    gh.factory<_i3.DashboardCubit>(() => _i3.DashboardCubit());
    gh.lazySingleton<_i4.Dio>(() => networkModule.dio);
    await gh.factoryAsync<_i5.Isar>(
      () => databaseModule.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i6.PrescriptionLocalDataSource>(
        () => _i6.IsarPrescriptionDataSource(gh<_i5.Isar>()));
    gh.lazySingleton<_i7.PrescriptionRepository>(() =>
        _i8.PrescriptionRepositoryImpl(gh<_i6.PrescriptionLocalDataSource>()));
    gh.lazySingleton<_i9.ProfileLocalDataSource>(
        () => _i9.IsarProfileDataSource(gh<_i5.Isar>()));
    gh.lazySingleton<_i10.ProfileRepository>(
        () => _i11.ProfileRepositoryImpl(gh<_i9.ProfileLocalDataSource>()));
    gh.lazySingleton<_i12.RestClient>(() => networkModule.restClient);
    gh.lazySingleton<_i13.SaveUserProfile>(
        () => _i13.SaveUserProfile(gh<_i10.ProfileRepository>()));
    gh.lazySingleton<_i14.TogglePrescriptionReminder>(() =>
        _i14.TogglePrescriptionReminder(gh<_i7.PrescriptionRepository>()));
    gh.lazySingleton<_i15.AppointmentLocalDataSource>(
        () => _i15.IsarAppointmentDataSource(gh<_i5.Isar>()));
    gh.lazySingleton<_i16.AppointmentRepository>(() =>
        _i17.AppointmentRepositoryImpl(gh<_i15.AppointmentLocalDataSource>()));
    gh.lazySingleton<_i18.BookAppointment>(
        () => _i18.BookAppointment(gh<_i16.AppointmentRepository>()));
    gh.lazySingleton<_i19.CancelAppointment>(
        () => _i19.CancelAppointment(gh<_i16.AppointmentRepository>()));
    gh.lazySingleton<_i20.GetAppointments>(
        () => _i20.GetAppointments(gh<_i16.AppointmentRepository>()));
    gh.lazySingleton<_i21.GetPrescriptions>(
        () => _i21.GetPrescriptions(gh<_i7.PrescriptionRepository>()));
    gh.lazySingleton<_i22.GetUserProfile>(
        () => _i22.GetUserProfile(gh<_i10.ProfileRepository>()));
    gh.lazySingleton<_i23.HealthMetricLocalDataSource>(
        () => _i23.IsarHealthMetricDataSource(gh<_i5.Isar>()));
    gh.lazySingleton<_i24.HealthMetricRepository>(() =>
        _i25.HealthMetricRepositoryImpl(
            gh<_i23.HealthMetricLocalDataSource>()));
    gh.lazySingleton<_i26.IntroRepository>(
        () => _i27.IntroRepositoryImpl(gh<_i5.Isar>()));
    gh.lazySingleton<_i28.LogHealthMetric>(
        () => _i28.LogHealthMetric(gh<_i24.HealthMetricRepository>()));
    gh.factory<_i29.PrescriptionBloc>(() => _i29.PrescriptionBloc(
          gh<_i21.GetPrescriptions>(),
          gh<_i14.TogglePrescriptionReminder>(),
        ));
    gh.factory<_i30.ProfileBloc>(() => _i30.ProfileBloc(
          gh<_i22.GetUserProfile>(),
          gh<_i13.SaveUserProfile>(),
        ));
    gh.factory<_i31.AppointmentBloc>(() => _i31.AppointmentBloc(
          gh<_i20.GetAppointments>(),
          gh<_i18.BookAppointment>(),
          gh<_i19.CancelAppointment>(),
        ));
    gh.lazySingleton<_i32.CheckOnboardingStatus>(
        () => _i32.CheckOnboardingStatus(gh<_i26.IntroRepository>()));
    gh.lazySingleton<_i33.CompleteOnboarding>(
        () => _i33.CompleteOnboarding(gh<_i26.IntroRepository>()));
    gh.lazySingleton<_i34.GetHealthMetrics>(
        () => _i34.GetHealthMetrics(gh<_i24.HealthMetricRepository>()));
    gh.factory<_i35.HealthMetricBloc>(() => _i35.HealthMetricBloc(
          gh<_i34.GetHealthMetrics>(),
          gh<_i28.LogHealthMetric>(),
        ));
    gh.factory<_i36.IntroBloc>(() => _i36.IntroBloc(
          gh<_i32.CheckOnboardingStatus>(),
          gh<_i33.CompleteOnboarding>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i37.NetworkModule {}

class _$DatabaseModule extends _i38.DatabaseModule {}
