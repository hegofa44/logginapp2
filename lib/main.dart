import 'package:flutter/material.dart';
import 'package:logginapp2/providers/tallas_form_provider.dart';
import 'package:logginapp2/screens/tareas/add_new_color.dart';
// import 'package:logginapp2/models/models.dart';
import 'package:logginapp2/screens/tareas/home_tareas.dart';
import 'package:logginapp2/screens/screens.dart';
import 'package:logginapp2/screens/shopping_cart_2.dart';
import 'package:logginapp2/screens/tareas/tareas_cart.dart';
import 'package:logginapp2/screens/tareas/tareas_product_screen.dart';
import 'package:logginapp2/services/service_new_tareas.dart';
import 'package:logginapp2/services/services.dart';
import 'package:logginapp2/services/sizes_colors_conexion.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logginapp2/services/tareas_cart_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsServices()),
        ChangeNotifierProvider(create: (_) => SizeColorConexion()),
        ChangeNotifierProvider(create: (_) => CartService()),
        ChangeNotifierProvider(create: (_) => NotificationCart()),
        ChangeNotifierProvider(create: (_) => ColorsService()),
        ChangeNotifierProvider(create: (_) => SizesService()),
        ChangeNotifierProvider(create: (_) => CartTareasService()),
        ChangeNotifierProvider(create: (_) => TareasService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
      ],
      title: 'Productos App',
      initialRoute: 'home',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'product': (_) => ProductScreen(),
        'shoppingCart': (_) => ShoppingCartScreen(),
        'shoppingCart2': (_) => ShoppingCartScreen2(),
        'addProducts': (_) => AddProductsScreen(),
        'tareasHomeScreen': (_) => TareasHomeScreen(),
        'tareasProductScreen': (_) => TareasProductScreen(),
        'addNewColorScreen': (_) => AddNewColorScreen(),
        'tareasCartScreen': (_) => TareasCartScreen(),
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.indigo,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.indigo,
            elevation: 0,
          )),
    );
  }
}
