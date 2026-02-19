import 'package:injectable/injectable.dart';
import '../repositories/intro_repository.dart';

@lazySingleton
class CompleteOnboarding {
  final IntroRepository _repository;

  CompleteOnboarding(this._repository);

  Future<void> call() => _repository.completeOnboarding();
}
