import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState.initial());

  Future<void> loadDashboardData() async {
    emit(const DashboardState.loading());
    try {
      // Simulate API/DB delay
      await Future.delayed(const Duration(seconds: 1));

      // TODO: Fetch real data from repositories
      // final appointments = await _appointmentRepository.getUpcoming();
      // final metrics = await _healthMetricRepository.getRecent();

      emit(const DashboardState.loaded(
        userName: 'George', // Hardcoded for now until Profile feature
        upcomingAppointmentCount: 2,
        pendingPrescriptionsCount: 1,
        latestMetric: '120/80 mmHg',
      ));
    } catch (e) {
      emit(DashboardState.error(e.toString()));
    }
  }
}
