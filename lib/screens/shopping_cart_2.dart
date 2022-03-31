import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logginapp2/widgets/widgets.dart';

class ShoppingCartScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Encabezado(),
    );
  }
}

class Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.percent,
          titulo: 'Mauren Lorena',
          total: '0000.0001',
          color1: Color(0xff526BF6),
          color2: Color(0xff67ACF2),
        ),
        Positioned(
          top: 30,
          left: 0,
          child: RawMaterialButton(
            // elevation: ⁄
            shape: CircleBorder(),
            child: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          ),
        ),
        Positioned(
          top: 30,
          right: 0,
          child: RawMaterialButton(
            shape: CircleBorder(),
            child: FaIcon(
              FontAwesomeIcons.trashAlt,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
