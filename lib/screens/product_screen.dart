import 'dart:async';
// import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/services.dart';
// import 'package:logginapp2/models/cart_model.dart';
import 'package:logginapp2/models/models.dart';
import 'package:logginapp2/providers/product_form_provider.dart';
import 'package:logginapp2/services/services.dart';
// import 'package:logginapp2/services/sizes_colors_conexion.dart';
// import 'package:logginapp2/ui/input_decorations.dart';
import 'package:logginapp2/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final String? url;

  const ProductScreen({Key? key, this.url}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    // final colorsService = new ColorsService();
    final productService = Provider.of<ProductsServices>(context);
    final idSizeColorConexion = Provider.of<SizeColorConexion>(context);
    if (idSizeColorConexion.reset2 == true) {
      _colorSeleccionado = '';
      _tallaSeleccionada = '';
      _value = '';
      _enlaceSeleccionado = '';
      _fotoUrl = '';
      _paresTalla = '';
      _contador = 1;
      // idSizeColorConexion.heroe = _value;
      // idSizeColorConexion.heroe2 = '';
      _precioMayorista = 0.0;
      // idSizeColorConexion.top = 100.0;
    }
    // return Scaffold(
    //   body: CustomScrollView(
    //     slivers: [
    //       _CustomAppBar(),
    //       SliverList(
    //           delegate: SliverChildListDelegate([
    //         _ProductForm(),
    //       ])),
    //     ],
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    //   floatingActionButton: FloatingActionButton(
    //     child: Icon(Icons.save_outlined),
    //     onPressed: () {},
    //   ),
    // );
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: _ProductScreenBody(productService: productService),
    );
    // return _ProductScreenBody(productService: productService);
  }
}

class _ProductScreenBody extends StatefulWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsServices productService;

  @override
  __ProductScreenBodyState createState() => __ProductScreenBodyState();
}

