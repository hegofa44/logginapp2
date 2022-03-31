// import 'dart:js';

import 'dart:async';
// import 'dart:html';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logginapp2/models/cart_model.dart';
import 'package:logginapp2/models/models.dart';
import 'package:logginapp2/models/tareasModel.dart';
import 'package:logginapp2/services/cart_service.dart';
import 'package:logginapp2/services/service_new_tareas.dart';
import 'package:logginapp2/services/services.dart';
import 'package:logginapp2/services/sizes_colors_conexion.dart';
import 'package:logginapp2/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TareasCartScreen extends StatefulWidget {
  @override
  State<TareasCartScreen> createState() => _TareasCartScreenState();
}

class _TareasCartScreenState extends State<TareasCartScreen> {
  @override
  Widget build(BuildContext context) {
    void displayDialog4() {
      final idSizeColorConexion =
          Provider.of<SizeColorConexion>(context, listen: false);
      String precioTarea = '0.0';
      Timer? _timer;
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            _timer = Timer(Duration(seconds: 100), () {
              Navigator.pop(context);
            });
            // return Container(
            //   color: Colors,
            //   width: 100,
            //   height: 100,
            // );
            return FadeInUp(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),

                elevation: 5,
                title: Text('Ingrese el costo de la tarea'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text('Ingrese el costo de la tarea'),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Ingresa el valor acá',
                        labelText: 'Costo',
                        // suffixIcon: Icon(FontAwesomeIcons.edit),
                        counterText: (idSizeColorConexion.totalTarea > 0.0)
                            ? 'Costo actual: ' +
                                idSizeColorConexion.totalTarea
                                    .round()
                                    .toString()
                            : null,
                        prefixIcon: Icon(
                          FontAwesomeIcons.edit,
                          size: 20,
                        ),
                      ),
                      // initialValue:
                      //     idSizeColorConexion.totalTarea.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          precioTarea = value;
                        });
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                      child: Text('Guardar'),
                      onPressed: () {
                        if (precioTarea.isNotEmpty) {
                          idSizeColorConexion.totalTarea =
                              double.parse(precioTarea);
                          Navigator.pop(context);
                          // print('No es vacio');
                          // print('l' + precioTarea + 'l');
                        } else {
                          idSizeColorConexion.totalTarea = 0.0;
                          Navigator.pop(context);
                        }
                      }),
                ],
                // backgroundColor: Colors.black54,
                // contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom),
                // backgroundColor: Colors.black54,
                // content: Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [Text('Se agrego correctamente')],
                // ),
              ),
            );
          }).then((value) => {
            if (_timer!.isActive) {_timer!.cancel()}
          });
    }

    // void displayDialog5() {
    //   final idSizeColorConexion =
    //       Provider.of<SizeColorConexion>(context, listen: false);
    //   String precioTarea = '0.0';
    //   Timer? _timer;
    //   showDialog(
    //       barrierDismissible: true,
    //       context: context,
    //       builder: (BuildContext context) {
    //         _timer = Timer(Duration(seconds: 100), () {
    //           Navigator.pop(context);
    //         });
    //         // return Container(
    //         //   color: Colors,
    //         //   width: 100,
    //         //   height: 100,
    //         // );
    //         return FadeInUp(
    //           child: Dialog(
    //             insetPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    //             child: Stack(
    //               children: [
    //                 Container(
    //                   width: double.infinity,
    //                   height: 400,
    //                   child: Padding(
    //                     padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
    //                     child: Column(
    //                       children: [
    //                         Text(
    //                           'Resumen del registro',
    //                           style: TextStyle(fontSize: 20, letterSpacing: 1),
    //                         ),
    //                         SizedBox(
    //                           height: 30,
    //                         ),
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                           children: [
    //                             Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Text('Referencia: '),
    //                                 SizedBox(
    //                                   height: 5,
    //                                 ),
    //                                 Text('Color: '),
    //                                 SizedBox(
    //                                   height: 5,
    //                                 ),
    //                                 Text('Cantidad de pares: '),
    //                                 SizedBox(
    //                                   height: 5,
    //                                 ),
    //                                 Text('Costo por par: '),
    //                                 SizedBox(
    //                                   height: 5,
    //                                 ),
    //                                 Text('Costo total de la tarea: '),
    //                               ],
    //                             ),
    //                             Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Text('----'),
    //                                 SizedBox(
    //                                   height: 5,
    //                                 ),
    //                                 Text('----'),
    //                                 SizedBox(
    //                                   height: 5,
    //                                 ),
    //                                 Text((idSizeColorConexion.totalPares)
    //                                     .toString()),
    //                                 SizedBox(
    //                                   height: 5,
    //                                 ),
    //                                 // Text((idSizeColorConexion.totalTarea /
    //                                 //         idSizeColorConexion.totalPares)
    //                                 //     .round()
    //                                 //     .toString()),
    //                                 SizedBox(
    //                                   height: 5,
    //                                 ),
    //                                 Text(idSizeColorConexion.totalTarea
    //                                     .round()
    //                                     .toString()),
    //                               ],
    //                             )
    //                           ],
    //                         )
    //                         // IconButton(
    //                         //   onPressed: () {
    //                         //     Navigator.pop(context);
    //                         //   },
    //                         //   icon: Icon(Icons.close),
    //                         // ),
    //                       ],
    //                     ),
    //                   ),
    //                   // color: Colors.red,
    //                 ),
    //                 Positioned(
    //                   top: 0,
    //                   right: 0,
    //                   child: Container(
    //                     // width: 10,
    //                     // height: 10,
    //                     child: IconButton(
    //                       onPressed: () {
    //                         Navigator.pop(context);
    //                       },
    //                       icon: Icon(Icons.close),
    //                     ),
    //                   ),
    //                 ),
    //                 Positioned(
    //                     bottom: 0,
    //                     left: 2,
    //                     right: 2,
    //                     child: Padding(
    //                       padding: const EdgeInsets.all(8.0),
    //                       child: ElevatedButton(
    //                         // style: ElevatedButton.styleFrom(
    //                         //     minimumSize: Size(double.infinity, 40)),
    //                         onPressed: () {
    //                           print('HECTOR ME PULSO');
    //                         },
    //                         child: Text('Confirmar registro'),
    //                       ),
    //                     )),
    //               ],
    //             ),
    //           ),
    //           // child: AlertDialog(
    //           //   shape: RoundedRectangleBorder(
    //           //       borderRadius: BorderRadius.circular(10)),
    //           //   contentPadding: EdgeInsets.fromLTRB(24.0, 0, 0, 24.0),
    //           //   elevation: 5,
    //           //   content: Column(
    //           //     crossAxisAlignment: CrossAxisAlignment.start,
    //           //     mainAxisSize: MainAxisSize.min,
    //           //     children: [
    //           //       Row(
    //           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           //         children: [
    //           //           Text(''),
    //           //           IconButton(
    //           //             onPressed: () {
    //           //               Navigator.pop(context);
    //           //             },
    //           //             icon: Icon(Icons.close),
    //           //           )
    //           //         ],
    //           //       ),
    //           //       Text(
    //           //         'Resumen de registro',
    //           //         style: TextStyle(
    //           //             fontWeight: FontWeight.bold,
    //           //             // letterSpacing: 2,
    //           //             fontSize: 20),
    //           //       ),
    //           //     ],
    //           //   ),
    //           //   // content: Container(
    //           //   //   // height: double.infinity,
    //           //   //   // width: double.infinity,
    //           //   //   color: Colors.red,
    //           //   // ),
    //           //   // title: Row(
    //           //   //   children: [
    //           //   //     Text('Resumen de registro'),
    //           //   //     IconButton(onPressed: () {}, icon: Icon(Icons.close), )
    //           //   //   ],
    //           //   // ),
    //           //   actions: [
    //           //     Padding(
    //           //       padding: const EdgeInsets.all(8.0),
    //           //       child: Container(
    //           //         width: double.infinity,
    //           //         height: 40,
    //           //         // color: Colors.red,
    //           //         child: ElevatedButton(
    //           //             onPressed: () {}, child: Text('Confirmar tarea')),
    //           //       ),
    //           //     )
    //           //     // TextButton(
    //           //     //   child: Text('Cancelar'),
    //           //     //   onPressed: () {
    //           //     //     Navigator.pop(context);
    //           //     //   },
    //           //     // ),
    //           //     // TextButton(
    //           //     //     child: Text('Registar'),
    //           //     //     onPressed: () {
    //           //     //       if (precioTarea.isNotEmpty) {
    //           //     //         idSizeColorConexion.totalTarea =
    //           //     //             double.parse(precioTarea);
    //           //     //         Navigator.pop(context);
    //           //     //         // print('No es vacio');
    //           //     //         // print('l' + precioTarea + 'l');
    //           //     //       } else {
    //           //     //         idSizeColorConexion.totalTarea = 0.0;
    //           //     //         Navigator.pop(context);
    //           //     //       }
    //           //     //     }),
    //           //   ],
    //           //   // backgroundColor: Colors.black54,
    //           //   // contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom),
    //           //   // backgroundColor: Colors.black54,
    //           //   // content: Column(
    //           //   //   mainAxisSize: MainAxisSize.min,
    //           //   //   children: [Text('Se agrego correctamente')],
    //           //   // ),
    //           // ),
    //         );
    //       }).then((value) => {
    //         if (_timer!.isActive) {_timer!.cancel()}
    //       });
    // }

    final cartTareasService = Provider.of<CartTareasService>(context);
    // final idSizeColorConexion = Provider.of<SizeColorConexion>(context);
    // final Cart usuario;
    return Scaffold(
      body: cartTareasService.existeUsuario
          ? Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                      margin: EdgeInsets.only(top: 185, bottom: 60),
                      child: ProductsCart(cartTareasService.usuario)),
                ),
                FadeInRight(
                  child: Stack(
                    children: [
                      Header(cartTareasService.usuario),
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
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Positioned(
                        top: 130,
                        right: 0,
                        child: RawMaterialButton(
                          // elevation: ⁄
                          shape: CircleBorder(),
                          child: FaIcon(
                            FontAwesomeIcons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            displayDialog4();
                            // displayDialog();
                          },
                        ),
                      ),
                      // Positioned(
                      //   top: 180,
                      //   right: 0,
                      //   child: RawMaterialButton(
                      //     // elevation: ⁄
                      //     shape: CircleBorder(),
                      //     child: FaIcon(
                      //       FontAwesomeIcons.windowMaximize,
                      //       color: Colors.white,
                      //       size: 20,
                      //     ),
                      //     onPressed: () {
                      //       displayDialog5();
                      //       // displayDialog();
                      //     },
                      //   ),
                      // ),
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
                          onPressed: () {
                            final idSizeColorConexion =
                                Provider.of<SizeColorConexion>(context,
                                    listen: false);
                            idSizeColorConexion.totalPares = 1;
                            idSizeColorConexion.totalVentas = 0.0;
                            idSizeColorConexion.totalTarea = 0.0;
                            cartTareasService.deleteListCartShopping();
                            idSizeColorConexion.heroe3 = '';
                            idSizeColorConexion.heroe4 = '';
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child:
                      FadeInLeft(child: BotonVenta2(cartTareasService.usuario)),
                )
              ],
            )
          : Container(
              alignment: Alignment.center,
              child: ProductEmpty(
                icon: FontAwesomeIcons.dolly,
                titulo: 'Carrito de tareas vacío',
                subTitulo: 'Por favor agrega una tarea al carrito',
                tituloBoton: 'Registrar tareas',
                paginaBoton: 'tareasHomeScreen',
                color1: Colors.grey,
                color2: Colors.blue,
              ),
            ),
      // : Center(
      //     child: BotonVenta(
      //       mensajeBotonVenta: 'Carrito vacio presiona para regresar',
      //     ),
      //   ),
    );
  }
}

