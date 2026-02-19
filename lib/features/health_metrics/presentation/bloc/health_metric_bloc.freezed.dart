// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_metric_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HealthMetricEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMetrics,
    required TResult Function(HealthMetric metric) logMetric,
    required TResult Function(HealthMetric metric) updateMetric,
    required TResult Function(int id) deleteMetric,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMetrics,
    TResult? Function(HealthMetric metric)? logMetric,
    TResult? Function(HealthMetric metric)? updateMetric,
    TResult? Function(int id)? deleteMetric,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMetrics,
    TResult Function(HealthMetric metric)? logMetric,
    TResult Function(HealthMetric metric)? updateMetric,
    TResult Function(int id)? deleteMetric,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMetrics value) loadMetrics,
    required TResult Function(_LogMetric value) logMetric,
    required TResult Function(_UpdateMetric value) updateMetric,
    required TResult Function(_DeleteMetric value) deleteMetric,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMetrics value)? loadMetrics,
    TResult? Function(_LogMetric value)? logMetric,
    TResult? Function(_UpdateMetric value)? updateMetric,
    TResult? Function(_DeleteMetric value)? deleteMetric,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMetrics value)? loadMetrics,
    TResult Function(_LogMetric value)? logMetric,
    TResult Function(_UpdateMetric value)? updateMetric,
    TResult Function(_DeleteMetric value)? deleteMetric,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthMetricEventCopyWith<$Res> {
  factory $HealthMetricEventCopyWith(
          HealthMetricEvent value, $Res Function(HealthMetricEvent) then) =
      _$HealthMetricEventCopyWithImpl<$Res, HealthMetricEvent>;
}

/// @nodoc
class _$HealthMetricEventCopyWithImpl<$Res, $Val extends HealthMetricEvent>
    implements $HealthMetricEventCopyWith<$Res> {
  _$HealthMetricEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadMetricsImplCopyWith<$Res> {
  factory _$$LoadMetricsImplCopyWith(
          _$LoadMetricsImpl value, $Res Function(_$LoadMetricsImpl) then) =
      __$$LoadMetricsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMetricsImplCopyWithImpl<$Res>
    extends _$HealthMetricEventCopyWithImpl<$Res, _$LoadMetricsImpl>
    implements _$$LoadMetricsImplCopyWith<$Res> {
  __$$LoadMetricsImplCopyWithImpl(
      _$LoadMetricsImpl _value, $Res Function(_$LoadMetricsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMetricsImpl implements _LoadMetrics {
  const _$LoadMetricsImpl();

  @override
  String toString() {
    return 'HealthMetricEvent.loadMetrics()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMetricsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMetrics,
    required TResult Function(HealthMetric metric) logMetric,
    required TResult Function(HealthMetric metric) updateMetric,
    required TResult Function(int id) deleteMetric,
  }) {
    return loadMetrics();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMetrics,
    TResult? Function(HealthMetric metric)? logMetric,
    TResult? Function(HealthMetric metric)? updateMetric,
    TResult? Function(int id)? deleteMetric,
  }) {
    return loadMetrics?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMetrics,
    TResult Function(HealthMetric metric)? logMetric,
    TResult Function(HealthMetric metric)? updateMetric,
    TResult Function(int id)? deleteMetric,
    required TResult orElse(),
  }) {
    if (loadMetrics != null) {
      return loadMetrics();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMetrics value) loadMetrics,
    required TResult Function(_LogMetric value) logMetric,
    required TResult Function(_UpdateMetric value) updateMetric,
    required TResult Function(_DeleteMetric value) deleteMetric,
  }) {
    return loadMetrics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMetrics value)? loadMetrics,
    TResult? Function(_LogMetric value)? logMetric,
    TResult? Function(_UpdateMetric value)? updateMetric,
    TResult? Function(_DeleteMetric value)? deleteMetric,
  }) {
    return loadMetrics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMetrics value)? loadMetrics,
    TResult Function(_LogMetric value)? logMetric,
    TResult Function(_UpdateMetric value)? updateMetric,
    TResult Function(_DeleteMetric value)? deleteMetric,
    required TResult orElse(),
  }) {
    if (loadMetrics != null) {
      return loadMetrics(this);
    }
    return orElse();
  }
}

