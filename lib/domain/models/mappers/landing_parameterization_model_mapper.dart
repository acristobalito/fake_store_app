import 'package:fake_store_app/domain/models/mappers/section_parameterization_model_mapper.dart';
import 'package:fake_store_app/domain/models/parameterization/landing_parameterization_model.dart';

class LandingParameterizationModelMapper {
  static LandingParameterizationModel landingParametrizationFromJson(
          Map<String, dynamic> json) =>
      LandingParameterizationModel(
          discountEnable: json["discountEnable"],
          recommendedSection:
              SectionParametrizationModelMapper.sectionParametrizationFromJson(
                  json["recommendedSection"]),
          newSection:
              SectionParametrizationModelMapper.sectionParametrizationFromJson(
                  json["newSection"]));
}
