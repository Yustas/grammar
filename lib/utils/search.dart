import 'package:flutter/material.dart';
import 'package:mova/i18n/ua.dart';
import 'package:mova/repository/content.dart';
import 'package:mova/models/search_data.dart';
import 'package:mova/widgets/error.dart';
import 'package:mova/widgets/loading.dart';
import 'package:mova/widgets/search_list.dart';

class ContentSearchDelegate extends SearchDelegate {
  ContentSearchDelegate() : super(searchFieldLabel: SEARCH_TITLE);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query.isEmpty ? close(context, null) : query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: Text('поки нічого не знайдено ', style: TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final Future<List<SearchData>> searchData = findContent(needle: query);

    return FutureBuilder<List<SearchData>>(
      future: searchData,
      builder: (BuildContext context, AsyncSnapshot<List<SearchData>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return SearchList(results: snapshot.data!);
          } else {
            return const Center(
              child: Text('поки нічого не зайдено', style: TextStyle(fontSize: 24)),
            );
          }
        } else if (snapshot.hasError) {
          return Error(message: 'Error: ${snapshot.error}');
        } else {
          return const Loading();
        }
      },
    );
  }
}

void search(BuildContext context, String needle) {
  showSearch(
      context: context,
      delegate: ContentSearchDelegate(),
      query: needle
  );
}
