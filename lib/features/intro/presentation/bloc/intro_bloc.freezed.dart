// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intro_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IntroEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function() complete,
    required TResult Function() acceptDisclaimer,
    required TResult Function() biometricAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function()? complete,
    TResult? Function()? acceptDisclaimer,
    TResult? Function()? biometricAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function()? complete,
    TResult Function()? acceptDisclaimer,
    TResult Function()? biometricAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_Complete value) complete,
    required TResult Function(_AcceptDisclaimer value) acceptDisclaimer,
    required TResult Function(_BiometricAuthenticated value)
        biometricAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_AcceptDisclaimer value)? acceptDisclaimer,
    TResult? Function(_BiometricAuthenticated value)? biometricAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_Complete value)? complete,
    TResult Function(_AcceptDisclaimer value)? acceptDisclaimer,
    TResult Function(_BiometricAuthenticated value)? biometricAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroEventCopyWith<$Res> {
  factory $IntroEventCopyWith(
          IntroEvent value, $Res Function(IntroEvent) then) =
      _$IntroEventCopyWithImpl<$Res, IntroEvent>;
}

/// @nodoc
class _$IntroEventCopyWithImpl<$Res, $Val extends IntroEvent>
    implements $IntroEventCopyWith<$Res> {
  _$IntroEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckStatusImplCopyWith<$Res> {
  factory _$$CheckStatusImplCopyWith(
          _$CheckStatusImpl value, $Res Function(_$CheckStatusImpl) then) =
      __$$CheckStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckStatusImplCopyWithImpl<$Res>
    extends _$IntroEventCopyWithImpl<$Res, _$CheckStatusImpl>
    implements _$$CheckStatusImplCopyWith<$Res> {
  __$$CheckStatusImplCopyWithImpl(
      _$CheckStatusImpl _value, $Res Function(_$CheckStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckStatusImpl implements _CheckStatus {
  const _$CheckStatusImpl();

  @override
  String toString() {
    return 'IntroEvent.checkStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function() complete,
    required TResult Function() acceptDisclaimer,
    required TResult Function() biometricAuthenticated,
  }) {
    return checkStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function()? complete,
    TResult? Function()? acceptDisclaimer,
    TResult? Function()? biometricAuthenticated,
  }) {
    return checkStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function()? complete,
    TResult Function()? acceptDisclaimer,
    TResult Function()? biometricAuthenticated,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_Complete value) complete,
    required TResult Function(_AcceptDisclaimer value) acceptDisclaimer,
    required TResult Function(_BiometricAuthenticated value)
        biometricAuthenticated,
  }) {
    return checkStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_AcceptDisclaimer value)? acceptDisclaimer,
    TResult? Function(_BiometricAuthenticated value)? biometricAuthenticated,
  }) {
    return checkStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_Complete value)? complete,
    TResult Function(_AcceptDisclaimer value)? acceptDisclaimer,
    TResult Function(_BiometricAuthenticated value)? biometricAuthenticated,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckStatus implements IntroEvent {
  const factory _CheckStatus() = _$CheckStatusImpl;
}

