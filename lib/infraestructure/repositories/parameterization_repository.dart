import 'package:fake_store_app/domain/models/parameterization/landing_parameterization_model.dart';

abstract interface class ParameterizationRepository {
  Future<LandingParameterizationModel> loadParametrization();
}
