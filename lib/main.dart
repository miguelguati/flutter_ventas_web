import 'package:flutter/material.dart';
import 'package:ventasweb/src/pages/home_page.dart';
import 'package:ventasweb/src/pages/launch_page.dart';
import 'package:ventasweb/src/pages/login_page.dart';
import 'package:ventasweb/src/pages/settings_page.dart';
import 'package:ventasweb/src/pages/webView_page.dart';
import 'package:ventasweb/src/preferences/preferencias_usuario.dart';
 
final prefs = new PreferenciasUsuario();

void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await prefs.initPrefs();
  print("Nombre user: "+prefs.nombre);
  runApp(MyApp());

} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ventas Online',
      debugShowCheckedModeBanner: false,
      initialRoute: 'launch',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'webView': (BuildContext context) => WebViewPage(),
        'launch': (BuildContext context) => LaunchPage(),
        'home': (BuildContext context) => HomePage(),
        'settings': (BuildContext context) => SettingsPage(),
      },

    );
  }
}