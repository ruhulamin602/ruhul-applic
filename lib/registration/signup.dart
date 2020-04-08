import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ghge/random_quote/home_page.dart';
import 'package:ghge/registration/singin.dart';
import 'package:validators/validators.dart';
import 'signin.dart';
import 'Success.dart';
import '../models/model.dart';
import 'dart:async';
import 'signupvalidator.dart';
import '../ContentPage.dart';
//class SecondRoute extends StatefulWidget {
//  @override
//  _SecondRouteState createState() => _SecondRouteState();
//}
//
//class _SecondRouteState extends State<SecondRoute> {
//  final _passwordFieldKey = new GlobalKey<FormFieldState<String>>();
//  final _formKey = new GlobalKey<FormFieldState<String>>();
//  String _password;
//  String _name;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Login page"),
//      ),
//      body: Form(
//        key: _formKey,
//        child: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              TextFormField(
//                decoration: const InputDecoration(
//                  icon: Icon(Icons.person),
//                  hintText: 'What do people call you?',
//                  labelText: 'Name *',
//                ),
//                onSaved: (String value) {
//                  setState(() {
//                    this._name = value;
//                  });
//                },
//                validator:
//              ),
//              PassWordField(
//                fieldKey: _passwordFieldKey,
//                helperText: 'No more than 16 cherecter',
//                lebelText: 'Password',
//                obActive: Icons.visibility,
//                obDeactive: Icons.visibility_off,
////                onFieldSubmitted: (String value) {
////                  setState(() {
////                    this._password = value;
////                  });
////                },
//                validator: (value) {
//                  if (value.length <= 6) {
//                    return 'Password Must contain atleast 6 cherecters';
//                  }
//                  return null;
//                },
//              ),
//              Padding(
//                padding: const EdgeInsets.symmetric(vertical: 16.0),
//                child: RaisedButton(
//                  onPressed: () {
//                    // Validate returns true if the form is valid, otherwise false.
////                    if (_formKey.currentState.validate()) {
//                      // If the form is valid, display a snackbar. In the real world,
//                      // you'd often call a server or save the information in a database.
//                        Fluttertoast.showToast(msg: 'Processing Data');
////                      Scaffold.of(context).showSnackBar(
////                          SnackBar(content: Text('Processing Data')));
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context)=>ContentPage()),
//                      );
////                    }
//                  },
//                  child: Text('Submit'),
//                ),
//              ),
////              Spacer(),
////              RaisedButton(
////                onPressed: () {
////                  Fluttertoast.showToast(
////                    msg: 'you are rederected to home page',
////                    backgroundColor: Colors.blue.withOpacity(0.1),
////                    textColor: Colors.indigo,
////                  );
////                  Navigator.pop(
////                    context,
////                  );
////                },
////                child: Text('Go back!'),
////              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class PassWordField extends StatefulWidget {
//  const PassWordField({
//    this.fieldKey,
//    this.hintText,
//    this.lebelText,
//    this.helperText,
//    this.onSaved,
//    this.validator,
//    this.onFieldSubmitted,
//    this.obActive,
//    this.obDeactive,
//  });
//  final Key fieldKey;
//  final String hintText;
//  final String lebelText;
//  final String helperText;
//  final FormFieldSetter<String> onSaved;
//  final FormFieldValidator<String> validator;
//  final ValueChanged<String> onFieldSubmitted;
//  final IconData obActive;
//  final IconData obDeactive;
//
//  @override
//  _passwordFieldState createState() => new _passwordFieldState();
//}
//
//// ignore: camel_case_types
//class _passwordFieldState extends State<PassWordField> {
//  bool _obsecureText = true;
//  @override
//  Widget build(BuildContext context) {
//    return new TextFormField(
//      key: widget.fieldKey,
//      obscureText: _obsecureText,
//      maxLength: 16,
//      onSaved: widget.onSaved,
//      validator: widget.validator,
//      onFieldSubmitted: widget.onFieldSubmitted,
//      decoration: new InputDecoration(
//          icon: Icon(Icons.lock_open),
//          border: const UnderlineInputBorder(),
//          filled: true,
//          hintText: widget.hintText,
//          labelText: widget.lebelText,
//          helperText: widget.helperText,
//          suffixIcon: new GestureDetector(
//              onTap: () {
//                setState(() {
//                  _obsecureText = !_obsecureText;
//                });
//              },
//              child: new Icon(
//                  _obsecureText ? widget.obActive : widget.obDeactive))),
//    );
//  }
//}
void main() => runApp(LogIn());

