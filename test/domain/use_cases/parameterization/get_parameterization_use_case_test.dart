import 'package:fake_store_app/domain/models/parameterization/landing_parameterization_model.dart';
import 'package:fake_store_app/domain/use_cases/parameterization/get_parameterization_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mock_parametrization_repository.dart';

void main() {
  group('Get parameterization use case test', () {
    late MockParametrizationRepository mockParametrizationRepository;
    late GetParameterizationUseCase useCase;

    setUpAll(() {
      mockParametrizationRepository = MockParametrizationRepository();
      useCase = GetParameterizationUseCase(
          parameterizationRepository: mockParametrizationRepository);
    });
    test('On invoke shoudl return a valid a Landing Model Parameterization',
        () async {
      when(() => mockParametrizationRepository.loadParametrization())
          .thenAnswer(
              (_) async => LandingParameterizationModel(discountEnable: true));
      final params = await useCase.invoke();
      expect(params, isA<LandingParameterizationModel>());
    });
  });
}