/// @nodoc
abstract class _$$CompleteImplCopyWith<$Res> {
  factory _$$CompleteImplCopyWith(
          _$CompleteImpl value, $Res Function(_$CompleteImpl) then) =
      __$$CompleteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompleteImplCopyWithImpl<$Res>
    extends _$IntroEventCopyWithImpl<$Res, _$CompleteImpl>
    implements _$$CompleteImplCopyWith<$Res> {
  __$$CompleteImplCopyWithImpl(
      _$CompleteImpl _value, $Res Function(_$CompleteImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CompleteImpl implements _Complete {
  const _$CompleteImpl();

  @override
  String toString() {
    return 'IntroEvent.complete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompleteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function() complete,
    required TResult Function() acceptDisclaimer,
    required TResult Function() biometricAuthenticated,
  }) {
    return complete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function()? complete,
    TResult? Function()? acceptDisclaimer,
    TResult? Function()? biometricAuthenticated,
  }) {
    return complete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function()? complete,
    TResult Function()? acceptDisclaimer,
    TResult Function()? biometricAuthenticated,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_Complete value) complete,
    required TResult Function(_AcceptDisclaimer value) acceptDisclaimer,
    required TResult Function(_BiometricAuthenticated value)
        biometricAuthenticated,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_AcceptDisclaimer value)? acceptDisclaimer,
    TResult? Function(_BiometricAuthenticated value)? biometricAuthenticated,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_Complete value)? complete,
    TResult Function(_AcceptDisclaimer value)? acceptDisclaimer,
    TResult Function(_BiometricAuthenticated value)? biometricAuthenticated,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class _Complete implements IntroEvent {
  const factory _Complete() = _$CompleteImpl;
}

/// @nodoc
abstract class _$$AcceptDisclaimerImplCopyWith<$Res> {
  factory _$$AcceptDisclaimerImplCopyWith(_$AcceptDisclaimerImpl value,
          $Res Function(_$AcceptDisclaimerImpl) then) =
      __$$AcceptDisclaimerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AcceptDisclaimerImplCopyWithImpl<$Res>
    extends _$IntroEventCopyWithImpl<$Res, _$AcceptDisclaimerImpl>
    implements _$$AcceptDisclaimerImplCopyWith<$Res> {
  __$$AcceptDisclaimerImplCopyWithImpl(_$AcceptDisclaimerImpl _value,
      $Res Function(_$AcceptDisclaimerImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AcceptDisclaimerImpl implements _AcceptDisclaimer {
  const _$AcceptDisclaimerImpl();

  @override
  String toString() {
    return 'IntroEvent.acceptDisclaimer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AcceptDisclaimerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function() complete,
    required TResult Function() acceptDisclaimer,
    required TResult Function() biometricAuthenticated,
  }) {
    return acceptDisclaimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function()? complete,
    TResult? Function()? acceptDisclaimer,
    TResult? Function()? biometricAuthenticated,
  }) {
    return acceptDisclaimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function()? complete,
    TResult Function()? acceptDisclaimer,
    TResult Function()? biometricAuthenticated,
    required TResult orElse(),
  }) {
    if (acceptDisclaimer != null) {
      return acceptDisclaimer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_Complete value) complete,
    required TResult Function(_AcceptDisclaimer value) acceptDisclaimer,
    required TResult Function(_BiometricAuthenticated value)
        biometricAuthenticated,
  }) {
    return acceptDisclaimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_AcceptDisclaimer value)? acceptDisclaimer,
    TResult? Function(_BiometricAuthenticated value)? biometricAuthenticated,
  }) {
    return acceptDisclaimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_Complete value)? complete,
    TResult Function(_AcceptDisclaimer value)? acceptDisclaimer,
    TResult Function(_BiometricAuthenticated value)? biometricAuthenticated,
    required TResult orElse(),
  }) {
    if (acceptDisclaimer != null) {
      return acceptDisclaimer(this);
    }
    return orElse();
  }
}

abstract class _AcceptDisclaimer implements IntroEvent {
  const factory _AcceptDisclaimer() = _$AcceptDisclaimerImpl;
}

