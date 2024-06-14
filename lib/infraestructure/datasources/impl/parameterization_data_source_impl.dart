import 'dart:convert';

import 'package:fake_store_app/domain/models/mappers/landing_parameterization_model_mapper.dart';
import 'package:fake_store_app/domain/models/parameterization/landing_parameterization_model.dart';
import 'package:fake_store_app/infraestructure/datasources/parameterization_data_source.dart';
import 'package:flutter/services.dart' show rootBundle;

class ParameterizationDataSourceImpl implements ParameterizationDataSource {
  @override
  Future<LandingParameterizationModel> loadParametrization() async {
    final jsonString =
        await rootBundle.loadString('assets/parameterization/params.json');
    final jsonDecodeString = jsonDecode(jsonString);
    return LandingParameterizationModelMapper.landingParametrizationFromJson(
        jsonDecodeString);
  }
}