class __ProductScreenBodyState extends State<_ProductScreenBody> {
  void displayDialog() {
    Timer? _timer;
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        _timer = Timer(Duration(seconds: 1), () {
          Navigator.pop(context);
        });
        return Padding(
          padding: const EdgeInsets.only(top: 300),
          child: AlertDialog(
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 5,
            title: Center(
              child: Text(
                '¡Agregado al carrito!',
                style: TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom),
            backgroundColor: Colors.black54,
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

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final idSizeColorConexion = Provider.of<SizeColorConexion>(context);
    final cartShoppingService = Provider.of<CartService>(context);
    final productService = Provider.of<ProductsServices>(context);
    return Scaffold(
      backgroundColor: Colors.white,
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  SizedBox(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: (cartShoppingService.existeUsuario) ? 210 : 135,
                      curve: Curves.easeInOut,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orangeAccent,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Ver Carrito'),
                              SizedBox(
                                width: 2,
                              ),
                              Stack(
                                children: [
                                  Icon(Icons.shopping_cart_outlined),
                                  Positioned(
                                      top: 0.0,
                                      right: 0.0,
                                      child: cartShoppingService.existeUsuario
                                          ? BounceInDown(
                                              child: Container(
                                                child: Contador2(
                                                    cartShoppingService
                                                        .usuario),
                                                alignment: Alignment.center,
                                                width: 12,
                                                height: 12,
                                                decoration: BoxDecoration(
                                                    color: Colors.redAccent,
                                                    shape: BoxShape.circle),
                                              ),
                                            )
                                          : Container())
                                ],
                              ),
                            ]),
                        onPressed: (cartShoppingService.existeUsuario)
                            ? () {
                                Navigator.pushNamed(context, 'shoppingCart');
                              }
                            : null,
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    // child: Container(
                    //     // color: Colors.grey,
                    //     decoration: BoxDecoration(
                    //       color: (idSizeColorConexion.heroe4 == 'Mauren Cobos')
                    //           ? Colors.grey
                    //           : Colors.red.shade400,
                    //       borderRadius: BorderRadius.only(
                    //           bottomRight: Radius.circular(60),
                    //           topRight: Radius.circular(60)),
                    //       // boxShadow: [
                    //       //   BoxShadow(
                    //       //     color: Colors.black.withOpacity(0.5),
                    //       //     blurRadius: 10,
                    //       //     offset: Offset(0, 1),
                    //       //   )
                    //       // ],
                    //     ),
                    // width: double.infinity,
                    // height: 40,
                    child: cartShoppingService.existeUsuario
                        ? _BotonAgregarVenta(
                            usuario2: cartShoppingService.usuario,
                            productService: productService,
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff23BAE2),
                            ),
                            child: Text('Agregar a tarea'),
                            onPressed: () async {
                              // print(idSizeColorConexion.guardando);
                              if (_tallaSeleccionada != '') {
                                final newUser = await new Cart(
                                  nombre: 'Mauren Cobos',
                                  telefono: productService
                                      .selectedProduct.referencia
                                      .toString(),
                                  colores: [],
                                  tallas: [],
                                  pares: [],
                                  pDisponibles: [],
                                  fotosUrl: [],
                                  ppMayor: [],
                                  id: [],
                                );
                                cartShoppingService.usuario = newUser;
                                idSizeColorConexion.heroe4 = newUser.nombre;

                                print(cartShoppingService.usuario);
                                print(idSizeColorConexion.heroe4);
                                ////////////////////////////

                                if (_value == idSizeColorConexion.heroe3 ||
                                    idSizeColorConexion.heroe3 == '') {
                                  final prueba2 = Provider.of<SizesService>(
                                      context,
                                      listen: false);
                                  prueba2.idProducto =
                                      widget.productService.selectedProduct.id;
                                  prueba2.idColor = _value;
                                  print(prueba2.idProducto);
                                  _precioMayorista = widget.productService
                                      .selectedProduct.valorUnidad!;
                                  cartShoppingService
                                      .agregarColor(_colorSeleccionado);
                                  cartShoppingService
                                      .agregarTallas(_tallaSeleccionada);
                                  cartShoppingService.agregarUrlFotos(_fotoUrl);
                                  cartShoppingService
                                      .agregarPares(_contador.toString());
                                  cartShoppingService
                                      .agregarPpMayor(_precioMayorista);
                                  cartShoppingService
                                      .agregarId(idSizeColorConexion.heroe2);
                                  idSizeColorConexion.heroe3 = prueba2.idColor;
                                  cartShoppingService
                                      .agregarPdisponibles(_paresTalla);
                                  // cartTareasService.agregarColor(' Color: ' +
                                  //     _colorSeleccionado +
                                  //     ' Talla: ' +
                                  //     _tallaSeleccionada +
                                  //     ' Pares: ' +
                                  //     _contador.toString()),
                                  // print('el color' + _value)
                                  displayDialog();
                                  // Navigator.pushNamed(context, 'home')

                                } else {
                                  // displayDialog2();
                                }
                              } else {
                                // displayDialog3();
                              }
                            }
                            // ),
                            ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // FadeInUp(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     // crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Container(
        //         // color: Colors.grey,
        //         decoration: BoxDecoration(
        //           color: (_tallaSeleccionada != '')
        //               ? Colors.red.shade400
        //               : Colors.grey,
        //           borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(60),
        //               topRight: Radius.circular(60)),
        //           // boxShadow: [
        //           //   BoxShadow(
        //           //     color: Colors.black.withOpacity(0.5),
        //           //     blurRadius: 10,
        //           //     offset: Offset(0, 1),
        //           //   )
        //           // ],
        //         ),
        //         width: 60,
        //         child: IconButton(
        //           icon: Icon(Icons.person_add_outlined, color: Colors.white),
        //           onPressed: (_tallaSeleccionada != '')
        //               ? () {
        //                   final newUser = new Cart(
        //                     nombre: 'Mauren Cobos',
        //                     telefono: '3182356737',
        //                     colores: [],
        //                     tallas: [],
        //                     pares: [],
        //                     fotosUrl: [],
        //                     ppMayor: [],
        //                   );
        //                   cartShoppingService.usuario = newUser;
        //                   print(cartShoppingService.usuario);
        //                 }
        //               : null,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 1,
        //       ),
        //       Container(
        //         // color: Colors.grey,
        //         decoration: BoxDecoration(
        //           color: (_tallaSeleccionada != '')
        //               ? Colors.red.shade400
        //               : Colors.grey,
        //           // borderRadius: BorderRadius.only(
        //           //   bottomLeft: Radius.circular(60),
        //           //   bottomRight: Radius.circular(60),
        //           // ),
        //           // boxShadow: [
        //           //   BoxShadow(
        //           //     color: Colors.black.withOpacity(0.5),
        //           //     blurRadius: 10,
        //           //     offset: Offset(0, 1),
        //           //   )
        //           // ],
        //         ),
        //         width: 60,
        //         child: IconButton(
        //           icon: Icon(Icons.change_history_rounded, color: Colors.white),
        //           onPressed: (_tallaSeleccionada != '')
        //               ? () => Navigator.pushNamed(context, 'shoppingCart')
        //               : null,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 1,
        //       ),
        //       Container(
        //         // color: Colors.grey,
        //         decoration: BoxDecoration(
        //           color: (_tallaSeleccionada != '')
        //               ? Colors.red.shade400
        //               : Colors.grey,
        //           borderRadius: BorderRadius.only(
        //             bottomLeft: Radius.circular(60),
        //             bottomRight: Radius.circular(60),
        //           ),
        //           // boxShadow: [
        //           //   BoxShadow(
        //           //     color: Colors.black.withOpacity(0.5),
        //           //     blurRadius: 10,
        //           //     offset: Offset(0, 1),
        //           //   )
        //           // ],
        //         ),
        //         width: 60,
        //         child: IconButton(
        //           icon: Icon(Icons.add_shopping_cart, color: Colors.white),
        //           onPressed: (_tallaSeleccionada != '')
        //               ? () => {
        //                     _precioMayorista = widget
        //                         .productService.selectedProduct.valorUnidad!,
        //                     cartShoppingService
        //                         .agregarColor(_colorSeleccionado),
        //                     cartShoppingService
        //                         .agregarTallas(_tallaSeleccionada),
        //                     cartShoppingService.agregarUrlFotos(_fotoUrl),
        //                     cartShoppingService
        //                         .agregarPares(_contador.toString()),
        //                     cartShoppingService
        //                         .agregarPpMayor(_precioMayorista),
        //                     // cartShoppingService.agregarColor(' Color: ' +
        //                     //     _colorSeleccionado +
        //                     //     ' Talla: ' +
        //                     //     _tallaSeleccionada +
        //                     //     ' Pares: ' +
        //                     //     _contador.toString()),
        //                     // print('el color' + _value)
        //                     displayDialog(),
        //                     // Navigator.pushNamed(context, 'home')
        //                   }
        //               : null,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        //     FloatingActionButton(
        //   child: Icon(Icons.request_page_outlined),
        //   onPressed: () async {
        //     if (!productForm.isValidForm()) return;
        //     await widget.productService
        //         .saveOrCreateProduct(productForm.product);
        //   },
        // ),
        body: SingleChildScrollView(
          child: FadeInRight(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    (_enlaceSeleccionado == '')
                        ? ProductImage(
                            url: widget.productService.selectedProduct.fotoUrl,
                            imagenHeight:(_tallaSeleccionada != '') ? 250 : 300,
                            )
                        : ProductImage(
                          url: _enlaceSeleccionado,
                          imagenHeight:(_tallaSeleccionada != '') ? 280 : 300,                          
                        ),
                    _ProductDetails(
                      title: 'Ref. ' +
                          widget.productService.selectedProduct.referencia!,
                      subTitle: 'P. Sugerido. ' +
                          '\$' +
                          widget.productService.selectedProduct.valorUnidad
                              .toString(),
                      tituloHeight:(_tallaSeleccionada != '') ? 90 : 95
                    ),
                    Positioned(
                      top: 60,
                      left: 20,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 130),
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => {
                            _colorSeleccionado = '',
                            _tallaSeleccionada = '',
                            _value = '',
                            _enlaceSeleccionado = '',
                            _fotoUrl = '',
                            _paresTalla = '',
                            _contador = 1,
                            idSizeColorConexion.heroe = _value,
                            idSizeColorConexion.heroe2 = '',
                            _precioMayorista = 0.0,
                            Navigator.of(context).pop(),
                            // setState(){}
                          },
                          icon: Icon(Icons.arrow_back_ios_rounded,
                              size: 25, color: Colors.white),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   top: 60,
                    //   right: 20,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //         primary: Color.fromRGBO(0, 0, 0, 130)),
                    //     child: Text('Tareas'),
                    //     onPressed: () {
                    //       Navigator.of(context).pop();
                    //     },
                    //   ),
                    // ),
                    // Positioned(
                    //   top: 60,
                    //   right: 20,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: Color.fromRGBO(0, 0, 0, 130),
                    //         borderRadius: BorderRadius.circular(20)),
                    //     child: IconButton(
                    //       padding: EdgeInsets.zero,
                    //       onPressed: () => {
                    //         Navigator.of(context).pop(),
                    //         // setState(){}
                    //       },
                    //       icon: Text(
                    //         'Tareas',
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       // icon: Icon(Icons.arrow_back_ios_rounded,
                    //       //     size: 25, color: Colors.white),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                // _GridColores(),
                _ProductForm(),
              ],
            ),
          ),
        ));
  }
}