abstract class _LoadMetrics implements HealthMetricEvent {
  const factory _LoadMetrics() = _$LoadMetricsImpl;
}

/// @nodoc
abstract class _$$LogMetricImplCopyWith<$Res> {
  factory _$$LogMetricImplCopyWith(
          _$LogMetricImpl value, $Res Function(_$LogMetricImpl) then) =
      __$$LogMetricImplCopyWithImpl<$Res>;
  @useResult
  $Res call({HealthMetric metric});
}

/// @nodoc
class __$$LogMetricImplCopyWithImpl<$Res>
    extends _$HealthMetricEventCopyWithImpl<$Res, _$LogMetricImpl>
    implements _$$LogMetricImplCopyWith<$Res> {
  __$$LogMetricImplCopyWithImpl(
      _$LogMetricImpl _value, $Res Function(_$LogMetricImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metric = null,
  }) {
    return _then(_$LogMetricImpl(
      null == metric
          ? _value.metric
          : metric // ignore: cast_nullable_to_non_nullable
              as HealthMetric,
    ));
  }
}

/// @nodoc

class _$LogMetricImpl implements _LogMetric {
  const _$LogMetricImpl(this.metric);

  @override
  final HealthMetric metric;

  @override
  String toString() {
    return 'HealthMetricEvent.logMetric(metric: $metric)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogMetricImpl &&
            (identical(other.metric, metric) || other.metric == metric));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metric);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogMetricImplCopyWith<_$LogMetricImpl> get copyWith =>
      __$$LogMetricImplCopyWithImpl<_$LogMetricImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMetrics,
    required TResult Function(HealthMetric metric) logMetric,
    required TResult Function(HealthMetric metric) updateMetric,
    required TResult Function(int id) deleteMetric,
  }) {
    return logMetric(metric);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMetrics,
    TResult? Function(HealthMetric metric)? logMetric,
    TResult? Function(HealthMetric metric)? updateMetric,
    TResult? Function(int id)? deleteMetric,
  }) {
    return logMetric?.call(metric);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMetrics,
    TResult Function(HealthMetric metric)? logMetric,
    TResult Function(HealthMetric metric)? updateMetric,
    TResult Function(int id)? deleteMetric,
    required TResult orElse(),
  }) {
    if (logMetric != null) {
      return logMetric(metric);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMetrics value) loadMetrics,
    required TResult Function(_LogMetric value) logMetric,
    required TResult Function(_UpdateMetric value) updateMetric,
    required TResult Function(_DeleteMetric value) deleteMetric,
  }) {
    return logMetric(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMetrics value)? loadMetrics,
    TResult? Function(_LogMetric value)? logMetric,
    TResult? Function(_UpdateMetric value)? updateMetric,
    TResult? Function(_DeleteMetric value)? deleteMetric,
  }) {
    return logMetric?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMetrics value)? loadMetrics,
    TResult Function(_LogMetric value)? logMetric,
    TResult Function(_UpdateMetric value)? updateMetric,
    TResult Function(_DeleteMetric value)? deleteMetric,
    required TResult orElse(),
  }) {
    if (logMetric != null) {
      return logMetric(this);
    }
    return orElse();
  }
}

abstract class _LogMetric implements HealthMetricEvent {
  const factory _LogMetric(final HealthMetric metric) = _$LogMetricImpl;

