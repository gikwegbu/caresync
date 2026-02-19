import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'dart:async';
import '../../../appointments/domain/usecases/watch_appointments.dart';
import '../../../prescriptions/domain/usecases/watch_prescriptions.dart';
import '../../../health_metrics/domain/usecases/get_health_metrics.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  final WatchAppointments _watchAppointments;
  final WatchPrescriptions _watchPrescriptions;
  final GetHealthMetrics _getHealthMetrics;

  StreamSubscription? _appointmentsSubscription;
  StreamSubscription? _prescriptionsSubscription;

  // Local state cache
  int _upcomingAppointmentsCount = 0;
  int _activePrescriptionsCount = 0;
  String _latestMetric = 'No data';
  String _userName = 'George'; // Hardcoded for now

  DashboardCubit(
    this._watchAppointments,
    this._watchPrescriptions,
    this._getHealthMetrics,
  ) : super(const DashboardState.initial());

  @override
  Future<void> close() {
    _appointmentsSubscription?.cancel();
    _prescriptionsSubscription?.cancel();
    return super.close();
  }

  Future<void> loadDashboardData() async {
    emit(const DashboardState.loading());

    // Cancel existing subscriptions to avoid duplicates if called multiple times
    await _appointmentsSubscription?.cancel();
    await _prescriptionsSubscription?.cancel();

    try {
      // Load initial metrics (still one-off for now)
      final metrics = await _getHealthMetrics();
      if (metrics.isNotEmpty) {
        metrics.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));
        _latestMetric = metrics.first.displayValue;
      }

      // Start listening to streams
      _appointmentsSubscription = _watchAppointments().listen((appointments) {
        final now = DateTime.now();
        _upcomingAppointmentsCount =
            appointments.where((a) => a.dateTime.isAfter(now)).length;
        _emitLoadedState();
      });

      _prescriptionsSubscription =
          _watchPrescriptions().listen((prescriptions) {
        // Assuming all in list are active/relevant for now
        _activePrescriptionsCount = prescriptions.length;
        _emitLoadedState();
      });
    } catch (e) {
      emit(DashboardState.error(e.toString()));
    }
  }

  void _emitLoadedState() {
    emit(DashboardState.loaded(
      userName: _userName,
      upcomingAppointmentCount: _upcomingAppointmentsCount,
      pendingPrescriptionsCount: _activePrescriptionsCount,
      latestMetric: _latestMetric,
    ));
  }
}
