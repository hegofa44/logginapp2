import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logginapp2/models/models.dart';
import 'package:logginapp2/screens/screens.dart';
import 'package:logginapp2/services/services.dart';
import 'package:logginapp2/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TareasHomeScreen extends StatelessWidget {
  // final Cart usuario;

  // const HomeScreen(this.usuario);
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsServices>(context);
    final numero1 = Provider.of<NotificationCart>(context);
    // final cart = Provider.of<CartService>(context);
    final cartShoppingService = Provider.of<CartService>(context);

    // if (productsService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        flexibleSpace: Stack(
          children: [
            Container(
              // height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.centerLeft,
                  begin: Alignment.topRight,
                  colors: [
                    Colors.redAccent,
                    Color(0xff23BAE2),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -20,
              left: -100,
              child: FaIcon(
                FontAwesomeIcons.angellist,
                size: 300,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 0,
              right: 30,
              child: FaIcon(
                FontAwesomeIcons.angellist,
                size: 200,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ],
        ),
        // actions: [
        //   IconButton(
        //       icon: Stack(
        //         children: [
        //           Icon(Icons.shopping_cart_outlined),
        //           Positioned(
        //             top: 0.0,
        //             right: 0.0,
        //             child: cartShoppingService.existeUsuario
        //                 ? Container(
        //                     child: Contador(cartShoppingService.usuario),
        //                     alignment: Alignment.center,
        //                     width: 12,
        //                     height: 12,
        //                     decoration: BoxDecoration(
        //                         color: Colors.redAccent,
        //                         shape: BoxShape.circle),
        //                   )
        //                 : Container(),
        //           )
        //         ],
        //       ),
        //       onPressed: () {
        //         Navigator.pushNamed(context, 'shoppingCart');
        //       })
        // ],
        title: Text(
          'Agregar Tareas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MenuDrawer(),
      body: FadeInLeft(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 4.5 / 5,
            crossAxisSpacing: 1,
            mainAxisSpacing: 12,
          ),
          itemCount: productsService.products.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {
              final idSizeColorConexion =
                  Provider.of<SizeColorConexion>(context, listen: false);
              idSizeColorConexion.reset = false;
              productsService.selectedProduct =
                  productsService.products[index].copy();
              Navigator.pushNamed(context, 'tareasProductScreen');
            },
            child: ProductCard(
              product: productsService.products[index],
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(150, 40)),
        child: Text('Agregar Modelo'),
        onPressed: () {
          Navigator.pushNamed(context, 'addProducts');
          productsService.selectedProduct = new Product(
            disponible: true,
          );
        },
      ),
    );
  }
}

class Contador extends StatelessWidget {
  final Cart usuario;

  const Contador(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${usuario.colores!.length}',
      style: TextStyle(color: Colors.white, fontSize: 10),
    );
  }
}
