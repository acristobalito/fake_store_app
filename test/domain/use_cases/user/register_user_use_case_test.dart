import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/domain/use_cases/user/register_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mock_products_repository.dart';

void main() {
  group("GetProductsUseCase tests", () {
    late MockProductsRepository mockProductsRepository;
    late RegisterUserUseCase useCase;
    late UserModel userModel;
    setUpAll(() {
      mockProductsRepository = MockProductsRepository();
      useCase = RegisterUserUseCase(mockProductsRepository);
      userModel = UserModel(
          email: '',
          username: '',
          password: '',
          name: NameModel(firstname: '', lastname: ''),
          address: AddressModel(
              city: '',
              street: '',
              number: 0,
              zipcode: '',
              geolocation: GeolocationModel(lat: '0', long: '0')),
          phone: '');
      registerFallbackValue(userModel);
    });

    test('When invoke GetProductsUseCase and service fail should return null',
        () async {
      // Arrange
      when(() => mockProductsRepository.registerUser(any())).thenAnswer(
        (_) async => null,
      );
      // Act
      final tokenResponse = await useCase.invoke(userModel);
      // Assert
      expect(tokenResponse, isNull);
    });

    test(
        'When invoke GetProductsUseCase and service response should return valid list of categories',
        () async {
      // Arrange
      when(() => mockProductsRepository.registerUser(any())).thenAnswer(
        (_) async => 1,
      );
      // Act
      final tokenResponse = await useCase.invoke(userModel);
      // Assert
      expect(tokenResponse, 1);
    });
  });
}
