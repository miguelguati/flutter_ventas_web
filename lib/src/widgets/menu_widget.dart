import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
    
      child: ListView(
        
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/logo1.jpg'),
                //fit: BoxFit.cover
                )
            ),
            ),
            ListTile(
              leading: Icon(Icons.settings, color:Colors.blue),
              title: Text('Configuración'),
              onTap: ()=> Navigator.pushNamed(context, 'settings'),
            ),
        ],
      ),
    );;
  }
}