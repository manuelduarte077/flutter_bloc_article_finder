import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:article_finder/bloc/bloc.dart';
import 'package:article_finder/data/article.dart';
import 'package:article_finder/data/rw_client.dart';

class ArticleListBloc implements Bloc {
  /// This line creates instance of RWClient to communicate with raywenderlich.com based on HTTP protocol.
  final _client = RWClient();

  /// The code gives a private `StreamController` declaration. It will manage the input sink for this BLoC. StreamControllers use generics to tell the type system what kind of object the stream will emit.
  final _searchQueryController = StreamController<String?>();

  /// `Sink<String?>` is a public sink interface for your input controller `_searchQueryController`. You’ll use this sink to send events to the BLoC.
  Sink<String?> get searchQuery => _searchQueryController.sink;

  /// `articlesStream` stream acts as a bridge between ArticleListScreen and `ArticleListBloc`. Basically, the BLoC will stream a list of articles onto the screen. You’ll see late syntax here. It means you have to initialize the variable in the future before you first use it. The late keyword helps you avoid making these variables as null type.
  late Stream<List<Article>?> articlesStream;

  ArticleListBloc() {
    /// This code processes the input queries sink and build an output stream with a list of articles. asyncMap listens to search queries and uses the RWClient class from the starter project to fetch articles from the API. It pushes an output event to articlesStream when fetchArticles completes with some result.
    articlesStream = _searchQueryController.stream

        /// `startWith(null)` produces an empty query to start loading all articles. If the user opens the search for the first time and doesn’t enter any query, they see a list of recent articles.
        .startWith(null)
        .debounceTime(const Duration(milliseconds: 100))

        /// `DebounceTime` skips queries that come in intervals of less than 100 milliseconds. When the user enters characters, TextField sends multiple onChanged{} events. debounce skips most of them and returns the last keyword event.

        .switchMap(
          ///Replace `asyncMap` with `switchMap`. These operators are similar, but switchMap allows you to work with other streams.
          (query) => _client
              .fetchArticles(query)
              .asStream() // 4: Convert Future to Stream
              .startWith(null),

          /// `startWith(null)` at this line sends a null event to the article output at the start of every fetch request. So when the user completes the search query, UI erases the previous list of articles and shows the widget’s loading. It happens because _buildResults in article_list_screen.dart listens to your stream and displays a loading indicator in the case of null data.
        );
  }

  /// Finally, in the cleanup method, you close StreamController. If you don’t do this, the IDE complains that the StreamController is leaking.
  @override
  void dispose() {
    _searchQueryController.close();
  }
}
