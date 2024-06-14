import 'package:fake_store_app/domain/models/parameterization/section_parameterization_model.dart';

class SectionParametrizationModelMapper {
  static SectionParameterizationModel sectionParametrizationFromJson(
          Map<String, dynamic>? json) =>
      SectionParameterizationModel(
          title: json?["title"],
          category: json?["category"],
          titleColor: json?["titleColor"],
          colorSection: json?["colorSection"]);
}
