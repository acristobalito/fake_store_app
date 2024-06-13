import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/domain/use_cases/user/login_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mock_products_repository.dart';

void main() {
  group("GetProductsUseCase tests", () {
    late MockProductsRepository mockProductsRepository;
    late LoginUserUseCase useCase;
    late LoginParamsModel loginParamsModel;
    setUpAll(() {
      mockProductsRepository = MockProductsRepository();
      useCase = LoginUserUseCase(mockProductsRepository);
      loginParamsModel = LoginParamsModel(username: '', password: '');
      registerFallbackValue(loginParamsModel);
    });

    test('When invoke LoginUserUseCase and service fail should return null',
        () async {
      when(() => mockProductsRepository.loginUser(any())).thenAnswer(
        (_) async => null,
      );
      final idResponse = await useCase.invoke(loginParamsModel);
      expect(idResponse, isNull, reason: 'Id user should be null');
    });

    test(
        'When invoke LoginUserUseCase and service response should return valid list of categories',
        () async {
      when(() => mockProductsRepository.loginUser(any())).thenAnswer(
        (_) async => '1',
      );
      final idResponse = await useCase.invoke(loginParamsModel);
      expect(idResponse, '1', reason: 'Id user should be a valid String');
    });
  });
}
