import 'package:flutter/material.dart';
import 'package:ventasweb/src/pages/launch_page.dart';
import 'package:ventasweb/src/pages/webView_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ventas Web',
      debugShowCheckedModeBanner: false,
      initialRoute: 'launch',
      routes: {
        'webView': (BuildContext context) => WebViewPage(),
        'launch': (BuildContext context) => LaunchPage(),
      },

    );
  }
}