  HealthMetric get metric;
  @JsonKey(ignore: true)
  _$$LogMetricImplCopyWith<_$LogMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateMetricImplCopyWith<$Res> {
  factory _$$UpdateMetricImplCopyWith(
          _$UpdateMetricImpl value, $Res Function(_$UpdateMetricImpl) then) =
      __$$UpdateMetricImplCopyWithImpl<$Res>;
  @useResult
  $Res call({HealthMetric metric});
}

/// @nodoc
class __$$UpdateMetricImplCopyWithImpl<$Res>
    extends _$HealthMetricEventCopyWithImpl<$Res, _$UpdateMetricImpl>
    implements _$$UpdateMetricImplCopyWith<$Res> {
  __$$UpdateMetricImplCopyWithImpl(
      _$UpdateMetricImpl _value, $Res Function(_$UpdateMetricImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metric = null,
  }) {
    return _then(_$UpdateMetricImpl(
      null == metric
          ? _value.metric
          : metric // ignore: cast_nullable_to_non_nullable
              as HealthMetric,
    ));
  }
}

/// @nodoc

class _$UpdateMetricImpl implements _UpdateMetric {
  const _$UpdateMetricImpl(this.metric);

  @override
  final HealthMetric metric;

  @override
  String toString() {
    return 'HealthMetricEvent.updateMetric(metric: $metric)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMetricImpl &&
            (identical(other.metric, metric) || other.metric == metric));
  }

  @override
  int get hashCode => Object.hash(runtimeType, metric);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMetricImplCopyWith<_$UpdateMetricImpl> get copyWith =>
      __$$UpdateMetricImplCopyWithImpl<_$UpdateMetricImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMetrics,
    required TResult Function(HealthMetric metric) logMetric,
    required TResult Function(HealthMetric metric) updateMetric,
    required TResult Function(int id) deleteMetric,
  }) {
    return updateMetric(metric);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMetrics,
    TResult? Function(HealthMetric metric)? logMetric,
    TResult? Function(HealthMetric metric)? updateMetric,
    TResult? Function(int id)? deleteMetric,
  }) {
    return updateMetric?.call(metric);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMetrics,
    TResult Function(HealthMetric metric)? logMetric,
    TResult Function(HealthMetric metric)? updateMetric,
    TResult Function(int id)? deleteMetric,
    required TResult orElse(),
  }) {
    if (updateMetric != null) {
      return updateMetric(metric);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMetrics value) loadMetrics,
    required TResult Function(_LogMetric value) logMetric,
    required TResult Function(_UpdateMetric value) updateMetric,
    required TResult Function(_DeleteMetric value) deleteMetric,
  }) {
    return updateMetric(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMetrics value)? loadMetrics,
    TResult? Function(_LogMetric value)? logMetric,
    TResult? Function(_UpdateMetric value)? updateMetric,
    TResult? Function(_DeleteMetric value)? deleteMetric,
  }) {
    return updateMetric?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMetrics value)? loadMetrics,
    TResult Function(_LogMetric value)? logMetric,
    TResult Function(_UpdateMetric value)? updateMetric,
    TResult Function(_DeleteMetric value)? deleteMetric,
    required TResult orElse(),
  }) {
    if (updateMetric != null) {
      return updateMetric(this);
    }
    return orElse();
  }
}

abstract class _UpdateMetric implements HealthMetricEvent {
  const factory _UpdateMetric(final HealthMetric metric) = _$UpdateMetricImpl;

