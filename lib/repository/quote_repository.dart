import 'dart:async';

import 'package:meta/meta.dart';

import 'package:ghge/repository/quote_api_clint.dart';
import 'package:ghge/models/model.dart';

class QuoteRepository {
  final QuoteApiClient quoteApiClient;

  QuoteRepository({@required this.quoteApiClient})
      : assert(quoteApiClient != null);

  Future<Quote> fetchQuote() async {
    return await quoteApiClient.fetchQuote();
  }
}