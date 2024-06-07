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

    test('When invoke GetProductsUseCase and service fail should return null',
        () async {
      // Arrange
      when(() => mockProductsRepository.loginUser(any())).thenAnswer(
        (_) async => null,
      );
      // Act
      final idResponse = await useCase.invoke(loginParamsModel);
      // Assert
      expect(idResponse, isNull);
    });

    test(
        'When invoke GetProductsUseCase and service response should return valid list of categories',
        () async {
      // Arrange
      when(() => mockProductsRepository.loginUser(any())).thenAnswer(
        (_) async => '1',
      );
      // Act
      final idResponse = await useCase.invoke(loginParamsModel);
      // Assert
      expect(idResponse, '1');
    });
  });
}
