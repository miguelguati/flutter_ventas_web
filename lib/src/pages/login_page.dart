import 'package:flutter/material.dart';
import '../../utils/utils.dart' as utils;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  String _user = "";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(65, 191, 241, 1),
      body: Stack(
        children: <Widget>[
          _crearFondo( context ),
          _loginForm( context ),
        ],
      )
    );
  }

  Widget _crearFondo(BuildContext context){
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .5,
      width: double.infinity,
      child: Image(
        image: AssetImage('assets/img/store.jpg'),
        fit: BoxFit.cover,
        )

    );
  }

  Widget _loginForm(BuildContext context) {

    //final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container(
              height: 210.0,
            ),
          ),

          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric( vertical: 50.0 ),
            
            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.9),
                      Color.fromRGBO(255, 255, 255, 0.95),
                    ]
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0
                    )
                  ]
                ),
            child: Column(
              children: <Widget>[
                //Logo de la empresa
                Container(
                  child: Column(
                    children: <Widget>[
                      Image(
                        width: 200.0,
                        image: AssetImage('assets/img/logo1.jpg'),
                        fit: BoxFit.cover,
                      ),
                      SizedBox( height: 8.0 ),
                    ],
                  ),
                ),
                _usuario(),
                SizedBox( height: 25.0 ),
                _crearBoton()
              ],
            ),
          ),

        ],
      ),
    );

  }

  Widget _usuario(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
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

      );
  }

  Widget _crearBoton(){
    return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Color.fromRGBO(65, 191, 241, 1),
          textColor: Colors.white,
          onPressed: ()=> _validUser(context)
        );
  }

  _validUser(BuildContext context){

    if(_user.trim() == ""){
      utils.mostrarAlerta(context, 'El campo usuario no debe estar vacio');
    }else if(_user.trim().length < 4){

      utils.mostrarAlerta(context, 'El usuario debe ser mayor de 4 caracters');
    }else{
      print('Success '+_user);
    }
  }

}