class _ProductDetails extends StatelessWidget {
  final String title;
  final String subTitle;
  final double? tituloHeight;

  const _ProductDetails({required this.title, required this.subTitle, this.tituloHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: tituloHeight,
      decoration: _buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Text(
                this.title,
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Text(
                this.subTitle,
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Color.fromRGBO(0, 0, 0, 150),
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(60),
        
        // topRight: Radius.circular(100),
        // bottomLeft: Radius.circular(60),
      ));
}

String _colorSeleccionado = '';
String _tallaSeleccionada = '';
String _paresTalla = '';
String _value = '';
String _enlaceSeleccionado = '';
String _fotoUrl = '';
int _contador = 1;
double _valorVenta = 0;
double _precioMayorista = 0.0;

class _GridColores extends StatefulWidget {
  @override
  __GridColoresState createState() => __GridColoresState();
}

class __GridColoresState extends State<_GridColores> {
  final colorsService = new ColorsService();
  void changeShape() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    return FutureBuilder(
      future: colorsService.cargarProductos(product.id.toString()),
      builder:
          (BuildContext context, AsyncSnapshot<List<ColorModel>> snapshot) {
        if (snapshot.hasData) {
          final colors = snapshot.data;
          return Column(
            children: [
              // Text(),
              GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 70,
                    childAspectRatio: 4.99 / 5,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: colors!.length,
                  itemBuilder: (BuildContext context, int i) =>
                      _crearItem(context, colors[i])

                  // GestureDetector(
                  //   onTap: ()=> Navigator.pushNamed(context, 'product'),
                  //   child: Container(
                  //     // color: Colors.grey,
                  //     decoration: _cardColorsDecorations(),
                  //   ),
                  // )

                  ),
              // _GridSeleccionarTallas(),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ColorModel color) {
    final idSizeColorConexion = Provider.of<SizeColorConexion>(context);
    return GestureDetector(
      onTap: () => {
        setState(() => {
              _colorSeleccionado = color.nombreColor.toString(),
              _enlaceSeleccionado = color.fotoColor.toString(),
              print(idSizeColorConexion.heroe2),
              idSizeColorConexion.heroe2 = '',
              _value = color.id.toString(),
              idSizeColorConexion.heroe = _value,
              _paresTalla = '',
              _tallaSeleccionada = '',
              _contador = 1,
              // _enlaceSeleccionado = color.fotoColor.toString(),
              // _ProductForm(),
              _fotoUrl = color.fotoColor.toString(),
              print(_value),
              // print(idSizeColorConexion.heroe),
            }),
        // changeShape
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: _value == color.id ? Colors.red : Colors.transparent,
                width: 2.0),
            borderRadius: BorderRadius.circular(12.0)),

        // height: 80,
        // width: 80,
        child: Column(children: [
          (color.fotoColor == null)
              ? Image(image: AssetImage('assets/no-image.png'))
              : Padding(
                  padding: const EdgeInsets.all(1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: FadeInImage(
                        image: NetworkImage(color.fotoColor!),
                        fit: BoxFit.cover,
                        placeholder: AssetImage('assets/jar-loading.gif'),
                        // height: ,
                        // width: double.infinity,
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
        ]),
        // color: Colors.grey,
        // decoration: _cardColorsDecorations(),
      ),
    );
  }

  BoxDecoration _cardColorsDecorations() {
    return BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 2,
          ),
        ]);
  }

  // BoxDecoration _buildBoxDecoration() => BoxDecoration(
  //     color: Color.fromRGBO(0, 0, 0, 150),
  //     borderRadius: BorderRadius.only(
  //         bottomRight: Radius.circular(60),
  //         // topRight: Radius.circular(100),
  //         // bottomLeft: Radius.circular(60),
  //         )
  //         );

}

class _ProductForm extends StatefulWidget {
  @override
  __ProductFormState createState() => __ProductFormState();
}

class __ProductFormState extends State<_ProductForm> {
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    final idSizeColorConexion = Provider.of<SizeColorConexion>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      // height: 400,
      decoration: _buildBoxDecoration(),
      child: Form(
        key: productForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: (_colorSeleccionado != '') ? 15 : 40,
                  curve: Curves.easeInOut,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Selecciona el color a vender: '),
                Text(
                  _colorSeleccionado,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            _GridColores(),
            (_value != '')
                ? Column(
                    children: [
                       SizedBox(
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: (_colorSeleccionado != '') ? 15 : 40,
                          curve: Curves.easeInOut,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Selecciona la talla a vender: '),
                          Text(
                            _tallaSeleccionada,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      _GridSeleccionarTallas(),
                      (idSizeColorConexion.heroe2 != '')
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('Cantidad:'),
                                    ),
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove_circle_sharp),
                                        color: (_contador < 2)
                                            ? Colors.grey.shade100
                                            : Colors.grey.shade300,
                                        onPressed: () {
                                          if (_contador > 1) {
                                            _contador--;
                                            setState(() {});
                                          } else {
                                            setState(() {});
                                          }
                                        },
                                      ),
                                      Text(
                                        '$_contador',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.add_circle_sharp),
                                          color: (_contador >
                                                  int.parse(_paresTalla) - 1)
                                              ? Colors.grey.shade100
                                              : Colors.grey.shade300,
                                          onPressed: () {
                                            if (_contador <
                                                int.parse(_paresTalla)) {
                                              _contador++;
                                              setState(() {});
                                            } else {
                                              setState(() {});
                                            }
                                          }),
                                      Text('Disponibles:  ' + _paresTalla),
                                    ])
                              ],
                            )
                          : Text('')
                    ],
                  )
                : Text(''),
            SizedBox(
              height: 20,
            )

            // Text('Idtalla: ' + idSizeColorConexion.heroe2),
            // (_value != '')
            // ? Text('Seleccione la talla a vender: ')
            // : Text(''),

            // PONER GRID DE TALLAS
            // _GridSeleccionarTallas(),

            // TextFormField(
            //   initialValue: product.referencia,
            //   onChanged: (value) => product.referencia = value,
            //   validator: (value) {
            //     if (value == null || value.length < 1) {
            //       return 'La referencia es obligatoria';
            //     }
            //   },
            //   autocorrect: false,
            //   decoration: InputDecorations.authInputDecoration(
            //       hintText: 'Referencia del zapato', labelText: 'Pedo'),
            // ),

            // SizedBox(
            //   height: 20,
            // ),
            // SwitchListTile.adaptive(
            //     title: Text('Disponible'),
            //     activeColor: Colors.indigo,
            //     value: product.disponible,
            //     onChanged: productForm.updateAvailability),
            // SizedBox(
            //   height: 30,
            // ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(60),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(-10, 5),
            )
          ]);

  //  BoxDecoration _buildBoxDecoration() => BoxDecoration(
  //     color: Color.fromRGBO(0, 0, 0, 150),
  //     borderRadius: BorderRadius.only(
  //         bottomRight: Radius.circular(60),
  //         // topRight: Radius.circular(100),
  //         // bottomLeft: Radius.circular(60),
  //         )
  //         );
}