  HealthMetric get metric;
  @JsonKey(ignore: true)
  _$$UpdateMetricImplCopyWith<_$UpdateMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteMetricImplCopyWith<$Res> {
  factory _$$DeleteMetricImplCopyWith(
          _$DeleteMetricImpl value, $Res Function(_$DeleteMetricImpl) then) =
      __$$DeleteMetricImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteMetricImplCopyWithImpl<$Res>
    extends _$HealthMetricEventCopyWithImpl<$Res, _$DeleteMetricImpl>
    implements _$$DeleteMetricImplCopyWith<$Res> {
  __$$DeleteMetricImplCopyWithImpl(
      _$DeleteMetricImpl _value, $Res Function(_$DeleteMetricImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteMetricImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteMetricImpl implements _DeleteMetric {
  const _$DeleteMetricImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'HealthMetricEvent.deleteMetric(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMetricImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMetricImplCopyWith<_$DeleteMetricImpl> get copyWith =>
      __$$DeleteMetricImplCopyWithImpl<_$DeleteMetricImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMetrics,
    required TResult Function(HealthMetric metric) logMetric,
    required TResult Function(HealthMetric metric) updateMetric,
    required TResult Function(int id) deleteMetric,
  }) {
    return deleteMetric(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMetrics,
    TResult? Function(HealthMetric metric)? logMetric,
    TResult? Function(HealthMetric metric)? updateMetric,
    TResult? Function(int id)? deleteMetric,
  }) {
    return deleteMetric?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMetrics,
    TResult Function(HealthMetric metric)? logMetric,
    TResult Function(HealthMetric metric)? updateMetric,
    TResult Function(int id)? deleteMetric,
    required TResult orElse(),
  }) {
    if (deleteMetric != null) {
      return deleteMetric(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMetrics value) loadMetrics,
    required TResult Function(_LogMetric value) logMetric,
    required TResult Function(_UpdateMetric value) updateMetric,
    required TResult Function(_DeleteMetric value) deleteMetric,
  }) {
    return deleteMetric(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMetrics value)? loadMetrics,
    TResult? Function(_LogMetric value)? logMetric,
    TResult? Function(_UpdateMetric value)? updateMetric,
    TResult? Function(_DeleteMetric value)? deleteMetric,
  }) {
    return deleteMetric?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMetrics value)? loadMetrics,
    TResult Function(_LogMetric value)? logMetric,
    TResult Function(_UpdateMetric value)? updateMetric,
    TResult Function(_DeleteMetric value)? deleteMetric,
    required TResult orElse(),
  }) {
    if (deleteMetric != null) {
      return deleteMetric(this);
    }
    return orElse();
  }
}

abstract class _DeleteMetric implements HealthMetricEvent {
  const factory _DeleteMetric(final int id) = _$DeleteMetricImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteMetricImplCopyWith<_$DeleteMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HealthMetricState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HealthMetric> metrics) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<HealthMetric> metrics)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HealthMetric> metrics)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthMetricStateCopyWith<$Res> {
  factory $HealthMetricStateCopyWith(
          HealthMetricState value, $Res Function(HealthMetricState) then) =
      _$HealthMetricStateCopyWithImpl<$Res, HealthMetricState>;
}

/// @nodoc
class _$HealthMetricStateCopyWithImpl<$Res, $Val extends HealthMetricState>
    implements $HealthMetricStateCopyWith<$Res> {
  _$HealthMetricStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HealthMetricStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HealthMetricState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HealthMetric> metrics) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<HealthMetric> metrics)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HealthMetric> metrics)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HealthMetricState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HealthMetricStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'HealthMetricState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HealthMetric> metrics) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<HealthMetric> metrics)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HealthMetric> metrics)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HealthMetricState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<HealthMetric> metrics});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$HealthMetricStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metrics = null,
  }) {
    return _then(_$LoadedImpl(
      null == metrics
          ? _value._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<HealthMetric>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<HealthMetric> metrics) : _metrics = metrics;

  final List<HealthMetric> _metrics;
  @override
  List<HealthMetric> get metrics {
    if (_metrics is EqualUnmodifiableListView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metrics);
  }

  @override
  String toString() {
    return 'HealthMetricState.loaded(metrics: $metrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._metrics, _metrics));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_metrics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HealthMetric> metrics) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(metrics);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<HealthMetric> metrics)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(metrics);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HealthMetric> metrics)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(metrics);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements HealthMetricState {
  const factory _Loaded(final List<HealthMetric> metrics) = _$LoadedImpl;

  List<HealthMetric> get metrics;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$HealthMetricStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HealthMetricState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HealthMetric> metrics) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<HealthMetric> metrics)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HealthMetric> metrics)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements HealthMetricState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
