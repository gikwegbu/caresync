import 'package:injectable/injectable.dart';
import '../repositories/health_metric_repository.dart';

@lazySingleton
class DeleteMetric {
  final HealthMetricRepository _repository;

  DeleteMetric(this._repository);

  Future<void> call(int id) async {
    return _repository.deleteMetric(id);
  }
}
