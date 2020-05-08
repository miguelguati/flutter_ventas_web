import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:move_to_background/move_to_background.dart';


class WebViewPage extends StatefulWidget {
  const WebViewPage({Key key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

WebViewController controllerGlobal;

Future<bool> _exitApp(BuildContext context) async {
  if (await controllerGlobal.canGoBack()) {
    print("onwill goback");
    controllerGlobal.goBack();
    return Future.value(false);
  } else {
    // Scaffold.of(context).showSnackBar(
    //   const SnackBar(content: Text("No back history item")),
    // );
    return Future.value(true);
  }
}


class _WebViewPageState extends State<WebViewPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{

        bool flag = await _exitApp(context);
        if(flag){
          MoveToBackground.moveTaskToBack();
        }
        return false;

        }, 
        child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor:  Color.fromRGBO(3, 15, 29, 0.9),
                centerTitle: true,
                //title: const Text('Ventas Web'),
                title: _appBar(),
                //This drop down menu demonstrates that Flutter widgets can be shown over the web view.
                //leading:NavigationControls(_controller.future),
                elevation: 0,
                titleSpacing: 0,
                // actions: <Widget>[

                //   NavigationControls(_controller.future),
                //   //Menu(_controller.future, () => _favorites),
                // ],
              ),
              body: WebView(
                initialUrl: 'https://www.ventasweb.com.co',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
              ),
          ),
        ),
    );
  }
  // Cremaoas nuestro appbar para poder colocar los iconos a la izquierda
  Widget _appBar(){
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              NavigationControls(_controller.future)
            ],
          ),
          SizedBox(width: 55,),
          Column(
            children: <Widget>[
              Text('Ventas Web')
            ],
          ),
        ],
      ),
    );
  }
  
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        controllerGlobal = controller;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 20),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller, goBack: true),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 20),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller, goBack: false),
            ),
          ],
        );
      },
    );
  }

  navigate(BuildContext context, WebViewController controller,
      {bool goBack: false}) async {
    bool canNavigate =
        goBack ? await controller.canGoBack() : await controller.canGoForward();
    if (canNavigate) {
      goBack ? controller.goBack() : controller.goForward();
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
            content: Text("No hay historial hacia ${goBack ? 'atras' : 'adelante'}")),
      );
    }
  }
}