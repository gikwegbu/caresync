import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/health_metric.dart';
import '../../domain/usecases/get_health_metrics.dart';
import '../../domain/usecases/log_health_metric.dart';

import '../../domain/usecases/update_metric.dart';
import '../../domain/usecases/delete_metric.dart';

part 'health_metric_event.dart';
part 'health_metric_state.dart';
part 'health_metric_bloc.freezed.dart';

@injectable
class HealthMetricBloc extends Bloc<HealthMetricEvent, HealthMetricState> {
  final GetHealthMetrics _getHealthMetrics;
  final LogHealthMetric _logHealthMetric;
  final UpdateMetric _updateMetric;
  final DeleteMetric _deleteMetric;

  HealthMetricBloc(
    this._getHealthMetrics,
    this._logHealthMetric,
    this._updateMetric,
    this._deleteMetric,
  ) : super(const HealthMetricState.initial()) {
    on<_LoadMetrics>(_onLoadMetrics);
    on<_LogMetric>(_onLogMetric);
    on<_UpdateMetric>(_onUpdateMetric);
    on<_DeleteMetric>(_onDeleteMetric);
  }

  Future<void> _onLoadMetrics(
    _LoadMetrics event,
    Emitter<HealthMetricState> emit,
  ) async {
    emit(const HealthMetricState.loading());
    try {
      final metrics = await _getHealthMetrics();
      emit(HealthMetricState.loaded(metrics));
    } catch (e) {
      emit(HealthMetricState.error(e.toString()));
    }
  }

  Future<void> _onLogMetric(
    _LogMetric event,
    Emitter<HealthMetricState> emit,
  ) async {
    try {
      await _logHealthMetric(event.metric);
      add(const _LoadMetrics());
    } catch (e) {
      emit(HealthMetricState.error(e.toString()));
    }
  }

  Future<void> _onUpdateMetric(
    _UpdateMetric event,
    Emitter<HealthMetricState> emit,
  ) async {
    try {
      await _updateMetric(event.metric);
      add(const _LoadMetrics());
    } catch (e) {
      emit(HealthMetricState.error(e.toString()));
    }
  }

  Future<void> _onDeleteMetric(
    _DeleteMetric event,
    Emitter<HealthMetricState> emit,
  ) async {
    try {
      await _deleteMetric(event.id);
      add(const _LoadMetrics());
    } catch (e) {
      emit(HealthMetricState.error(e.toString()));
    }
  }
}
