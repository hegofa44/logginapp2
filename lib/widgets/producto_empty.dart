import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class ProductEmpty extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subTitulo;
  final String tituloBoton;
  final String paginaBoton;
  final Color color1;
  final Color color2;

  const ProductEmpty({
    required this.icon,
    required this.titulo,
    required this.subTitulo,
    required this.tituloBoton,
    required this.paginaBoton,
    this.color1 = Colors.blue,
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(1);
    return Stack(
      children: [
        _ProductEmptyBackground(
          color1: this.color1,
          color2: this.color2,
        ),
        Positioned(
          top: 60,
          left: 10,
          child: RawMaterialButton(
            // elevation: ⁄
            shape: CircleBorder(),
            child: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => {
              // _colorSeleccionado = '',
              // _tallaSeleccionada = '',
              // _value = '',
              // _enlaceSeleccionado = '',
              // _fotoUrl = '',
              // _paresTalla = '',
              // _contador = 1,
              // idSizeColorConexion.heroe = _value,
              // idSizeColorConexion.heroe2 = '',
              // _precioMayorista = 0.0,
              // idSizeColorConexion.top = 100.0,
              Navigator.of(context).pop(),
              // setState(){}
            },
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Expanded(child: Container()),
            Stack(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 15.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(150))),
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: FaIcon(
                      this.icon,
                      size: 150,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(
                    //   color: Colors.white,
                    //   width: 15.0,
                    // ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(150),
                    ),
                  ),
                  child: Icon(
                    FontAwesomeIcons.exclamationCircle,
                    size: 100,
                    color: Colors.red,
                  ),
                ),
                // FaIcon(
                //   icon,
                //   size: 200,
                //   color: Colors.white.withOpacity(0.1),
                // ),
              ],
            ),
            // SizedBox(
            //   height: 20,
            //   width: double.infinity,
            // ),
            // Text(
            //   'Costo Tarea',
            //   style: TextStyle(fontSize: 15, color: colorBlanco),
            // ),
            Expanded(child: Container()),
            Text(
              '${this.titulo}',
              style: TextStyle(
                  fontSize: 25,
                  color: colorBlanco,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),

            SizedBox(
              height: 5,
            ),
            Text(
              this.subTitulo,
              style: TextStyle(
                fontSize: 15,
                color: colorBlanco.withOpacity(0.6),
              ),
            ),
            // Expanded(child: Container()),
            SizedBox(
              height: 15,
            ),

            BotonVenta(
              mensajeBotonVenta: this.tituloBoton,
              paginaBoton: this.paginaBoton,
            ),
            Expanded(child: Container()),
            // Text(
            //   'Cantidad de zapatos',
            //   style: TextStyle(fontSize: 15, color: colorBlanco),
            // ),
            // Text(
            //   '${this.total}',
            //   style: TextStyle(
            //       fontSize: 30,
            //       color: colorBlanco,
            //       fontWeight: FontWeight.bold),
            // ),
          ],
        )
      ],
    );
  }
}

class _ProductEmptyBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _ProductEmptyBackground({
    Key? key,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            // blurRadius: 10,
            // offset: Offset(0, 1),
          )
        ],
        // color: Colors.red,
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(30),
        //   bottomRight: Radius.circular(30),
        // ),
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

class BotonVenta extends StatelessWidget {
  final String mensajeBotonVenta;
  final String paginaBoton;

  const BotonVenta(
      {required this.mensajeBotonVenta, required this.paginaBoton});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            // primary: LinearGradient(colors: colors),
            minimumSize: Size(size.width * 0.8, 50),
            elevation: 10,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.only(
            //     topRight: Radius.circular(50),
            //   ),
            // ),
          ),
          child: Text(
            this.mensajeBotonVenta,
            style: TextStyle(letterSpacing: 1, color: Colors.black),
          ),
          onPressed: (this.paginaBoton == 'tareasHomeScreen')
              ? () {
                  final idSizeColorConexion =
                      Provider.of<SizeColorConexion>(context, listen: false);
                  idSizeColorConexion.reset = true;
                  // idSizeColorConexion.reset = true;
                  Navigator.pushNamed(context, this.paginaBoton);
                  print('Estoy en HomeTareas');
                }
              : () {
                  final idSizeColorConexion =
                      Provider.of<SizeColorConexion>(context, listen: false);
                  idSizeColorConexion.reset2 = true;
                  // idSizeColorConexion.reset = true;
                  Navigator.pushNamed(context, this.paginaBoton);
                  print('Estoy en HomePrincipal');
                }),
    );
  }
}
