// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i4;

import 'core/database/database_module.dart' as _i47;
import 'core/network/api_client.dart' as _i11;
import 'core/network/network_module.dart' as _i46;
import 'features/appointments/data/datasources/appointment_local_datasource.dart'
    as _i17;
import 'features/appointments/data/repositories/appointment_repository_impl.dart'
    as _i19;
import 'features/appointments/domain/repositories/appointment_repository.dart'
    as _i18;
import 'features/appointments/domain/usecases/book_appointment.dart' as _i20;
import 'features/appointments/domain/usecases/cancel_appointment.dart' as _i21;
import 'features/appointments/domain/usecases/delete_appointment.dart' as _i22;
import 'features/appointments/domain/usecases/get_appointments.dart' as _i24;
import 'features/appointments/domain/usecases/update_appointment.dart' as _i35;
import 'features/appointments/domain/usecases/watch_appointments.dart' as _i37;
import 'features/appointments/presentation/bloc/appointment_bloc.dart' as _i38;
import 'features/dashboard/presentation/bloc/dashboard_cubit.dart' as _i45;
import 'features/health_metrics/data/datasources/health_metric_local_datasource.dart'
    as _i27;
import 'features/health_metrics/data/repositories/health_metric_repository_impl.dart'
    as _i29;
import 'features/health_metrics/domain/repositories/health_metric_repository.dart'
    as _i28;
import 'features/health_metrics/domain/usecases/delete_metric.dart' as _i41;
import 'features/health_metrics/domain/usecases/get_health_metrics.dart'
    as _i42;
import 'features/health_metrics/domain/usecases/log_health_metric.dart' as _i32;
import 'features/health_metrics/domain/usecases/update_metric.dart' as _i36;
import 'features/health_metrics/presentation/bloc/health_metric_bloc.dart'
    as _i43;
import 'features/intro/data/repositories/intro_repository_impl.dart' as _i31;
import 'features/intro/domain/repositories/intro_repository.dart' as _i30;
import 'features/intro/domain/usecases/check_onboarding_status.dart' as _i39;
import 'features/intro/domain/usecases/complete_onboarding.dart' as _i40;
import 'features/intro/presentation/bloc/intro_bloc.dart' as _i44;
import 'features/prescriptions/data/datasources/prescription_local_datasource.dart'
    as _i5;
import 'features/prescriptions/data/repositories/prescription_repository_impl.dart'
    as _i7;
import 'features/prescriptions/domain/repositories/prescription_repository.dart'
    as _i6;
import 'features/prescriptions/domain/usecases/add_prescription.dart' as _i16;
import 'features/prescriptions/domain/usecases/delete_prescription.dart'
    as _i23;
import 'features/prescriptions/domain/usecases/get_prescriptions.dart' as _i25;
import 'features/prescriptions/domain/usecases/toggle_prescription_reminder.dart'
    as _i13;
import 'features/prescriptions/domain/usecases/update_prescription.dart'
    as _i14;
import 'features/prescriptions/domain/usecases/watch_prescriptions.dart'
    as _i15;
import 'features/prescriptions/presentation/bloc/prescription_bloc.dart'
    as _i33;
import 'features/profile/data/datasources/profile_local_datasource.dart' as _i8;
import 'features/profile/data/repositories/profile_repository_impl.dart'
    as _i10;