// void regresar() {
//   BotonVenta2;
// }

int totalPares = 0;

int _contador = 1;

class Header extends StatefulWidget {
  final Cart usuario2;

  const Header(this.usuario2);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    // double totalVenta2 = 0.0;
    // int totalPares = 0;
    // for (int i = 0; i < widget.usuario2.ppMayor!.length; i++) {
    //   totalVenta2 = totalVenta2 + widget.usuario2.ppMayor![i];
    //   totalPares = totalPares + int.parse(widget.usuario2.pares![i]);
    // }
    final idSizeColorConexion = Provider.of<SizeColorConexion>(context);

    // final sizeService = Provider.of<SizesService>(context);
    // print(idSizeColorConexion.totalVentas);
    // if (idSizeColorConexion.totalPares == 0) {
    //   idSizeColorConexion.totalPares = widget.usuario2.pares!.length;
    // }
    // setState(() {});
    int sum = 0;
    for (int i = 0; i < widget.usuario2.pares!.length; i++) {
      sum = sum + int.parse(widget.usuario2.pares![i]);
      // idSizeColorConexion.totalPares = sum;
    }
    // void totalPares() {
    //   idSizeColorConexion.totalPares = sum;
    // }

    return Column(
      children: [
        IconHeader2(
          icon: FontAwesomeIcons.percent,
          titulo: '${idSizeColorConexion.totalTarea.round()}',
          total:
              // (idSizeColorConexion.totalPares == 1)
              // ?
              // 'Pares ${sum}',
              'Pares ${sum}',
          // 'Pares ${widget.usuario2.pares}',
          // : 'Pares* ${idSizeColorConexion.totalPares}',
          // : 'Pares* ${idSizeColorConexion.totalPares}',
          // total: 'Pares* ${idSizeColorConexion.totalPares}',
          // total: idSizeColorConexion.totalVentas.toString(),
          color1: Color(0xff23BAE2),
          color2: Color(0xff23BAE2),
          referencia: widget.usuario2.telefono.toString(), 
        ),
        // ElevatedButton(
        //   child: Text('Agregar Tarea'),
        //   onPressed: () async {
        //     for (int i = 0; i < widget.usuario2.colores!.length; i++) {
        //       sizeService.idSize = widget.usuario2.id![i];
        //       sizeService.selectedSize = new SizeModel();
        //       sizeService.selectedSize.nombreTalla =
        //           int.parse(widget.usuario2.tallas![i]);
        //       sizeService.selectedSize.paresTalla =
        //           int.parse(widget.usuario2.pDisponibles![i]) +
        //               int.parse(widget.usuario2.pares![i]);
        //       await sizeService.updateSize(sizeService.selectedSize);
        //     }
        //   },
        // ),
      ],
    );
  }
}

// List listShoes = [];

class ProductsCart extends StatefulWidget {
  final Cart usuario;
  const ProductsCart(this.usuario);

  @override
  _ProductsCartState createState() => _ProductsCartState();
}

class _ProductsCartState extends State<ProductsCart> {
  @override
  Widget build(BuildContext context) {
    final cartTareasService = Provider.of<CartTareasService>(context);
    // final idSizeColorConexion = Provider.of<SizeColorConexion>(context);
    // final sizeService = Provider.of<SizesService>(context);
    // double totalVenta = 0.0;
    double totalVenta2 = 0.0;
    for (int i = 0; i < widget.usuario.ppMayor!.length; i++) {
      totalVenta2 = totalVenta2 + widget.usuario.ppMayor![i];
    }

    // print(totalVenta);
    // double _subTotal = 0.0;

    return Container(
      // color: Colors.red,
      // width: double.infinity,
      // height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInUp(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.usuario.fotosUrl!.length,
              itemBuilder: (context, index) {
                // final item = widget.usuario.fotosUrl![index];
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            // width: 70,

                            // color: Colors.red,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.1),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Eliminar',
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 5,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 70,

                          // color: Colors.red,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withOpacity(0.1),
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.delete_forever_rounded,
                              color: Colors.white, size: 30),
                        ),
                      ],
                    ),
                  ),
                  // secondaryBackground: Container(color: Colors.yellow),
                  onDismissed: (_) {
                    final idSizeColorConexion =
                        Provider.of<SizeColorConexion>(context, listen: false);
                    setState(() {});
                    // print(widget.usuario.colores!);
                    widget.usuario.pares!.removeAt(index);
                    widget.usuario.colores!.removeAt(index);
                    widget.usuario.tallas!.removeAt(index);
                    widget.usuario.fotosUrl!.removeAt(index);
                    widget.usuario.pDisponibles!.removeAt(index);
                    widget.usuario.ppMayor!.removeAt(index);
                    widget.usuario.id!.removeAt(index);
                    int sum = 0;

                    for (int i = 0; i < widget.usuario.pares!.length; i++) {
                      sum = sum + int.parse(widget.usuario.pares![i]);
                    }
                    idSizeColorConexion.totalPares = sum;
                    if (widget.usuario.tallas!.length < 1) {
                      idSizeColorConexion.totalPares = 0;
                      idSizeColorConexion.totalVentas = 0.0;
                      idSizeColorConexion.totalTarea = 0.0;

                      idSizeColorConexion.heroe3 = '';
                      idSizeColorConexion.heroe4 = '';
                      cartTareasService.deleteListCartShopping();
                    }
                  },
                  key: UniqueKey(),
                  child: Card(
                    // color: Colors.red,
                    // margin: EdgeInsets.all(-8.0),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // borderOnForeground: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 200,
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 60,
                                      height: double.infinity,
                                      child: widget.usuario.fotosUrl![index] ==
                                              null
                                          ? Image(
                                              image: AssetImage(
                                                  'assets/no-image2.jpg'),
                                              fit: BoxFit.cover,
                                            )
                                          : FadeInImage(
                                              placeholder: AssetImage(
                                                  'assets/jar-loading.gif'),
                                              // height: 50,
                                              // width: 250,
                                              image: NetworkImage(widget
                                                  .usuario.fotosUrl![index]
                                                  .toString()),
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  title:
                                      // Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      // children: [
                                      Text('${widget.usuario.colores![index]}'),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'Talla: ${widget.usuario.tallas![index]}'),
                                      Text(
                                          'Pares: ${widget.usuario.pares![index]}')
                                    ],
                                  ),
                                  // trailing:
                                ),
                              ),
                              Expanded(
                                // width: 100,
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon:
                                                Icon(Icons.remove_circle_sharp),
                                            color: (_contador < 2)
                                                ? Colors.grey.shade100
                                                : Colors.grey.shade300,
                                            onPressed: () {
                                              final conexionPares = Provider.of<
                                                      SizeColorConexion>(
                                                  context,
                                                  listen: false);
                                              int cont = int.parse(
                                                  widget.usuario.pares![index]);
                                              if (cont > 1) {
                                                cont--;
                                                widget.usuario.pares![index] =
                                                    cont.toString();

                                                // conexionPares.totalPares = cont;
                                                setState(() {
                                                  widget.usuario.pares![index] =
                                                      cont.toString();
                                                  // totalPares = cont;
                                                });
                                                int sum = 0;

                                                for (int i = 0;
                                                    i <
                                                        widget.usuario.pares!
                                                            .length;
                                                    i++) {
                                                  sum = sum +
                                                      int.parse(widget
                                                          .usuario.pares![i]);
                                                }
                                                conexionPares.totalPares = sum;
                                                // setState(() {
                                                // });

                                                print(sum);
                                              } else {
                                                setState(() {});
                                              }
                                            },
                                          ),
                                          Text(
                                            '${widget.usuario.pares![index]}',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          IconButton(
                                              icon:
                                                  Icon(Icons.add_circle_sharp),
                                              color: Colors.grey.shade300,
                                              onPressed: () {
                                                final conexionPares = Provider
                                                    .of<SizeColorConexion>(
                                                        context,
                                                        listen: false);
                                                int cont = int.parse(widget
                                                    .usuario.pares![index]);
                                                cont++;
                                                widget.usuario.pares![index] =
                                                    cont.toString();
                                                // conexionPares.totalPares = cont;
                                                setState(() {
                                                  widget.usuario.pares![index] =
                                                      cont.toString();
                                                  // totalPares = cont;
                                                });
                                                int sum = 0;
                                                for (int i = 0;
                                                    i <
                                                        widget.usuario.pares!
                                                            .length;
                                                    i++) {
                                                  sum = sum +
                                                      int.parse(widget
                                                          .usuario.pares![i]);
                                                }
                                                conexionPares.totalPares = sum;
                                              }),
                                          // Text('Disponibles:  ' + _paresTalla),
                                        ])
                                    // ElevatedButton(
                                    //   child: Text('Agregar'),
                                    //   onPressed: () async {
                                    //     sizeService.idSize =
                                    //         widget.usuario.id![index];
                                    //     sizeService.selectedSize = new SizeModel();
                                    //     sizeService.selectedSize.nombreTalla =
                                    //         int.parse(
                                    //             widget.usuario.tallas![index]);
                                    //     sizeService.selectedSize.paresTalla =
                                    //         int.parse(widget.usuario.pares![index]);
                                    //     await sizeService
                                    //         .updateSize(sizeService.selectedSize);
                                    //   },
                                    // )
                                    // TextFormField(
                                    //   // textInputAction: TextInputAction.done,
                                    //   keyboardType: TextInputType.multiline,
                                    //   initialValue:
                                    //       widget.usuario.ppMayor![index].toString(),
                                    //   decoration: InputDecoration(
                                    //     labelText: 'Precio por par',
                                    //   ),
                                    //   onChanged: (value) {
                                    //     setState(() {
                                    //       _subTotal = double.parse(value);
                                    //       widget.usuario.ppMayor![index] = _subTotal *
                                    //           double.parse(
                                    //               widget.usuario.pares![index]);
                                    //       // idSizeColorConexion.totalVentas = _subTotal;
                                    //       for (int i = 0;
                                    //           i < widget.usuario.ppMayor!.length;
                                    //           i++) {
                                    //         totalVenta = totalVenta +
                                    //             widget.usuario.ppMayor![i];
                                    //         // idSizeColorConexion.totalVentas = totalVenta.toString();
                                    //       }
                                    //       idSizeColorConexion.totalVentas =
                                    //           totalVenta;
                                    //     });
                                    //   },
                                    // ),
                                    ),
                              ),
                              // Expanded(
                              //     child: Container(
                              //   child: IconButton(
                              //       onPressed: () {
                              //         widget.usuario.pares!.removeAt(index);
                              //       },
                              //       icon: Icon(Icons.close)),
                              // ))
                            ],
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       vertical: 8, horizontal: 20),
                          //   child: Divider(),
                          // ),

                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       IconButton(
                          //         icon: Icon(Icons.remove_circle_sharp),
                          //         color: (_contador < 2)
                          //             ? Colors.grey.shade100
                          //             : Colors.grey.shade300,
                          //         onPressed: () {
                          //           int cont =
                          //               int.parse(widget.usuario.pares![index]);
                          //           if (cont > 1) {
                          //             cont--;
                          //             setState(() {
                          //               widget.usuario.pares![index] =
                          //                   cont.toString();
                          //             });
                          //           } else {
                          //             setState(() {});
                          //           }
                          //         },
                          //       ),
                          //       Text(
                          //         '${widget.usuario.pares![index]}',
                          //         style: TextStyle(fontSize: 14),
                          //       ),
                          //       IconButton(
                          //           icon: Icon(Icons.add_circle_sharp),
                          //           color: Colors.grey.shade300,
                          //           onPressed: () {
                          //             int cont =
                          //                 int.parse(widget.usuario.pares![index]);
                          //             cont++;
                          //             setState(() {
                          //               widget.usuario.pares![index] =
                          //                   cont.toString();
                          //             });
                          //           }),
                          //       // Text('Disponibles:  ' + _paresTalla),
                          //     ])
                          // Text('Subtotal: \$ ${widget.usuario.ppMayor![index]}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BotonVenta extends StatelessWidget {
  final String mensajeBotonVenta;

  const BotonVenta({required this.mensajeBotonVenta});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // primary: LinearGradient(colors: colors),
          minimumSize: Size(size.width * 0.8, 80),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
            ),
          ),
        ),
        child: Text(this.mensajeBotonVenta),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class BotonVenta2 extends StatefulWidget {
  final Cart usuario2;

  const BotonVenta2(
    this.usuario2,
  );

  @override
  State<BotonVenta2> createState() => _BotonVenta2State();
}

class _BotonVenta2State extends State<BotonVenta2> {
  void displayDialog4() {
    String precioTarea = '0.0';
    final idSizeColorConexion =
        Provider.of<SizeColorConexion>(context, listen: false);
    Timer? _timer;
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        _timer = Timer(Duration(seconds: 100), () {
          Navigator.pop(context);
        });
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
                child: Text('Guardar'),
                onPressed: () {
                  if (precioTarea.isNotEmpty) {
                    idSizeColorConexion.totalTarea = double.parse(precioTarea);
                    Navigator.pop(context);
                    // print('No es vacio');
                    // print('l' + precioTarea + 'l');
                  } else {
                    idSizeColorConexion.totalTarea = 0.0;
                    Navigator.pop(context);
                  }
                }
                // (precioTarea.isEmpty != true)
                //     ? () {
                //         idSizeColorConexion.totalTarea =
                //             double.parse(precioTarea);
                //         Navigator.pop(context);
                //         // print('No es vacio');
                //       }
                //     : () {
                //         print('Mauren');
                //         idSizeColorConexion.totalTarea = 0.0;
                //         Navigator.pop(context);
                //       },
                ),
          ],
          elevation: 5,
          title: Text('Ingrese el costo de la tarea'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Ingresa el valor acá',
                  labelText: 'Costo',
                  // suffixIcon: Icon(FontAwesomeIcons.edit),
                  prefixIcon: Icon(
                    FontAwesomeIcons.edit,
                    size: 20,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    precioTarea = value;
                  });
                },
              ),
              // Icon(
              //   FontAwesomeIcons.exclamation,
              //   color: Colors.red,
              //   size: 100,
              // ),
              // SizedBox(height: 5),
              // Center(
              //   child: Text(
              //     'Esta talla ya fue agregada, selecciona otra!',
              //     style: TextStyle(
              //       color: Colors.white,
              //       // fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10),
            ],
          ),
          // backgroundColor: Colors.black54,
          // contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom),
          // backgroundColor: Colors.black54,
          // content: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [Text('Se agrego correctamente')],
          // ),
        );
      },
    ).then((value) => {
          if (_timer!.isActive) {_timer!.cancel()}
        });
  }

  @override
  Widget build(BuildContext context) {
    final tareasService = Provider.of<TareasService>(context);
    final sizeService = Provider.of<SizesService>(context);
    final idSizeColorConexion = Provider.of<SizeColorConexion>(context);
    final cartTareasService = Provider.of<CartTareasService>(context);
    final size = MediaQuery.of(context).size;
    double totalVenta2 = 0.0;
    // int totalPares = 0;
    for (int i = 0; i < widget.usuario2.ppMayor!.length; i++) {
      totalVenta2 = totalVenta2 + widget.usuario2.ppMayor![i];
      // totalPares = totalPares + int.parse(widget.usuario2.pares![i]);
    }
    int sum = 0;
    for (int i = 0; i < widget.usuario2.pares!.length; i++) {
      sum = sum + int.parse(widget.usuario2.pares![i]);
      // idSizeColorConexion.totalPares = sum;
    }
    void datosConfirmar() {
      idSizeColorConexion.referencia = widget.usuario2.telefono;
      int posCol = widget.usuario2.colores!.length - 1;
      idSizeColorConexion.color = widget.usuario2.colores![posCol];
    }

    void displayDialog6() {
      Timer? _timer;
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          _timer = Timer(Duration(seconds: 5), () {
            Navigator.pop(context);
          });
          return FadeIn(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 5,
              title: Center(
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.check,
                        color: Colors.teal,
                        size: 100,
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Text(
                          'Registro exitoso!',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.black54,
              // contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom),
              // backgroundColor: Colors.black54,
              // content: Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [Text('Se agrego correctamente')],
              // ),
            ),
          );
        },
      ).then((value) => {
            if (_timer!.isActive) {_timer!.cancel()}
          });
    }

    void enviar() async {
      int posCol = widget.usuario2.colores!.length - 1;
      tareasService.selectedTarea = new TareasModel(
        cantParesZapatos: sum,
        color: widget.usuario2.colores![posCol],
        costoTarea: idSizeColorConexion.totalTarea,
        fechaTarea: new DateTime.now().toString().substring(0, 10),
        referencia: widget.usuario2.telefono,
        proveedor: 'Cachatina',
      );
      await tareasService.createTarea(tareasService.selectedTarea);
      print(tareasService.selectedTarea.id);
      final prueba2 = Provider.of<SizesService>(context, listen: false);
      prueba2.idNewTarea = tareasService.selectedTarea.id;
      for (int i = 0; i < widget.usuario2.tallas!.length; i++) {
        sizeService.selectedSize = new SizeModel(
          nombreTalla: int.parse(widget.usuario2.tallas![i]),
          paresTalla: int.parse(widget.usuario2.pares![i]),
        );
        await sizeService
          ..createSizeTarea(sizeService.selectedSize);
      }
      for (int i = 0; i < widget.usuario2.colores!.length; i++) {
        sizeService.idSize = widget.usuario2.id![i];
        sizeService.selectedSize = new SizeModel();
        sizeService.selectedSize.nombreTalla =
            int.parse(widget.usuario2.tallas![i]);
        sizeService.selectedSize.paresTalla =
            int.parse(widget.usuario2.pDisponibles![i]) +
                int.parse(widget.usuario2.pares![i]);
        await sizeService.updateSize(sizeService.selectedSize);
      }
      idSizeColorConexion.totalPares = 0;
      idSizeColorConexion.totalVentas = 0.0;
      idSizeColorConexion.totalTarea = 0.0;

      idSizeColorConexion.heroe3 = '';
      idSizeColorConexion.heroe4 = '';
      idSizeColorConexion.guardando = false;
      cartTareasService.deleteListCartShopping();
      displayDialog6();
    }

    void displayDialog5() {
      final idSizeColorConexion =
          Provider.of<SizeColorConexion>(context, listen: false);
      String precioTarea = '0.0';
      Timer? _timer;
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            _timer = Timer(Duration(seconds: 100), () {
              Navigator.pop(context);
            });
            // return Container(
            //   color: Colors,
            //   width: 100,
            //   height: 100,
            // );
            return FadeInUp(
              child: Dialog(
                insetPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                        child: Column(
                          children: [
                            Text(
                              'Resumen del registro',
                              style: TextStyle(fontSize: 20, letterSpacing: 1),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Referencia: '),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Color: '),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Cantidad de pares: '),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Costo por par: '),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Costo total de la tarea: '),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(idSizeColorConexion.referencia
                                        .toString()),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(idSizeColorConexion.color.toString()),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(sum.toString()),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text((idSizeColorConexion.totalTarea / sum)
                                        .round()
                                        .toString()),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(idSizeColorConexion.totalTarea
                                        .round()
                                        .toString()),
                                  ],
                                )
                              ],
                            ),
                            // IconButton(
                            //   onPressed: () {
                            //     Navigator.pop(context);
                            //   },
                            //   icon: Icon(Icons.close),
                            // ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Costo tarea',
                              style: TextStyle(fontSize: 20, letterSpacing: 1),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '\$ ' +
                                  idSizeColorConexion.totalTarea
                                      .round()
                                      .toString(),
                              style: TextStyle(fontSize: 35, letterSpacing: 2),
                            ),
                          ],
                        ),
                      ),
                      // color: Colors.red,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        // width: 10,
                        // height: 10,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 2,
                        right: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            // style: ElevatedButton.styleFrom(
                            //     minimumSize: Size(double.infinity, 40)),
                            onPressed: () {
                              enviar();

                              idSizeColorConexion.guardando = true;
                              Navigator.pop(context);

                              // print('hola');
                            },
                            child: Text('Confirmar registro'),
                          ),
                        )),
                  ],
                ),
              ),
              // child: AlertDialog(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10)),
              //   contentPadding: EdgeInsets.fromLTRB(24.0, 0, 0, 24.0),
              //   elevation: 5,
              //   content: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(''),
              //           IconButton(
              //             onPressed: () {
              //               Navigator.pop(context);
              //             },
              //             icon: Icon(Icons.close),
              //           )
              //         ],
              //       ),
              //       Text(
              //         'Resumen de registro',
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             // letterSpacing: 2,
              //             fontSize: 20),
              //       ),
              //     ],
              //   ),
              //   // content: Container(
              //   //   // height: double.infinity,
              //   //   // width: double.infinity,
              //   //   color: Colors.red,
              //   // ),
              //   // title: Row(
              //   //   children: [
              //   //     Text('Resumen de registro'),
              //   //     IconButton(onPressed: () {}, icon: Icon(Icons.close), )
              //   //   ],
              //   // ),
              //   actions: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         width: double.infinity,
              //         height: 40,
              //         // color: Colors.red,
              //         child: ElevatedButton(
              //             onPressed: () {}, child: Text('Confirmar tarea')),
              //       ),
              //     )
              //     // TextButton(
              //     //   child: Text('Cancelar'),
              //     //   onPressed: () {
              //     //     Navigator.pop(context);
              //     //   },
              //     // ),
              //     // TextButton(
              //     //     child: Text('Registar'),
              //     //     onPressed: () {
              //     //       if (precioTarea.isNotEmpty) {
              //     //         idSizeColorConexion.totalTarea =
              //     //             double.parse(precioTarea);
              //     //         Navigator.pop(context);
              //     //         // print('No es vacio');
              //     //         // print('l' + precioTarea + 'l');
              //     //       } else {
              //     //         idSizeColorConexion.totalTarea = 0.0;
              //     //         Navigator.pop(context);
              //     //       }
              //     //     }),
              //   ],
              //   // backgroundColor: Colors.black54,
              //   // contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom),
              //   // backgroundColor: Colors.black54,
              //   // content: Column(
              //   //   mainAxisSize: MainAxisSize.min,
              //   //   children: [Text('Se agrego correctamente')],
              //   // ),
              // ),
            );
          }).then((value) => {
            if (_timer!.isActive) {_timer!.cancel()}
          });
    }

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (idSizeColorConexion.totalTarea != 0.0)
              ? Color(0xff23BAE2)
              : Color.fromARGB(255, 233, 80, 9),
          minimumSize: Size(size.width * 0.9, 40),
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: (idSizeColorConexion.totalTarea != 0.0)
            ? Text('Registrar Tarea')
            : Text('Agregar costo de tarea'),
        onPressed: (idSizeColorConexion.guardando != true)
            ? () async {
                if (idSizeColorConexion.totalTarea != 0.0) {
                  datosConfirmar();
                  displayDialog5();
                } else {
                  displayDialog4();
                }
              }
            : null,
      ),
    );
  }
}
