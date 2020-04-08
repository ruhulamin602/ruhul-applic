//import 'dart:ui';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:ghge/registration/signin.dart';
//import 'Home.dart';
//import 'registration/signup.dart';
//import 'dart:async';
//
//void main() {
//  runApp(MaterialApp(home: SplashScreen()));
//}
//
//class SplashScreen extends StatefulWidget {
//  @override
//  _SplashScreenState createState() => _SplashScreenState();
//}
//
//class _SplashScreenState extends State<SplashScreen> {
//  @override
//  void initState() {
//    super.initState();
//    Future.delayed(Duration(seconds: 3), () {
//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (context) => SignIn()));
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      margin: EdgeInsets.all(0),
//      padding: EdgeInsets.all(50),
//      decoration: BoxDecoration(
//        color: Colors.blueAccent.withOpacity(1),
//      ),
//      child: SpinKitWave(
//        color: Colors.white,
//        size: 50,
//        type: SpinKitWaveType.end,
//      ),
//    );
//  }
//}
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'package:ghge/repository/repository.dart';
import 'package:ghge/repository/quote_api_clint.dart';
import 'package:ghge/random_quote/home_page.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final QuoteRepository repository = QuoteRepository(
    quoteApiClient: QuoteApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(
    repository: repository,
  ));
}

class App extends StatefulWidget {
  final QuoteRepository repository;

  App({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      home: Scaffold(
        backgroundColor: Colors.pink,
        body: BlocProvider(
          create: (context) => QuoteBloc(repository: widget.repository),
          child: HomePage(),
        ),
      ),
    );
  }
}