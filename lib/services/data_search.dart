import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  List<String> names = [
    'Abdallah',
    'Saad',
    'Mahmoud',
    'Mostafa',
    'Abuzead',
    'Wessam',
    'Ibrahim',
    'Elshazly',
    'Wafaa',
    'Yasser',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    bool hasQuery = query != '';
    List filteredNames = names.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: hasQuery ? filteredNames.length : names.length,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            query = filteredNames[i];
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              hasQuery ? filteredNames[i] : names[i],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      },
    );
  }
}
