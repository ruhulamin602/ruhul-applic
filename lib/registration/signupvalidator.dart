import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class PassFormField extends StatefulWidget {
  const PassFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.fieldKey,
    this.lebelText,
    this.helperText,
    this.onFieldSubmitted,
    this.obActive,
    this.obDeactive,
    this.isPassword,
  });

  final Key fieldKey;
  final String hintText;
  final String lebelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final IconData obActive;
  final IconData obDeactive;
  final bool isPassword;

  @override
  _PassFormFieldState createState() => _PassFormFieldState();
}

class _PassFormFieldState extends State<PassFormField> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: _obscure,
        validator: widget.validator,
        onSaved: widget.onSaved,
        decoration: InputDecoration(
            focusColor: Colors.redAccent,
            hintText: widget.hintText,
            labelText: widget.lebelText,
            contentPadding: EdgeInsets.all(5),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            filled: true,
            fillColor: Colors.blue.withOpacity(.2),
            prefixIcon: new GestureDetector(
                child: widget.isPassword
                    ? Icon(Icons.lock)
                    : Icon(Icons.nature_people)),
            suffixIcon: new GestureDetector(
                onTap: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
                child: new Icon(
                    _obscure ? Icons.visibility : Icons.visibility_off))),
      ),
    );
  }
}
class MyTextFormField extends StatefulWidget {
  const MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isEmail = false,
    this.fieldKey,
    this.lebelText,
    this.helperText,
    this.onFieldSubmitted,
    this.obActive,
    this.obDeactive,
    this.iconSub,
  });

  final Key fieldKey;
  final String hintText;
  final String lebelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final IconData obActive;
  final IconData obDeactive;
  final IconData iconSub;
  final bool isEmail;

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        validator: widget.validator,
        onSaved: widget.onSaved,
        decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: widget.lebelText,
            contentPadding: EdgeInsets.all(5),
            border: UnderlineInputBorder(),
            filled: true,
            fillColor: Colors.blue.withOpacity(.2),
            prefixIcon: new GestureDetector(
                child:
                    widget.isEmail ? Icon(Icons.email) : Icon(Icons.people))),
        keyboardType:
            widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}