import 'package:article_finder/bloc/article_list_bloc.dart';
import 'package:article_finder/bloc/bloc_provider.dart';
import 'package:article_finder/data/article.dart';
import 'package:article_finder/ui/article_list_item.dart';
import 'package:flutter/material.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// First, the app instantiates a new ArticleListBloc at the top of the build method. Here, BlocProvider helps to find the required BLoC from the widget tree.
    final bloc = BlocProvider.of<ArticleListBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search ...',
              ),

              /// It updates TextField‘s onChanged to submit the text to ArticleListBloc. bloc.searchQuery.add is a void add(T) function of the Sink class.  This kicks off the chain of calling RWClient and then emits the found articles to the stream.
              onChanged: bloc.searchQuery.add,
            ),
          ),
          Expanded(
            /// It passes the BLoC to the _buildResults method.
            child: _buildResults(bloc),
          ),
        ],
      ),
    );
  }

  Widget _buildResults(ArticleListBloc bloc) {
    /// 1: StreamBuilder defines the stream property using ArtliceListBloc to understand where to get the article list.
    return StreamBuilder<List<Article>?>(
      stream: bloc.articlesStream,
      builder: (context, snapshot) {
        /// 2: Initially, the stream has no data, which is normal. If there isn’t any data in your stream, the app displays the Loading… message. If there’s an empty list in your stream, the app displays the No Results message.
        final results = snapshot.data;
        if (results == null) {
          return const Center(child: Text('Loading ...'));
        } else if (results.isEmpty) {
          return const Center(child: Text('No Results'));
        }

        /// 3: It passes the search results into the regular method.
        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<Article> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final article = results[index];
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            /// 1: ArticleListItem is an already defined widget that shows details of articles in the list.
            child: ArticleListItem(article: article),
          ),

          /// 2: The onTap closure redirects the user to an article’s details page.
          onTap: () {
            // TODO: Later Will be implemented
          },
        );
      },
    );
  }
}
