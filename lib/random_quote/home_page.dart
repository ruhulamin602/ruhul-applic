import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghge/registration/signin.dart';
import 'package:ghge/registration/signin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../bloc/bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state) {
        if (state is QuoteEmpty) {
          BlocProvider.of<QuoteBloc>(context).add(FetchQuote());
        }
        if (state is QuoteError) {
          return Center(
            child: Text('failed to fetch quote'),
          );
        }
        if (state is QuoteLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
//            leading: Text(
//              '${state.quote.id}',
//              style: TextStyle(fontSize: 10.0),
//            ),
                title: Text(
                  state.quote.quoteText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                isThreeLine: true,
                subtitle: Text(
                  state.quote.quoteAuthor,
                  textAlign: TextAlign.right,
                ),
                dense: true,
              ),
            ],
          );
        }
        return Center(
          child: SpinKitWave(
            color: Colors.blue,
            size: 50,
            type: SpinKitWaveType.end,
          ),
        );
      },
    );
  }
}