import 'features/profile/domain/repositories/profile_repository.dart' as _i9;
import 'features/profile/domain/usecases/get_user_profile.dart' as _i26;
import 'features/profile/domain/usecases/save_user_profile.dart' as _i12;
import 'features/profile/presentation/bloc/profile_bloc.dart' as _i34;

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
    gh.lazySingleton<_i3.Dio>(() => networkModule.dio);
    await gh.factoryAsync<_i4.Isar>(
      () => databaseModule.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i5.PrescriptionLocalDataSource>(
        () => _i5.IsarPrescriptionDataSource(gh<_i4.Isar>()));
    gh.lazySingleton<_i6.PrescriptionRepository>(() =>
        _i7.PrescriptionRepositoryImpl(gh<_i5.PrescriptionLocalDataSource>()));
    gh.lazySingleton<_i8.ProfileLocalDataSource>(
        () => _i8.IsarProfileDataSource(gh<_i4.Isar>()));
    gh.lazySingleton<_i9.ProfileRepository>(
        () => _i10.ProfileRepositoryImpl(gh<_i8.ProfileLocalDataSource>()));
    gh.lazySingleton<_i11.RestClient>(() => networkModule.restClient);
    gh.lazySingleton<_i12.SaveUserProfile>(
        () => _i12.SaveUserProfile(gh<_i9.ProfileRepository>()));
    gh.lazySingleton<_i13.TogglePrescriptionReminder>(() =>
        _i13.TogglePrescriptionReminder(gh<_i6.PrescriptionRepository>()));
    gh.lazySingleton<_i14.UpdatePrescription>(
        () => _i14.UpdatePrescription(gh<_i6.PrescriptionRepository>()));
    gh.lazySingleton<_i15.WatchPrescriptions>(
        () => _i15.WatchPrescriptions(gh<_i6.PrescriptionRepository>()));
    gh.lazySingleton<_i16.AddPrescription>(
        () => _i16.AddPrescription(gh<_i6.PrescriptionRepository>()));
    gh.lazySingleton<_i17.AppointmentLocalDataSource>(
        () => _i17.IsarAppointmentDataSource(gh<_i4.Isar>()));
    gh.lazySingleton<_i18.AppointmentRepository>(() =>
        _i19.AppointmentRepositoryImpl(gh<_i17.AppointmentLocalDataSource>()));
    gh.lazySingleton<_i20.BookAppointment>(
        () => _i20.BookAppointment(gh<_i18.AppointmentRepository>()));
    gh.lazySingleton<_i21.CancelAppointment>(
        () => _i21.CancelAppointment(gh<_i18.AppointmentRepository>()));
    gh.lazySingleton<_i22.DeleteAppointment>(
        () => _i22.DeleteAppointment(gh<_i18.AppointmentRepository>()));
    gh.lazySingleton<_i23.DeletePrescription>(
        () => _i23.DeletePrescription(gh<_i6.PrescriptionRepository>()));
    gh.lazySingleton<_i24.GetAppointments>(
        () => _i24.GetAppointments(gh<_i18.AppointmentRepository>()));
    gh.lazySingleton<_i25.GetPrescriptions>(
        () => _i25.GetPrescriptions(gh<_i6.PrescriptionRepository>()));
    gh.lazySingleton<_i26.GetUserProfile>(
        () => _i26.GetUserProfile(gh<_i9.ProfileRepository>()));
    gh.lazySingleton<_i27.HealthMetricLocalDataSource>(
        () => _i27.IsarHealthMetricDataSource(gh<_i4.Isar>()));
    gh.lazySingleton<_i28.HealthMetricRepository>(() =>
        _i29.HealthMetricRepositoryImpl(
            gh<_i27.HealthMetricLocalDataSource>()));
    gh.lazySingleton<_i30.IntroRepository>(
        () => _i31.IntroRepositoryImpl(gh<_i4.Isar>()));
    gh.lazySingleton<_i32.LogHealthMetric>(
        () => _i32.LogHealthMetric(gh<_i28.HealthMetricRepository>()));
    gh.factory<_i33.PrescriptionBloc>(() => _i33.PrescriptionBloc(
          gh<_i15.WatchPrescriptions>(),
          gh<_i13.TogglePrescriptionReminder>(),
          gh<_i23.DeletePrescription>(),
          gh<_i16.AddPrescription>(),
          gh<_i14.UpdatePrescription>(),
        ));
    gh.factory<_i34.ProfileBloc>(() => _i34.ProfileBloc(
          gh<_i26.GetUserProfile>(),
          gh<_i12.SaveUserProfile>(),
        ));
    gh.lazySingleton<_i35.UpdateAppointment>(
        () => _i35.UpdateAppointment(gh<_i18.AppointmentRepository>()));
    gh.lazySingleton<_i36.UpdateMetric>(
        () => _i36.UpdateMetric(gh<_i28.HealthMetricRepository>()));
    gh.lazySingleton<_i37.WatchAppointments>(
        () => _i37.WatchAppointments(gh<_i18.AppointmentRepository>()));
    gh.factory<_i38.AppointmentBloc>(() => _i38.AppointmentBloc(
          gh<_i37.WatchAppointments>(),
          gh<_i20.BookAppointment>(),
          gh<_i21.CancelAppointment>(),
          gh<_i22.DeleteAppointment>(),
          gh<_i35.UpdateAppointment>(),
        ));
    gh.lazySingleton<_i39.CheckOnboardingStatus>(
        () => _i39.CheckOnboardingStatus(gh<_i30.IntroRepository>()));
    gh.lazySingleton<_i40.CompleteOnboarding>(
        () => _i40.CompleteOnboarding(gh<_i30.IntroRepository>()));
    gh.lazySingleton<_i41.DeleteMetric>(
        () => _i41.DeleteMetric(gh<_i28.HealthMetricRepository>()));
    gh.lazySingleton<_i42.GetHealthMetrics>(
        () => _i42.GetHealthMetrics(gh<_i28.HealthMetricRepository>()));
    gh.factory<_i43.HealthMetricBloc>(() => _i43.HealthMetricBloc(
          gh<_i42.GetHealthMetrics>(),
          gh<_i32.LogHealthMetric>(),
          gh<_i36.UpdateMetric>(),
          gh<_i41.DeleteMetric>(),
        ));
    gh.factory<_i44.IntroBloc>(() => _i44.IntroBloc(
          gh<_i39.CheckOnboardingStatus>(),
          gh<_i40.CompleteOnboarding>(),
        ));
    gh.factory<_i45.DashboardCubit>(() => _i45.DashboardCubit(
          gh<_i37.WatchAppointments>(),
          gh<_i15.WatchPrescriptions>(),
          gh<_i42.GetHealthMetrics>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i46.NetworkModule {}

class _$DatabaseModule extends _i47.DatabaseModule {}