class _GridSeleccionarTallas extends StatefulWidget {
  const _GridSeleccionarTallas({
    Key? key,
  }) : super(key: key);

  @override
  __GridSeleccionarTallasState createState() => __GridSeleccionarTallasState();
}

class __GridSeleccionarTallasState extends State<_GridSeleccionarTallas> {
  final sizesService = new SizesService();

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    // final colorModel = new ColorModel();

    final idSizeColorConexion = Provider.of<SizeColorConexion>(context);

    return FutureBuilder(
      future: sizesService.loadSizes(
          product.id.toString(), idSizeColorConexion.heroe),
      builder: (BuildContext context, AsyncSnapshot<List<SizeModel>> snapshot) {
        if (snapshot.hasData) {
          final sizes = snapshot.data;
          return Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 50,
                    childAspectRatio: 4.55 / 5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: sizes!.length,
                  itemBuilder: (BuildContext context, int i) =>
                      _crearItem2(context, sizes[i])
                  // GestureDetector(
                  //   onTap: ()=> Navigator.pushNamed(context, 'product'),
                  //   child: Container(
                  //     // color: Colors.grey,
                  //     decoration: _cardColorsDecorations(),
                  //   ),
                  // )

                  ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // String _value2 = '';

  Widget _crearItem2(BuildContext context, SizeModel size) {
    final idSizeColorConexion = Provider.of<SizeColorConexion>(context);
    // String _value2 = '';
    return Column(
      children: [
        GestureDetector(
          onTap: () => {
            setState(() => {
                  idSizeColorConexion.heroe2 = size.id.toString(),
                  _paresTalla = size.paresTalla.toString(),
                  _tallaSeleccionada = size.nombreTalla.toString(),
                  _contador = 1,
                  // _enlaceSeleccionado = producto.fotoUrl,
                  // _ProductForm(),
                  print('Talla' + idSizeColorConexion.heroe2),
                  print(size.paresTalla),
                }),
          },
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(
                      // borderRadius: BorderRadius.circular(10.0),
                      color: idSizeColorConexion.heroe2 == size.id
                          ? Colors.red
                          : Colors.transparent,
                      width: 1.0),
                  borderRadius: BorderRadius.circular(8.0)),
              // height: 80,
              // width: 80,
              child: Column(children: [
                (size.nombreTalla == null)
                    ? Image(image: AssetImage('assets/no-image.png'))
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(size.nombreTalla.toString(),
                            style: TextStyle(
                              fontSize: 13,
                            )),
                      )
              ]),
              // color: Colors.grey,
              // decoration: _cardColorsDecorations(),
            ),
          ),
        ),
      ],
    );
  }
}

