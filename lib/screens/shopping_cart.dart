// import 'dart:js';

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logginapp2/models/cart_model.dart';
import 'package:logginapp2/models/tareasModel.dart';
import 'package:logginapp2/services/cart_service.dart';
import 'package:logginapp2/services/service_new_tareas.dart';
import 'package:logginapp2/services/services.dart';
import 'package:logginapp2/services/sizes_colors_conexion.dart';
import 'package:logginapp2/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class ShoppingCartScreen extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    final cartShoppingService = Provider.of<CartService>(context);
    final idSizeColorConexion = Provider.of<SizeColorConexion>(context);
    // final cartTareasService = Provider.of<CartTareasService>(context);
    // final Cart usuario;
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 10,
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //     bottomRight: Radius.circular(20),
      //     bottomLeft: Radius.circular(20),
      //   )),
      //   title: Text('${idSizeColorConexion.totalVentas}'),
      //   actions: [
      //     IconButton(
      //         icon: Icon(Icons.delete_forever),
      //         onPressed: () {
      //           cartShoppingService.deleteListCartShopping();
      //           // sum = 0;
      //         })
      //   ],
      // ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      //   child: Container(
      //     width: double.infinity,
      //     height: 70,
      //     decoration: BoxDecoration(
      //       color: Colors.indigo,
      //       borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(10),
      //         bottomRight: Radius.circular(10),
      //         topLeft: Radius.circular(10),
      //         topRight: Radius.circular(10),
      //       ),
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.black.withOpacity(0.5),
      //           blurRadius: 10,
      //           offset: Offset(0, 1),
      //         )
      //       ],
      //     ),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //             Column(
      //               children: [
      //                 Text(
      //                   'Total Venta',
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold, color: Colors.white),
      //                 ),
      //                 Text(
      //                   '000.000',
      //                   style: TextStyle(color: Colors.white),
      //                 )
      //               ],
      //             ),
      //             Container(
      //               width: 110,
      //               height: 40,
      //               decoration: BoxDecoration(
      //                 border: Border.all(color: Colors.white),
      //                 borderRadius: BorderRadius.circular(10),
      //                 color: Colors.red.shade400,
      //               ),
      //               child: Center(
      //                 child: Text(
      //                   'Vender',
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold, color: Colors.white),
      //                 ),
      //               ),
      //             )
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.accessibility_rounded),
      //   onPressed: () {
      //     int numero =
      //         Provider.of<NotificationCart>(context, listen: false).numero;
      //     numero = Provider.of<NotificationCart>(context, listen: false)
      //         .numero = numero;
      //   },
      // ),
      body: cartShoppingService.existeUsuario
          ? Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                      margin: EdgeInsets.only(top: 180, bottom: 60),
                      child: ProductsCart(cartShoppingService.usuario)),
                ),
                FadeInRight(
                  child: Stack(
                    children: [
                      Header(cartShoppingService.usuario),
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
                            idSizeColorConexion.totalVentas = 0.0;
                            cartShoppingService.deleteListCartShopping();
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
                  child: FadeInLeft(
                      child: BotonVenta2(cartShoppingService.usuario)),
                )
                // Positioned(
                //   bottom: -5,
                //   left: 0,
                //   child: FadeInLeft(
                //       child: BotonVenta(
                //     mensajeBotonVenta: 'Vender',
                //   )),
                // )
              ],
            )
          : Center(
              child: ProductEmpty(
              icon: Icons.shopping_cart_outlined,
              titulo: 'El carrito está vacío',
              subTitulo: 'Por favor agrega un producto al carrito',
              tituloBoton: 'Registrar ventas',
              paginaBoton: 'home',
              color1: Colors.grey,
              color2: Colors.black,
            )),
    );
  }
}

class Header extends StatefulWidget {
  final Cart usuario2;