// ignore: camel_case_types
class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

// ignore: camel_case_types
class _LogInState extends State<LogIn> {
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
            title: Text('Sign Up'),
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
  Model model = Model();
  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    final pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//    final pattern2 = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])$';
//    final pattern3 = r'^(?=.*?[A-Z])(?=.*?[a-z])$';
//    final pattern4 = r'^(?=.*?[A-Z])$';
    // r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//    final regex = RegExp(pattern);
//    final regex2 = RegExp(pattern2);
//    final regex3 = RegExp(pattern3);
//    final regex4 = RegExp(pattern4);

//    String validatePassword(String value) {
//      Pattern pattern =
//          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//      RegExp regex = new RegExp(pattern);
//      print(value);
//      if (value.isEmpty) {
//        return 'Please enter password';
//      } else {
//        if (!regex.hasMatch(value))
//          return 'Enter valid password';
//        else
//          return null;
//      }
//    }
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
//                margin: EdgeInsets.only(
//                    top: MediaQuery.of(context).size.height / 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: halfMediaWidth,
                                    child: MyTextFormField(
                                      hintText: 'First Name',
                                      lebelText: 'First Name',
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Enter your first name';
                                        }
                                        return null;
                                      },
                                      onSaved: (String value) {
                                        model.firstName = value;
                                      },
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topCenter,
                                    width: halfMediaWidth,
                                    child: MyTextFormField(
                                      hintText: 'Last Name',
                                      lebelText: 'Last Name',
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Enter your last name';
                                        }
                                        return null;
                                      },
                                      onSaved: (String value) {
                                        model.lastName = value;
                                      },
                                    ),
                                  )
                                ],
                              ),
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
                            onSaved: (String value) {
                              model.email = value;
                            },
                          ),
                          PassFormField(
                            hintText: 'Password *',
                            lebelText: 'Password',
                            isPassword: true,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Enter a Password';
                              } else if (value.length < 8) {
                                return 'At least 8 Cherecter';
                              } else if (!RegExp(pattern).hasMatch(value)) {
                                return 'At least contain Spcl char, small & cap ltr & digit';
                              }

                              return null;
                            },
                            onSaved: (String value) {
                              model.password = value;
                            },
                          ),
                          PassFormField(
                            hintText: 'Confirm Password',
                            lebelText: 'Confirm Password',
                            isPassword: true,
                            // ignore: missing_return
                            validator: (String value) {
                              if (model.password != null &&
                                  value != model.password) {
                                print(value);
                                print(model.password);
                                return 'Password not matched';
                              }
                            },
                          ),
                          RaisedButton(
                            color: Colors.blueAccent,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                Fluttertoast.showToast(
                                  msg: "Your Data Has Been Sent",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.TOP,
                                );
                                Future.delayed(
                                  Duration(seconds: 3),
                                  () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                App()));
                                  },
                                );
                              } else {
                                return null;
                              }
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
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0.0),
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Text(
                'Already have a account?',
              ),
              RaisedButton(
                color: Colors.blueAccent,
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> SignIn()));
                },
                child: Text('Sign In',
                style: TextStyle(
                  color: Colors.white,
                ),),
              ),
            ],
          )),
        )
      ],
    );
  }
}

//class MyTextFormField extends StatefulWidget {
//  const MyTextFormField({
//    this.hintText,
//    this.validator,
//    this.onSaved,
//    this.isEmail = false,
//    this.fieldKey,
//    this.lebelText,
//    this.helperText,
//    this.onFieldSubmitted,
//    this.obActive,
//    this.obDeactive,
//    this.iconSub,
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
//  final IconData iconSub;
//  final bool isEmail;
//
//  @override
//  _MyTextFormFieldState createState() => _MyTextFormFieldState();
//}
//
//class _MyTextFormFieldState extends State<MyTextFormField> {
//  @override
//  Widget build(BuildContext context) {
//    bool _obscure = true;
//    return Padding(
//      padding: EdgeInsets.all(8.0),
//      child: TextFormField(
//        validator: widget.validator,
//        onSaved: widget.onSaved,
//        decoration: InputDecoration(
//            hintText: widget.hintText,
//            labelText: widget.lebelText,
//            border: UnderlineInputBorder(),
//            filled: true,
//            fillColor: Colors.blue.withOpacity(.2),
//            prefixIcon: new GestureDetector(
//                child:
//                    widget.isEmail ? Icon(Icons.email) : Icon(Icons.people))),
//        keyboardType:
//            widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
//      ),
//    );
//  }
//}


