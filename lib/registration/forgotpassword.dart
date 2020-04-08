import 'package:flutter/material.dart';
import 'package:ghge/registration/signin.dart';
import 'package:validators/validators.dart';
import 'signupvalidator.dart';

void main() => runApp(ForgotPass());

// ignore: camel_case_types
class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

// ignore: camel_case_types
class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
              0,
              1
            ],
                colors: [
              Colors.blue,
              Colors.white,
            ])),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Reset Password'),
            backgroundColor: Colors.deepPurple,
          ),
          body: ForgotForm(),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class ForgotForm extends StatefulWidget {
  @override
  _ForgotFormState createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
              ),
              //  height: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * .08,
                        horizontal: 0.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Image.asset(
                      "images/logo_romoni1.png",
                      width: MediaQuery.of(context).size.width * .33,
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(0),
                            ),
                          ),
                          MyTextFormField(
                            hintText: 'Email ',
                            lebelText: 'Email*',
                            isEmail: true,
                            validator: (String value) {
                              if (!isEmail(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            onSaved: (String value) {},
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              child: Text("Go back to Login Page ",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue)),
                              onTap: () {
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                });
                              },
                            ),
                          ),
//                          Container(
//                            padding: EdgeInsets.only(right: 10),
//                            alignment: Alignment.centerRight,
//                            child: GestureDetector(
//                              child: Text("Forget pasword?",
//                                  style: TextStyle(
//                                      decoration: TextDecoration.underline,
//                                      color: Colors.blue)),
//                              onTap: () {
//                                Future.delayed(Duration(seconds: 3), () {
//                                  Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) =>
//                                              forgotpassword()));
//                                });
//                              },
//                            ),
//                          ),
                          RaisedButton(
                            color: Colors.pink,
                            onPressed: () {
                              _formKey.currentState.validate();
                              _formKey.currentState.validate();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
                            },
                            child: Text(
                              'Send Password reset link',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              )),
        )
      ],
    );
  }
}
