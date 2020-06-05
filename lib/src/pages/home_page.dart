import 'package:flutter/material.dart';
import 'package:ventasweb/src/pages/launch_page.dart';
import 'package:ventasweb/src/preferences/preferencias_usuario.dart';
import 'package:ventasweb/src/widgets/menu_widget.dart';


class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(65, 191, 241, 1),
          title: Text('Bienvenido, ${prefs.nombre}'),
        ),
        body: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _pagina1(context),
            _pagina2(context)
          ],
        ),
        drawer: MenuWidget(),
      ),
    );
  }

  Widget _pagina1(BuildContext context){

    return Stack(
      children: <Widget>[
        _fondo(),
        _textos()
      ],
    );

  }

  Widget _fondo(){
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO(238, 238, 238, 1),
      child: Image(
        image: AssetImage('assets/img/wallper.jpg'),
        fit: BoxFit.cover,
        ),
    );
  }
  
  Widget _textos() {
    return  Column(
            children:<Widget>[
              SizedBox(height: 140,),
              Text(
                      '¡Encuentra Los Mejores Descuentos!',
                      style: TextStyle(fontFamily: 'RobotoMono', fontSize:21, fontWeight: FontWeight.bold ),
                    ),
              Expanded(child: Container()),
              // SizedBox(height: 12,),
              // Container(
              //   width: 100,
              //   child: Image(
              //     image: AssetImage('assets/img/logo1.jpg') 
              //   ),
              // ),
              Text('¡Vamos Ahora!', style: TextStyle( color: Colors.black38 ),),
              Icon(Icons.keyboard_arrow_up, size:70, color: Color.fromRGBO(65, 191, 241, 1),)       
            ]
            
    );
  }

   Widget _pagina2(BuildContext context){

    return LaunchPage();

  }

  // Widget _crearBoton(BuildContext context){
  //   return RaisedButton(
  //         child: Container(
  //           padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
  //           child: Text('Visitar Sitio'),
  //         ),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(5.0)
  //         ),
  //         elevation: 0.0,
  //         color: Color.fromRGBO(65, 191, 241, 1),
  //         textColor: Colors.white,
  //         onPressed: ()=> Navigator.pushNamed(context, 'launch')
  //       );
  // }

}