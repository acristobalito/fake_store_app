import 'package:ecommerce_widgets_package/presentation/widgets/atoms/custom_text_atom.dart';
import 'package:ecommerce_widgets_package/presentation/widgets/atoms/image_atom.dart';
import 'package:flutter/material.dart';

class EmptyResultsWidget extends StatelessWidget {
  const EmptyResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageAtom(
              image:
                  'https://live.gorilasocial.com/assets/images/ofm-nofiles.png'),
          CustomTextAtom(
              textAlign: TextAlign.center,
              lines: 3,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              text: 'Ops!, no encontramos resultados de tu busqueda'),
        ],
      ),
    );
  }
}