/// @nodoc
abstract class _$$BiometricAuthenticatedImplCopyWith<$Res> {
  factory _$$BiometricAuthenticatedImplCopyWith(
          _$BiometricAuthenticatedImpl value,
          $Res Function(_$BiometricAuthenticatedImpl) then) =
      __$$BiometricAuthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BiometricAuthenticatedImplCopyWithImpl<$Res>
    extends _$IntroEventCopyWithImpl<$Res, _$BiometricAuthenticatedImpl>
    implements _$$BiometricAuthenticatedImplCopyWith<$Res> {
  __$$BiometricAuthenticatedImplCopyWithImpl(
      _$BiometricAuthenticatedImpl _value,
      $Res Function(_$BiometricAuthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BiometricAuthenticatedImpl implements _BiometricAuthenticated {
  const _$BiometricAuthenticatedImpl();

  @override
  String toString() {
    return 'IntroEvent.biometricAuthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricAuthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function() complete,
    required TResult Function() acceptDisclaimer,
    required TResult Function() biometricAuthenticated,
  }) {
    return biometricAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function()? complete,
    TResult? Function()? acceptDisclaimer,
    TResult? Function()? biometricAuthenticated,
  }) {
    return biometricAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function()? complete,
    TResult Function()? acceptDisclaimer,
    TResult Function()? biometricAuthenticated,
    required TResult orElse(),
  }) {
    if (biometricAuthenticated != null) {
      return biometricAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_Complete value) complete,
    required TResult Function(_AcceptDisclaimer value) acceptDisclaimer,
    required TResult Function(_BiometricAuthenticated value)
        biometricAuthenticated,
  }) {
    return biometricAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_AcceptDisclaimer value)? acceptDisclaimer,
    TResult? Function(_BiometricAuthenticated value)? biometricAuthenticated,
  }) {
    return biometricAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_Complete value)? complete,
    TResult Function(_AcceptDisclaimer value)? acceptDisclaimer,
    TResult Function(_BiometricAuthenticated value)? biometricAuthenticated,
    required TResult orElse(),
  }) {
    if (biometricAuthenticated != null) {
      return biometricAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _BiometricAuthenticated implements IntroEvent {
  const factory _BiometricAuthenticated() = _$BiometricAuthenticatedImpl;
}

/// @nodoc
mixin _$IntroState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() required,
    required TResult Function(int timestamp) disclaimerRequired,
    required TResult Function() biometricRequired,
    required TResult Function() completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? required,
    TResult? Function(int timestamp)? disclaimerRequired,
    TResult? Function()? biometricRequired,
    TResult? Function()? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? required,
    TResult Function(int timestamp)? disclaimerRequired,
    TResult Function()? biometricRequired,
    TResult Function()? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Required value) required,
    required TResult Function(_DisclaimerRequired value) disclaimerRequired,
    required TResult Function(_BiometricRequired value) biometricRequired,
    required TResult Function(_Completed value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Required value)? required,
    TResult? Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult? Function(_BiometricRequired value)? biometricRequired,
    TResult? Function(_Completed value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Required value)? required,
    TResult Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult Function(_BiometricRequired value)? biometricRequired,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroStateCopyWith<$Res> {
  factory $IntroStateCopyWith(
          IntroState value, $Res Function(IntroState) then) =
      _$IntroStateCopyWithImpl<$Res, IntroState>;
}

/// @nodoc
class _$IntroStateCopyWithImpl<$Res, $Val extends IntroState>
    implements $IntroStateCopyWith<$Res> {
  _$IntroStateCopyWithImpl(this._value, this._then);

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
    extends _$IntroStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'IntroState.initial()';
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
    required TResult Function() required,
    required TResult Function(int timestamp) disclaimerRequired,
    required TResult Function() biometricRequired,
    required TResult Function() completed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? required,
    TResult? Function(int timestamp)? disclaimerRequired,
    TResult? Function()? biometricRequired,
    TResult? Function()? completed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? required,
    TResult Function(int timestamp)? disclaimerRequired,
    TResult Function()? biometricRequired,
    TResult Function()? completed,
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
    required TResult Function(_Required value) required,
    required TResult Function(_DisclaimerRequired value) disclaimerRequired,
    required TResult Function(_BiometricRequired value) biometricRequired,
    required TResult Function(_Completed value) completed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Required value)? required,
    TResult? Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult? Function(_BiometricRequired value)? biometricRequired,
    TResult? Function(_Completed value)? completed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Required value)? required,
    TResult Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult Function(_BiometricRequired value)? biometricRequired,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements IntroState {
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
    extends _$IntroStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'IntroState.loading()';
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
    required TResult Function() required,
    required TResult Function(int timestamp) disclaimerRequired,
    required TResult Function() biometricRequired,
    required TResult Function() completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? required,
    TResult? Function(int timestamp)? disclaimerRequired,
    TResult? Function()? biometricRequired,
    TResult? Function()? completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? required,
    TResult Function(int timestamp)? disclaimerRequired,
    TResult Function()? biometricRequired,
    TResult Function()? completed,
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
    required TResult Function(_Required value) required,
    required TResult Function(_DisclaimerRequired value) disclaimerRequired,
    required TResult Function(_BiometricRequired value) biometricRequired,
    required TResult Function(_Completed value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Required value)? required,
    TResult? Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult? Function(_BiometricRequired value)? biometricRequired,
    TResult? Function(_Completed value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Required value)? required,
    TResult Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult Function(_BiometricRequired value)? biometricRequired,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements IntroState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$RequiredImplCopyWith<$Res> {
  factory _$$RequiredImplCopyWith(
          _$RequiredImpl value, $Res Function(_$RequiredImpl) then) =
      __$$RequiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequiredImplCopyWithImpl<$Res>
    extends _$IntroStateCopyWithImpl<$Res, _$RequiredImpl>
    implements _$$RequiredImplCopyWith<$Res> {
  __$$RequiredImplCopyWithImpl(
      _$RequiredImpl _value, $Res Function(_$RequiredImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequiredImpl implements _Required {
  const _$RequiredImpl();

  @override
  String toString() {
    return 'IntroState.required()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequiredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() required,
    required TResult Function(int timestamp) disclaimerRequired,
    required TResult Function() biometricRequired,
    required TResult Function() completed,
  }) {
    return required();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? required,
    TResult? Function(int timestamp)? disclaimerRequired,
    TResult? Function()? biometricRequired,
    TResult? Function()? completed,
  }) {
    return required?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? required,
    TResult Function(int timestamp)? disclaimerRequired,
    TResult Function()? biometricRequired,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (required != null) {
      return required();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Required value) required,
    required TResult Function(_DisclaimerRequired value) disclaimerRequired,
    required TResult Function(_BiometricRequired value) biometricRequired,
    required TResult Function(_Completed value) completed,
  }) {
    return required(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Required value)? required,
    TResult? Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult? Function(_BiometricRequired value)? biometricRequired,
    TResult? Function(_Completed value)? completed,
  }) {
    return required?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Required value)? required,
    TResult Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult Function(_BiometricRequired value)? biometricRequired,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (required != null) {
      return required(this);
    }
    return orElse();
  }
}