class Contador2 extends StatelessWidget {
  final Cart usuario;

  const Contador2(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${usuario.colores!.length}',
      style: TextStyle(color: Colors.white, fontSize: 10),
    );
  }
}

class _BotonAgregarVenta extends StatefulWidget {
  final Cart? usuario2;
  final ProductsServices productService;

  const _BotonAgregarVenta(
      {Key? key, this.usuario2, required this.productService})
      : super(key: key);

  @override
  State<_BotonAgregarVenta> createState() => _BotonAgregarVentaState();
}

class _BotonAgregarVentaState extends State<_BotonAgregarVenta> {
  void displayDialog() {
    Timer? _timer;
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        _timer = Timer(Duration(seconds: 1), () {
          Navigator.pop(context);
        });
        return Padding(
          padding: const EdgeInsets.only(top: 300),
          child: AlertDialog(
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 5,
            title: Center(
              child: Text(
                '¡Agregado al carrito!',
                style: TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom),
            backgroundColor: Colors.black54,
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

  void displayDialog2() {
    Timer? _timer;
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        _timer = Timer(Duration(seconds: 5), () {
          Navigator.pop(context);
        });
        return AlertDialog(
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 5,
          title: Center(
            child: Container(
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.exclamation,
                    color: Colors.red,
                    size: 100,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Solo un color por tarea',
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
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
        );
      },
    ).then((value) => {
          if (_timer!.isActive) {_timer!.cancel()}
        });
  }

  void displayDialog3() {
    Timer? _timer;
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        _timer = Timer(Duration(seconds: 3), () {
          Navigator.pop(context);
        });
        return AlertDialog(
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 5,
          title: Center(
            child: Container(
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.exclamation,
                    color: Colors.red,
                    size: 100,
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Text(
                      'Selecciona un color y una talla',
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
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
        );
      },
    ).then((value) => {
          if (_timer!.isActive) {_timer!.cancel()}
        });
  }

  void displayDialog4() {
    Timer? _timer;
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        _timer = Timer(Duration(seconds: 3), () {
          Navigator.pop(context);
        });
        return AlertDialog(
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 5,
          title: Center(
            child: Container(
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.exclamation,
                    color: Colors.red,
                    size: 100,
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Text(
                      'Esta talla ya fue agregada, selecciona otra!',
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
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
        );
      },
    ).then((value) => {
          if (_timer!.isActive) {_timer!.cancel()}
        });
  }

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final idSizeColorConexion = Provider.of<SizeColorConexion>(context);
    // final cartTareasService = Provider.of<CartTareasService>(context);
    final colorService = Provider.of<ColorsService>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xff23BAE2),
      ),
      child: Text('Agregar al carrito'),
      onPressed: () async {
        final cartShoppingService =
            Provider.of<CartService>(context, listen: false);
        if (_tallaSeleccionada != '') {
          // if (_value == idSizeColorConexion.heroe3 ||
          //     idSizeColorConexion.heroe3 == '') {
          bool existe = false;
          for (int i = 0; i < widget.usuario2!.id!.length; i++) {
            if (idSizeColorConexion.heroe2 == widget.usuario2!.id![i]) {
              print('HOLA');
              existe = true;
            }
          }
          if (existe == false) {
            final prueba2 = Provider.of<SizesService>(context, listen: false);
            prueba2.idProducto = widget.productService.selectedProduct.id;
            prueba2.idColor = _value;
            print(prueba2.idProducto);
            _precioMayorista =
                widget.productService.selectedProduct.valorUnidad!;
            cartShoppingService.agregarColor(_colorSeleccionado);
            cartShoppingService.agregarTallas(_tallaSeleccionada);
            cartShoppingService.agregarUrlFotos(_fotoUrl);
            cartShoppingService.agregarPares(_contador.toString());
            cartShoppingService.agregarPpMayor(_precioMayorista);
            cartShoppingService.agregarId(idSizeColorConexion.heroe2);
            idSizeColorConexion.heroe3 = prueba2.idColor;
            cartShoppingService.agregarPdisponibles(_paresTalla);
            // cartTareasService.agregarColor(' Color: ' +
            //     _colorSeleccionado +
            //     ' Talla: ' +
            //     _tallaSeleccionada +
            //     ' Pares: ' +
            //     _contador.toString()),
            // print('el color' + _value)
            displayDialog();
            // Navigator.pushNamed(context, 'home')
          } else {
            // print('No agregado');
            displayDialog4();
          }
          // } else {
          //   displayDialog2();
          // }
        } else {
          displayDialog3();
        }
      },
      // ),
    );
  }
}

// class _CustomAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       actions: [
//         IconButton(
//             icon: Icon(Icons.photo_size_select_actual_outlined),
//             onPressed: () {}),
//         IconButton(icon: Icon(Icons.camera_alt_outlined), onPressed: () {}),
//       ],
//       backgroundColor: Colors.indigo,
//       expandedHeight: 300,
//       floating: false,
//       pinned: true,
//       flexibleSpace: FlexibleSpaceBar(
//         centerTitle: true,
//         titlePadding: EdgeInsets.all(0),
//         title: Container(
//           width: double.infinity,
//           alignment: Alignment.bottomCenter,
//           color: Colors.black12,
//           // child: Text('AzulBlue'),
//         ),
//         background: this.url == null
//         ?
//         FadeInImage(
//           placeholder: AssetImage('assets/loading2.gif'),
//           image: NetworkImage('https://via.placeholder.com/500x300'),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }
