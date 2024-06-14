import 'package:fake_store_app/domain/models/parameterization/landing_parameterization_model.dart';
import 'package:fake_store_app/infraestructure/repositories/parameterization_repository.dart';

class GetParameterizationUseCase {
  final ParameterizationRepository parameterizationRepository;

  GetParameterizationUseCase({required this.parameterizationRepository});

  Future<LandingParameterizationModel> invoke() async =>
      parameterizationRepository.loadParametrization();
}