abstract class _Required implements IntroState {
  const factory _Required() = _$RequiredImpl;
}

/// @nodoc
abstract class _$$DisclaimerRequiredImplCopyWith<$Res> {
  factory _$$DisclaimerRequiredImplCopyWith(_$DisclaimerRequiredImpl value,
          $Res Function(_$DisclaimerRequiredImpl) then) =
      __$$DisclaimerRequiredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int timestamp});
}

/// @nodoc
class __$$DisclaimerRequiredImplCopyWithImpl<$Res>
    extends _$IntroStateCopyWithImpl<$Res, _$DisclaimerRequiredImpl>
    implements _$$DisclaimerRequiredImplCopyWith<$Res> {
  __$$DisclaimerRequiredImplCopyWithImpl(_$DisclaimerRequiredImpl _value,
      $Res Function(_$DisclaimerRequiredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
  }) {
    return _then(_$DisclaimerRequiredImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DisclaimerRequiredImpl implements _DisclaimerRequired {
  const _$DisclaimerRequiredImpl({this.timestamp = 0});

  @override
  @JsonKey()
  final int timestamp;

  @override
  String toString() {
    return 'IntroState.disclaimerRequired(timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisclaimerRequiredImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisclaimerRequiredImplCopyWith<_$DisclaimerRequiredImpl> get copyWith =>
      __$$DisclaimerRequiredImplCopyWithImpl<_$DisclaimerRequiredImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() required,
    required TResult Function(int timestamp) disclaimerRequired,
    required TResult Function() biometricRequired,
    required TResult Function() completed,
  }) {
    return disclaimerRequired(timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? required,
    TResult? Function(int timestamp)? disclaimerRequired,
    TResult? Function()? biometricRequired,
    TResult? Function()? completed,
  }) {
    return disclaimerRequired?.call(timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? required,
    TResult Function(int timestamp)? disclaimerRequired,
    TResult Function()? biometricRequired,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (disclaimerRequired != null) {
      return disclaimerRequired(timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Required value) required,
    required TResult Function(_DisclaimerRequired value) disclaimerRequired,
    required TResult Function(_BiometricRequired value) biometricRequired,
    required TResult Function(_Completed value) completed,
  }) {
    return disclaimerRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Required value)? required,
    TResult? Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult? Function(_BiometricRequired value)? biometricRequired,
    TResult? Function(_Completed value)? completed,
  }) {
    return disclaimerRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Required value)? required,
    TResult Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult Function(_BiometricRequired value)? biometricRequired,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (disclaimerRequired != null) {
      return disclaimerRequired(this);
    }
    return orElse();
  }
}

