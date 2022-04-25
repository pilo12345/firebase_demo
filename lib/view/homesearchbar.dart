import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("search"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(),
    );
  }
}
