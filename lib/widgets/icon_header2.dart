import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader2 extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String total;
  final String referencia;
  final Color color1;
  final Color color2;

  const IconHeader2({
    required this.icon,
    required this.titulo,
    required this.referencia,
    required this.total,
    this.color1 = Colors.blue,
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(1);
    return Stack(
      children: [
        _IconHeader2Background(
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
              'Referencia',
              style: TextStyle(fontSize: 15, color: colorBlanco),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              '${this.referencia}',
              style: TextStyle(
                  fontSize: 30,
                  color: colorBlanco,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cantidad',
                      style: TextStyle(fontSize: 12, color: colorBlanco),
                    ),
                    Text(
                      '${this.total}',
                      style: TextStyle(
                          fontSize: 20,
                          color: colorBlanco,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // SizedBox(
                //   width: 20,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Costo Tarea',
                      style: TextStyle(fontSize: 12, color: colorBlanco),
                    ),
                    // SizedBox(
                    //   height: 1,
                    // ),
                    Text(
                      '\$ ${this.titulo}',
                      style: TextStyle(
                          fontSize: 20,
                          color: colorBlanco,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class _IconHeader2Background extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _IconHeader2Background({
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