  const Header(this.usuario2);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    double totalVenta2 = 0.0;
    for (int i = 0; i < widget.usuario2.ppMayor!.length; i++) {
      totalVenta2 = totalVenta2 + widget.usuario2.ppMayor![i];
      // idSizeColorConexion.totalVentas = totalVenta.toString();
      // double.parse(idSizeColorConexion.totalVentas[i]) = totalVenta;
    }
    final idSizeColorConexion = Provider.of<SizeColorConexion>(context);
    print(idSizeColorConexion.totalVentas);
    // setState(() {});
    return IconHeader(
      icon: FontAwesomeIcons.percent,
      titulo: '${widget.usuario2.nombre}',
      total: '${totalVenta2.round()}',
      // total: idSizeColorConexion.totalVentas.toString(),
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
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
    final idSizeColorConexion = Provider.of<SizeColorConexion>(context);
    // listShoes.add(usuario.productos!);
    // print(listShoes);
    // var sum = usuario.pares!.reduce((value, element) => value + element);
    // var sum = usuario.pares!;
    // int.parse(sum.toString());
    double totalVenta = 0.0;
    double totalVenta2 = 0.0;
    for (int i = 0; i < widget.usuario.ppMayor!.length; i++) {
      totalVenta2 = totalVenta2 + widget.usuario.ppMayor![i];
      // idSizeColorConexion.totalVentas = totalVenta.toString();
      // double.parse(idSizeColorConexion.totalVentas[i]) = totalVenta;
    }
    // double.parse(totalVenta2.toString());
    // setState(() {
    //   idSizeColorConexion.totalVentas = totalVenta2;
    //   //   print(idSizeColorConexion);
    // });

    // print(totalVenta);
    double _subTotal = 0.0;
    int _contador = 1;
    int _paresTalla = 0;


    return Container(
      // width: double.infinity,
      // height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Lista de Venta:',
          //   // 'Lista de Venta: ${numero}',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
          // Divider(),
          // Card(
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          //   elevation: 5,
          //   child: Column(
          //     children: [
          //       ListTile(
          //         leading: Icon(Icons.account_circle_outlined),
          //         title: Text('Cliente: ${widget.usuario.nombre}'),
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.phone_iphone_rounded),
          //         title: Text('Telefono: ${widget.usuario.telefono}'),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   'Productos: ${widget.usuario.colores!.length} - Total a pagar: ${totalVenta2}',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
          // Divider(),
          FadeInUp(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.usuario.colores!.length,
              itemBuilder: (context, index) => Dismissible(
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
                onDismissed: (_) {
                  final cartShoppingService =
                      Provider.of<CartService>(context, listen: false);
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
                  // int sum = 0;

                  // for (int i = 0; i < widget.usuario.pares!.length; i++) {
                  //   sum = sum + int.parse(widget.usuario.pares![i]);
                  // }
                  // idSizeColorConexion.totalPares = sum;
                  if (widget.usuario.tallas!.length < 1) {
                    // idSizeColorConexion.totalPares = 0;
                    // idSizeColorConexion.totalVentas = 0.0;
                    // idSizeColorConexion.totalTarea = 0.0;

                    idSizeColorConexion.heroe3 = '';
                    idSizeColorConexion.heroe4 = '';
                    cartShoppingService.deleteListCartShopping();
                  }
                },
                key: UniqueKey(),
                child: Card(
                  // margin: EdgeInsets.all(-8.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  // borderOnForeground: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                       Text(' ${widget.usuario.colores![index]}', textAlign: TextAlign.left, style: TextStyle(letterSpacing: 1, fontSize: 16, fontWeight: FontWeight.w400),),
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
                                    child:
                                        widget.usuario.fotosUrl![index] == null
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
                                title:Text(
                                        'Talla: ${widget.usuario.tallas![index]}'),
                                    // Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    // children: [
                                    // Text(' ${widget.usuario.colores![index]}', textAlign: TextAlign.left, style: TextStyle(letterSpacing: 1, fontSize: 15, fontWeight: FontWeight.w300),),
                                // Text('10.000'),
                                // ],
                                // title: Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text('${usuario.colores![index]}'),
                                //     Text('10.000'),
                                //   ],
                                // ),
                                
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Text(
                                    //     'Talla: ${widget.usuario.tallas![index]}'),
                                    Text(
                                        'Pares: ${widget.usuario.pares![index]}',),
                                    // Text(
                                    //     '${widget.usuario.pDisponibles![index]}',)
                                  ],
                                ),
                                // trailing:
                              ),
                            ),
                            Expanded(
                              // width: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: TextFormField(
                                  // textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.number,
                                  initialValue: '\$',
                                  //     widget.usuario.ppMayor![index].toString(),
                                  decoration: InputDecoration(
                                    helperText: 'Precio por unidad',
                                    // labelText: 'Precio por par',
                                  //   // icon: FaIcon(FontAwesomeIcons.dollarSign),
                                  //   // border: OutlineInputBorder(),
                                  ),
                                  // onSaved: (value) {
                                  //   // producto.valorU = producto.valor;
                                  //   producto.valor = double.parse(value);
                                  //   producto.fotoSeleccionada = enlaceSeleccionado;
                                  //   producto.colorSeleccionado = _value;
                                  // },
                                  // validator: (value) {
                                  //   print(value);
                                  //   if (utils.isNumeric(value)) {
                                  //     return null;
                                  //   } else {
                                  //     return 'INGRESAR PRECIO';
                                  //   }
                                  // }
                                  // onChanged: (value) {
                                  //   setState(() {
                                  //     _subTotal = double.parse(value);
                                  //     // idSizeColorConexion.totalVentas = _subTotal;
                                  //     widget.usuario.ppMayor![index] =
                                  //         _subTotal *
                                  //             double.parse(
                                  //                 widget.usuario.pares![index]);
                                  //     // idSizeColorConexion.totalVentas = _subTotal;
                                  //     for (int i = 0;
                                  //         i < widget.usuario.ppMayor!.length;
                                  //         i++) {
                                  //       totalVenta = totalVenta +
                                  //           widget.usuario.ppMayor![i];
                                  //       // idSizeColorConexion.totalVentas = totalVenta.toString();
                                  //     }
                                  //     idSizeColorConexion.totalVentas =
                                  //         totalVenta;
                                  //   });
                                  // },
                                ),
                              ),
                            ),
                            // Expanded(
                            //   // width: 100,
                            //   child: Padding(
                            //       padding: const EdgeInsets.only(right: 15),
                            //       child: Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.center,
                            //           children: [
                            //             IconButton(
                            //               icon: Icon(Icons.remove_circle_sharp),
                            //               color: (_contador < 2)
                            //                   ? Colors.grey.shade100
                            //                   : Colors.grey.shade300,
                            //               onPressed: () {
                            //                 final conexionPares =
                            //                     Provider.of<SizeColorConexion>(
                            //                         context,
                            //                         listen: false);
                            //                 int cont = int.parse(
                            //                     widget.usuario.pares![index]);
                            //                 if (cont > 1) {
                            //                   cont--;
                            //                   widget.usuario.pares![index] =
                            //                       cont.toString();

                            //                   // conexionPares.totalPares = cont;
                            //                   setState(() {
                            //                     widget.usuario.pares![index] =
                            //                         cont.toString();
                            //                     // totalPares = cont;
                            //                   });
                            //                   int sum = 0;

                            //                   for (int i = 0;
                            //                       i <
                            //                           widget.usuario.pares!
                            //                               .length;
                            //                       i++) {
                            //                     sum = sum +
                            //                         int.parse(widget
                            //                             .usuario.pares![i]);
                            //                   }
                            //                   conexionPares.totalPares = sum;
                            //                   // setState(() {
                            //                   // });

                            //                   print(sum);
                            //                 } else {
                            //                   setState(() {});
                            //                 }
                            //               },
                            //             ),
                            //             Text(
                            //               '${widget.usuario.pares![index]}',
                            //               style: TextStyle(fontSize: 14),
                            //             ),
                            //             IconButton(
                            //                 icon: Icon(Icons.add_circle_sharp),
                            //                 color: Colors.grey.shade300,
                            //                 onPressed: () {
                            //                   final conexionPares = Provider.of<
                            //                           SizeColorConexion>(
                            //                       context,
                            //                       listen: false);
                            //                   int cont = int.parse(
                            //                       widget.usuario.pares![index]);
                            //                   cont++;
                            //                   widget.usuario.pares![index] =
                            //                       cont.toString();
                            //                   // conexionPares.totalPares = cont;
                            //                   setState(() {
                            //                     widget.usuario.pares![index] =
                            //                         cont.toString();
                            //                     // totalPares = cont;
                            //                   });
                            //                   int sum = 0;
                            //                   for (int i = 0;
                            //                       i <
                            //                           widget.usuario.pares!
                            //                               .length;
                            //                       i++) {
                            //                     sum = sum +
                            //                         int.parse(widget
                            //                             .usuario.pares![i]);
                            //                   }
                            //                   conexionPares.totalPares = sum;
                            //                 }),
                            //             // Text('Disponibles:  ' + _paresTalla),
                            //           ])
                            //       // ElevatedButton(
                            //       //   child: Text('Agregar'),
                            //       //   onPressed: () async {
                            //       //     sizeService.idSize =
                            //       //         widget.usuario.id![index];
                            //       //     sizeService.selectedSize = new SizeModel();
                            //       //     sizeService.selectedSize.nombreTalla =
                            //       //         int.parse(
                            //       //             widget.usuario.tallas![index]);
                            //       //     sizeService.selectedSize.paresTalla =
                            //       //         int.parse(widget.usuario.pares![index]);
                            //       //     await sizeService
                            //       //         .updateSize(sizeService.selectedSize);
                            //       //   },
                            //       // )
                            //       // TextFormField(
                            //       //   // textInputAction: TextInputAction.done,
                            //       //   keyboardType: TextInputType.multiline,
                            //       //   initialValue:
                            //       //       widget.usuario.ppMayor![index].toString(),
                            //       //   decoration: InputDecoration(
                            //       //     labelText: 'Precio por par',
                            //       //   ),
                            //       //   onChanged: (value) {
                            //       //     setState(() {
                            //       //       _subTotal = double.parse(value);
                            //       //       widget.usuario.ppMayor![index] = _subTotal *
                            //       //           double.parse(
                            //       //               widget.usuario.pares![index]);
                            //       //       // idSizeColorConexion.totalVentas = _subTotal;
                            //       //       for (int i = 0;
                            //       //           i < widget.usuario.ppMayor!.length;
                            //       //           i++) {
                            //       //         totalVenta = totalVenta +
                            //       //             widget.usuario.ppMayor![i];
                            //       //         // idSizeColorConexion.totalVentas = totalVenta.toString();
                            //       //       }
                            //       //       idSizeColorConexion.totalVentas =
                            //       //           totalVenta;
                            //       //     });
                            //       //   },
                            //       // ),
                            //       ),
                            // ),
                          ],
                        ),
                        // Container(
                        //   width: 130,
                        //   child: TextFormField(
                        //     textInputAction: TextInputAction.done,
                        //     keyboardType: TextInputType.multiline,
                        //     initialValue: (widget.usuario.ppMayor![index] /
                        //             int.parse(widget.usuario.pares![index]))
                        //         .toString(),
                        //     decoration: InputDecoration(
                        //       // helperText: 'Precio por unidad',
                        //       labelText: 'Precio por par',
                        //       icon: FaIcon(FontAwesomeIcons.dollarSign),
                        //       // border: OutlineInputBorder(),
                        //     ),
                        //     onChanged: (value) {
                        //       setState(() {
                        //         _subTotal = double.parse(value);
                        //         // idSizeColorConexion.totalVentas = _subTotal;
                        //         widget.usuario.ppMayor![index] = _subTotal *
                        //             double.parse(widget.usuario.pares![index]);
                        //         // idSizeColorConexion.totalVentas = _subTotal;
                        //         for (int i = 0;
                        //             i < widget.usuario.ppMayor!.length;
                        //             i++) {
                        //           totalVenta =
                        //               totalVenta + widget.usuario.ppMayor![i];
                        //           // idSizeColorConexion.totalVentas = totalVenta.toString();
                        //         }
                        //         idSizeColorConexion.totalVentas = totalVenta;
                        //       });
                        //     },
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: Divider(),
                        ),
                        // Text('${widget.usuario.pDisponibles![index]} ' ' Disponibles', textAlign: TextAlign.start,),
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                          
                            Expanded(
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
                                              color: (_contador < _paresTalla)
                                                ? Colors.grey.shade100
                                                : Colors.grey.shade300,
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
                                          SizedBox(
                                            width: 70
                                          ),
                                          Expanded(child: Text('Subtotal: \$ ${widget.usuario.ppMayor![index]}')),
                                        ], 
                                        
                                        
                                        
                                        
                                    )
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
            
                            
                          ],
                        ),
                        Text('${widget.usuario.pDisponibles![index]} ' ' Disponibles', textAlign: TextAlign.start,),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // ...usuario.productos!
          //     .map(
          //       (producto) => Card(
          //         child: ListTile(
          //           leading: Icon(
          //             Icons.check_circle_rounded,
          //             color: Colors.teal.shade800,
          //           ),
          //           title: Text(producto),
          //           subtitle: Text('${usuario.telefono}'),
          //         ),
          //       ),
          //     )
          //     .toList(),
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
            ? Text('Registrar Venta')
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
