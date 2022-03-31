import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dia = new DateTime.now();
    return Drawer(
      child: ListView(
        children: [
          // Icon(Icons.access_alarm),
          DrawerHeader(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text(
                    //   'Calzado',
                    //   style: GoogleFonts.pacifico(fontSize: 10),
                    // ),
                    Text(
                      '${DateFormat.yMMMMEEEEd('es_ES').format(dia)}',
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 11),
                    )
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'D\'Pao',
                      style: TextStyle(fontSize: 60),
                    )
                  ],
                )
              ],
            ),
            // decoration: ,
          ),
          ListTile(
            leading: Icon(Icons.people_outline, color: Color(0xff67ACF2)),
            title: Text('Home'),
            trailing:
                Icon(Icons.arrow_forward_ios_rounded, color: Color(0xff526BF6)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'home');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.grid_on_outlined, color: Color(0xff67ACF2)),
            title: Text('Tareas'),
            trailing:
                Icon(Icons.arrow_forward_ios_rounded, color: Color(0xff526BF6)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'tareasHomeScreen');
            },
          ),
          Divider(),
          ListTile(
            leading:
                Icon(Icons.airport_shuttle_sharp, color: Color(0xff67ACF2)),
            title: Text('Proveedores'),
            trailing:
                Icon(Icons.arrow_forward_ios_rounded, color: Color(0xff526BF6)),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.pushNamed(context, 'proveedores');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.analytics_outlined, color: Color(0xff67ACF2)),
            title: Text('Productos'),
            trailing:
                Icon(Icons.arrow_forward_ios_rounded, color: Color(0xff526BF6)),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.pushNamed(context, 'tareas2');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list_alt, color: Color(0xff67ACF2)),
            title: Text('Historial'),
            trailing:
                Icon(Icons.arrow_forward_ios_rounded, color: Color(0xff526BF6)),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.pushNamed(context, 'tabBar');
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
