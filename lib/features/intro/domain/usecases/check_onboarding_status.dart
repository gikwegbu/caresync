import 'package:injectable/injectable.dart';
import '../repositories/intro_repository.dart';

@lazySingleton
class CheckOnboardingStatus {
  final IntroRepository _repository;

  CheckOnboardingStatus(this._repository);

  Future<bool> call() => _repository.isOnboardingCompleted();
}
