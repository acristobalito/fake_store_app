import 'package:fake_store_app/domain/models/parameterization/landing_parameterization_model.dart';
import 'package:fake_store_app/infraestructure/datasources/impl/parameterization_data_source_impl.dart';
import 'package:fake_store_app/infraestructure/datasources/parameterization_data_source.dart';
import 'package:fake_store_app/infraestructure/repositories/parameterization_repository.dart';

class ParameterizationRepositoryImpl implements ParameterizationRepository {
  final ParameterizationDataSource parameterizationDataSource =
      ParameterizationDataSourceImpl();
  @override
  Future<LandingParameterizationModel> loadParametrization() =>
      parameterizationDataSource.loadParametrization();
}