abstract class _DisclaimerRequired implements IntroState {
  const factory _DisclaimerRequired({final int timestamp}) =
      _$DisclaimerRequiredImpl;

  int get timestamp;
  @JsonKey(ignore: true)
  _$$DisclaimerRequiredImplCopyWith<_$DisclaimerRequiredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BiometricRequiredImplCopyWith<$Res> {
  factory _$$BiometricRequiredImplCopyWith(_$BiometricRequiredImpl value,
          $Res Function(_$BiometricRequiredImpl) then) =
      __$$BiometricRequiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BiometricRequiredImplCopyWithImpl<$Res>
    extends _$IntroStateCopyWithImpl<$Res, _$BiometricRequiredImpl>
    implements _$$BiometricRequiredImplCopyWith<$Res> {
  __$$BiometricRequiredImplCopyWithImpl(_$BiometricRequiredImpl _value,
      $Res Function(_$BiometricRequiredImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BiometricRequiredImpl implements _BiometricRequired {
  const _$BiometricRequiredImpl();

  @override
  String toString() {
    return 'IntroState.biometricRequired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BiometricRequiredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() required,
    required TResult Function(int timestamp) disclaimerRequired,
    required TResult Function() biometricRequired,
    required TResult Function() completed,
  }) {
    return biometricRequired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? required,
    TResult? Function(int timestamp)? disclaimerRequired,
    TResult? Function()? biometricRequired,
    TResult? Function()? completed,
  }) {
    return biometricRequired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? required,
    TResult Function(int timestamp)? disclaimerRequired,
    TResult Function()? biometricRequired,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (biometricRequired != null) {
      return biometricRequired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Required value) required,
    required TResult Function(_DisclaimerRequired value) disclaimerRequired,
    required TResult Function(_BiometricRequired value) biometricRequired,
    required TResult Function(_Completed value) completed,
  }) {
    return biometricRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Required value)? required,
    TResult? Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult? Function(_BiometricRequired value)? biometricRequired,
    TResult? Function(_Completed value)? completed,
  }) {
    return biometricRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Required value)? required,
    TResult Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult Function(_BiometricRequired value)? biometricRequired,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (biometricRequired != null) {
      return biometricRequired(this);
    }
    return orElse();
  }
}

abstract class _BiometricRequired implements IntroState {
  const factory _BiometricRequired() = _$BiometricRequiredImpl;
}

/// @nodoc
abstract class _$$CompletedImplCopyWith<$Res> {
  factory _$$CompletedImplCopyWith(
          _$CompletedImpl value, $Res Function(_$CompletedImpl) then) =
      __$$CompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompletedImplCopyWithImpl<$Res>
    extends _$IntroStateCopyWithImpl<$Res, _$CompletedImpl>
    implements _$$CompletedImplCopyWith<$Res> {
  __$$CompletedImplCopyWithImpl(
      _$CompletedImpl _value, $Res Function(_$CompletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CompletedImpl implements _Completed {
  const _$CompletedImpl();

  @override
  String toString() {
    return 'IntroState.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() required,
    required TResult Function(int timestamp) disclaimerRequired,
    required TResult Function() biometricRequired,
    required TResult Function() completed,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? required,
    TResult? Function(int timestamp)? disclaimerRequired,
    TResult? Function()? biometricRequired,
    TResult? Function()? completed,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? required,
    TResult Function(int timestamp)? disclaimerRequired,
    TResult Function()? biometricRequired,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Required value) required,
    required TResult Function(_DisclaimerRequired value) disclaimerRequired,
    required TResult Function(_BiometricRequired value) biometricRequired,
    required TResult Function(_Completed value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Required value)? required,
    TResult? Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult? Function(_BiometricRequired value)? biometricRequired,
    TResult? Function(_Completed value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Required value)? required,
    TResult Function(_DisclaimerRequired value)? disclaimerRequired,
    TResult Function(_BiometricRequired value)? biometricRequired,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed implements IntroState {
  const factory _Completed() = _$CompletedImpl;
}
