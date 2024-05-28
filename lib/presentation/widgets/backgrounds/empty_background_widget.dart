import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:flutter/material.dart';

class EmptyBackgroundWidget extends StatelessWidget {
  const EmptyBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageAtom(
              image:
                  'https://cdn-icons-png.flaticon.com/512/11329/11329060.png'),
          CustomTextAtom(
              textAlign: TextAlign.center,
              lines: 1,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              text: 'Tu carrito esta vacío'),
          SizedBox(
            height: 10,
          ),
          CustomTextAtom(
              lines: 4,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
              text:
                  'Agrega nuevos productos desde nuestro catálogo de productos')
        ],
      ),
    );
  }
}
