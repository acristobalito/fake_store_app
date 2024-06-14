import 'package:fake_store_app/domain/models/parameterization/section_parameterization_model.dart';

class LandingParameterizationModel {
  bool discountEnable;
  SectionParameterizationModel? recommendedSection;
  SectionParameterizationModel? newSection;

  LandingParameterizationModel(
      {required this.discountEnable, this.recommendedSection, this.newSection});
}
