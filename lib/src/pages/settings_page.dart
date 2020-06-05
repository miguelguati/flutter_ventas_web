import 'package:flutter/material.dart';
import 'package:ventasweb/src/preferences/preferencias_usuario.dart';
import '../../utils/utils.dart' as utils;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final prefs = new PreferenciasUsuario();
  String _user = "";
  TextEditingController _textController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _textController = new TextEditingController( text: prefs.nombre );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
        backgroundColor: Color.fromRGBO(65, 191, 241, 1),
      ),
      body:  Container(
          child: _form(context)
      ),
      
    );
  }

  Widget _form(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Text('Cambiar Nombre Usuario', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),),
          SizedBox(height: 40,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon( Icons.account_circle, color: Color.fromRGBO(65, 191, 241, 1) ),
                hintText: 'Usuario',
                labelText: 'Usuario',
              ),
              onChanged: (value){
                setState(() {
                  _user = value; 
                });
              },
            ),
          ),
          SizedBox(height: 20,),
          RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
              child: Text('Guardar'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            ),
            elevation: 0.0,
            color: Color.fromRGBO(65, 191, 241, 1),
            textColor: Colors.white,
            onPressed: ()=> _validUser(context)
          )
        ],
      ),
    );
  }

  _validUser(BuildContext context){

    if(_user.trim() == ""){
      utils.mostrarAlerta(context, 'El campo usuario no debe estar vacio');
    }else if(_user.trim().length < 4 || _user.trim().length > 15){

      utils.mostrarAlerta(context, 'El usuario debe ser mayor de 4 caracters y menor a 15 caracteres');
    }else{
      prefs.nombre = _user.toUpperCase();
      Navigator.pushNamed(context, 'home');
    }
  }
}