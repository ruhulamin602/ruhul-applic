import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'registration/signup.dart';

void main() => runApp(MyApp());

// ignore: camel_case_types
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Home Page Extended App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  int _counter = 0;
//  final _showToast = () => Fluttertoast.showToast(
//        msg: "you're going to login page",
//        toastLength: Toast.LENGTH_LONG,
//        gravity: ToastGravity.TOP,
//      );
//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }
//
//  void _decrementCounter() {
//    setState(() {
//      _counter--;
//    });
//  }
//
//  void _resetCounter() {
//    setState(() {
//      _counter = 0;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 100.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(.25),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Image.asset(
                "images/logo_romoni1.png",
                width: 100.0,
              ),
            ),
            RaisedButton(
              color: Colors.purple,
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "you're going to login page",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.TOP,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              },
            ),

//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//            Row(
//              // new
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                // new
//                //     RaisedButton(
//                //     color: Colors.red,
//                //     child: Text(
//                //     "Decrement",
//                //     style: TextStyle(color: Colors.white),
//                //     ),
//                //     onPressed: _decrementCounter,
//                //     ),
//
//                RaisedButton(
//                  color: Colors.indigo,
//                  child: Text(
//                    "Decrement",
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  onPressed: () {
//                    _decrementCounter();
//                    final snackBar = SnackBar(
//                      content: Icon(Icons.security),
//                      duration: Duration(seconds: 1),
//                    );
//                    _scaffoldkey.currentState.showSnackBar(snackBar);
//                  },
//                ),
//                RaisedButton(
//                  color: Colors.red[400],
//                  onPressed: () {
//                    _incrementCounter();
//                    final snackBar =
//                        SnackBar(content: Icon(Icons.sentiment_satisfied));
//                    _scaffoldkey.currentState.showSnackBar(snackBar);
//                  },
//                  child: Text("increase"),
//                  textColor: Colors.white,
//                ),
//              ], // new
//            ), // ne
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Drawer header',
                style: TextStyle(
                  color: Colors.black87,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
                backgroundBlendMode: BlendMode.multiply,
              ),
            ),
            ListTile(
              title: Text('Banana'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Mango'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Apple'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          _resetCounter();
//          final snackBar = SnackBar(
//            content: Icon(Icons.settings_backup_restore),
//            duration: Duration(microseconds: 700),
//          );
//          _scaffoldkey.currentState.showSnackBar(snackBar);
//        },
//        tooltip: 'Reset',
//        child: Icon(Icons.refresh),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
// _displaySnackBar(BuildContext context){
//   final snackBar = SnackBar(content: Icon(Icons.security));
//   _scaffoldkey.currentState.showSnackBar(snackBar);
// }
}
