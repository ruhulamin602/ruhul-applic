import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ghge/registration/signup.dart';
import 'signupvalidator.dart';
import '../models/model.dart';
import 'Success.dart';
import 'forgotpassword.dart';
import 'package:validators/validators.dart';

void main() => runApp(SignIn());

// ignore: camel_case_types
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

// ignore: camel_case_types
class _SignInState extends State<SignIn> {
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
            title: Text('Sign in'),
            backgroundColor: Colors.deepPurple,
          ),
          body: TestForm(),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 14,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
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
                          PassFormField(
                            hintText: 'Password *',
                            lebelText: 'Password',
                            isPassword: true,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter a Password';
                              }
                              return null;
                            },
                            onSaved: (String value) {},
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              child: Text("Forget pasword?",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue)),
                              onTap: () {
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ForgotPass()));
                                });
                              },
                            ),
                          ),
                          RaisedButton(
                            color: Colors.blueAccent,
                            onPressed: () {
                              _formKey.currentState.validate();
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Create Account?',
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>LogIn()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

//

//class PassFormField extends StatefulWidget {
//  const PassFormField({
//    this.hintText,
//    this.validator,
//    this.onSaved,
//    this.fieldKey,
//    this.lebelText,
//    this.helperText,
//    this.onFieldSubmitted,
//    this.obActive,
//    this.obDeactive,
//    this.isPassword,
//  });
//
//  final Key fieldKey;
//  final String hintText;
//  final String lebelText;
//  final String helperText;
//  final FormFieldSetter<String> onSaved;
//  final FormFieldValidator<String> validator;
//  final ValueChanged<String> onFieldSubmitted;
//  final IconData obActive;
//  final IconData obDeactive;
//  final bool isPassword;
//
//  @override
//  _PassFormFieldState createState() => _PassFormFieldState();
//}
//
//class _PassFormFieldState extends State<PassFormField> {
//  bool _obscure = true;
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: EdgeInsets.all(8),
//      child: TextFormField(
//        obscureText: _obscure,
//        validator: widget.validator,
//        onSaved: widget.onSaved,
//        decoration: InputDecoration(
//            focusColor: Colors.redAccent,
//            hintText: widget.hintText,
//            labelText: widget.lebelText,
//            border: UnderlineInputBorder(
//                borderSide: BorderSide(color: Colors.black)),
//            filled: true,
//            fillColor: Colors.blueAccent.withOpacity(.2),
//            prefixIcon: new GestureDetector(
//                child: widget.isPassword
//                    ? Icon(Icons.lock)
//                    : Icon(Icons.nature_people)),
//            suffixIcon: new GestureDetector(
//                onTap: () {
//                  setState(() {
//                    _obscure = !_obscure;
//                  });
//                },
//                child: new Icon(
//                    _obscure ? Icons.visibility : Icons.visibility_off))),
//      ),
//    );
//  }
//}
