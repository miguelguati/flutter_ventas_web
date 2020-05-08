import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:move_to_background/move_to_background.dart';


class LaunchPage extends StatefulWidget {
  const LaunchPage({Key key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> with WidgetsBindingObserver {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

   @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Esta función me refresca los datos cada vez que salgo de la aplicación y vuelvo a entrar
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    if(state == AppLifecycleState.resumed){
     // user returned to our app
     _launchURL();
    }
  }



  @override
  Widget build(BuildContext context) {

    _launchURL();

    return Scaffold(
      body: Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.ventasweb.com.co';
    if (await canLaunch(url)) {
      await launch(url);
      await Future.delayed(Duration(milliseconds: 550));
      MoveToBackground.moveTaskToBack();
    } else {
      throw 'Could not launch $url';
    }
  }
}