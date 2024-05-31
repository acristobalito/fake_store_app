import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:flutter/material.dart';

class MainBackgroundWidget extends StatelessWidget {
  const MainBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ImageAtom(
          image:
              'https://as2.ftcdn.net/v2/jpg/04/95/91/57/1000_F_495915779_LGPZOO29dAYZuSA8AHgyUm0BRXSM23iG.jpg',
          boxFit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.6),
        ),
      ],
    );
  }
}
