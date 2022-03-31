import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String total;
  final Color color1;
  final Color color2;

  const IconHeader({
    required this.icon,
    required this.titulo,
    required this.total,
    this.color1 = Colors.blue,
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(1);
    return Stack(
      children: [
        _IconHeaderBackground(
          color1: this.color1,
          color2: this.color2,
        ),
        Positioned(
          top: 20,
          left: 20,
          child: FaIcon(
            this.icon,
            size: 200,
            color: Colors.white.withOpacity(0.1),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
            ),
            Text(
              'Cliente',
              style: TextStyle(fontSize: 15, color: colorBlanco),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              this.titulo,
              style: TextStyle(
                  fontSize: 25,
                  color: colorBlanco,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Total a pagar',
              style: TextStyle(fontSize: 15, color: colorBlanco),
            ),
            Text(
              '\$${this.total}',
              style: TextStyle(
                  fontSize: 30,
                  color: colorBlanco,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _IconHeaderBackground({
    Key? key,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: Offset(0, 1),
          )
        ],
        // color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            this.color1,
            this.color2,
          ],
        ),
      ),
    );
  }
}
